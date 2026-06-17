-- Step 10: uspRandomizePatient 
-- --------------------------------------------------------------------------------
IF OBJECT_ID('uspRandomizePatient','P') IS NOT NULL DROP PROCEDURE uspRandomizePatient;
GO

CREATE PROCEDURE uspRandomizePatient
      @intPatientID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRAN;

    DECLARE
          @intSiteID INT
        , @intStudyID INT
        , @AlreadyRandomized INT
        , @strTreatment CHAR(1)
        , @intRandomCodeID INT
        , @ActiveCount INT
        , @PlaceboCount INT
        , @rand FLOAT
        , @intVisitID INT
        , @intDrugKitID INT;

    ---------------------------------------------------------------------
    -- 1. Get patient's site + study
    ---------------------------------------------------------------------
    SELECT
          @intSiteID  = P.intSiteID
        , @intStudyID = S.intStudyID
    FROM TPatients P
    JOIN TSites S ON S.intSiteID = P.intSiteID
    WHERE P.intPatientID = @intPatientID;

    IF @intSiteID IS NULL
    BEGIN
        RAISERROR('Invalid patient ID.', 16, 1);
        ROLLBACK TRAN;
        RETURN;
    END;

    ---------------------------------------------------------------------
    -- 2. Prevent double randomization
    ---------------------------------------------------------------------
    SELECT @AlreadyRandomized = COUNT(*)
    FROM TVisits
    WHERE intPatientID = @intPatientID
      AND intVisitTypeID = 2;

    IF @AlreadyRandomized > 0
    BEGIN
        RAISERROR('Patient is already randomized.', 16, 1);
        ROLLBACK TRAN;
        RETURN;
    END;

    ---------------------------------------------------------------------
    -- 3. INTERNAL RANDOM CODE LOGIC
    ---------------------------------------------------------------------

    IF @intStudyID = 1  -- Study 12345: Sequential pick list
    BEGIN
        SELECT TOP 1
              @intRandomCodeID = RC.intRandomCodeID
            , @strTreatment    = RC.strTreatment
        FROM TRandomCodes RC
        WHERE RC.intStudyID = 1
          AND RC.blnAvailable = 'T'
        ORDER BY RC.intRandomCodeID;

        IF @intRandomCodeID IS NULL
        BEGIN
            RAISERROR('No random codes available for Study 12345.', 16, 1);
            ROLLBACK TRAN;
            RETURN;
        END;

        UPDATE TRandomCodes
        SET blnAvailable = 'F'
        WHERE intRandomCodeID = @intRandomCodeID;
    END;

    IF @intStudyID = 2  -- Study 54321: Random generator ±2 balance
    BEGIN
        SELECT @ActiveCount =
            (SELECT COUNT(*)
             FROM TPatients P
             JOIN TRandomCodes RC ON RC.intRandomCodeID = P.intRandomCodeID
             WHERE RC.intStudyID = 2 AND RC.strTreatment = 'A');

        SELECT @PlaceboCount =
            (SELECT COUNT(*)
             FROM TPatients P
             JOIN TRandomCodes RC ON RC.intRandomCodeID = P.intRandomCodeID
             WHERE RC.intStudyID = 2 AND RC.strTreatment = 'P');

        SET @rand = RAND();

        IF @ActiveCount - @PlaceboCount >= 2
            SET @strTreatment = 'P';
        ELSE IF @PlaceboCount - @ActiveCount >= 2
            SET @strTreatment = 'A';
        ELSE
            SET @strTreatment = CASE WHEN @rand <= 0.5 THEN 'A' ELSE 'P' END;

        SELECT TOP 1
              @intRandomCodeID = RC.intRandomCodeID
        FROM TRandomCodes RC
        WHERE RC.intStudyID = 2
          AND RC.strTreatment = @strTreatment
          AND RC.blnAvailable = 'T'
        ORDER BY RC.intRandomCodeID;

        IF @intRandomCodeID IS NULL
        BEGIN
            RAISERROR('No random codes available for selected treatment.', 16, 1);
            ROLLBACK TRAN;
            RETURN;
        END;

        UPDATE TRandomCodes
        SET blnAvailable = 'F'
        WHERE intRandomCodeID = @intRandomCodeID;
    END;

    ---------------------------------------------------------------------
    -- 4. Insert randomization visit
    ---------------------------------------------------------------------
    SELECT @intVisitID = ISNULL(MAX(intVisitID),0)+1 FROM TVisits;

    INSERT INTO TVisits
          ( intVisitID
          , intPatientID
          , dtmVisit
          , intVisitTypeID
          , intWithdrawReasonID )
    VALUES
          ( @intVisitID
          , @intPatientID
          , GETDATE()
          , 2         -- Randomization
          , NULL );

    ---------------------------------------------------------------------
    -- 5. Update patient with random code
    ---------------------------------------------------------------------
    UPDATE TPatients
    SET intRandomCodeID = @intRandomCodeID
    WHERE intPatientID = @intPatientID;

    ---------------------------------------------------------------------
    -- 6. Assign drug kit
    ---------------------------------------------------------------------
    SELECT TOP 1
          @intDrugKitID = DK.intDrugKitID
    FROM TDrugKits DK
    WHERE DK.intSiteID = @intSiteID
      AND DK.strTreatment = @strTreatment
      AND DK.intVisitID IS NULL
    ORDER BY DK.intDrugKitID;

    IF @intDrugKitID IS NULL
    BEGIN
        RAISERROR('No available drug kits for selected treatment.', 16, 1);
        ROLLBACK TRAN;
        RETURN;
    END;

    UPDATE TDrugKits
    SET intVisitID = @intVisitID
    WHERE intDrugKitID = @intDrugKitID;

    ---------------------------------------------------------------------
    -- 7. Commit transaction
    ---------------------------------------------------------------------
    COMMIT TRAN;
END;
GO
