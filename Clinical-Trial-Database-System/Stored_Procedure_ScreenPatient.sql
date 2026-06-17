
-- --------------------------------------------------------------------------------
-- Step 8: uspScreenPatient
-- Inserts a patient (auto-generates intPatientNumber and intPatientID)


IF OBJECT_ID('uspScreenPatient','P') IS NOT NULL DROP PROCEDURE uspScreenPatient;
GO

CREATE PROCEDURE uspScreenPatient
    @intPatientID   INT OUTPUT
    ,@intSiteID     INT
    ,@dtmDOB        DATE
    ,@intGenderID   INT
    ,@intWeight     INT
    ,@dtmVisit      DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        -- Validate site exists and get site number
        DECLARE @intSiteNumber INT;
        IF NOT EXISTS (SELECT 1 FROM TSites WHERE intSiteID = @intSiteID)
        BEGIN
            RAISERROR('Site %d does not exist.', 16, 1, @intSiteID);
            ROLLBACK TRAN;
            RETURN;
        END

        SELECT @intSiteNumber = intSiteNumber FROM TSites WHERE intSiteID = @intSiteID;

        -- Generate new intPatientID (internal PK)
        SELECT @intPatientID = ISNULL(MAX(intPatientID), 0) + 1 FROM TPatients;

        -- Compute next sequence for this site (last 3 digits)
        DECLARE @intMaxPatientNumber INT = NULL;
        DECLARE @intSeq INT = 1;

        SELECT @intMaxPatientNumber = MAX(intPatientNumber)
        FROM TPatients
        WHERE intSiteID = @intSiteID;

        IF @intMaxPatientNumber IS NOT NULL
            SET @intSeq = (@intMaxPatientNumber % 1000) + 1;  -- next sequence for site

        -- Compose intPatientNumber = SiteNumber * 1000 + sequence (e.g., 101001)
        DECLARE @intPatientNumber INT;
        SET @intPatientNumber = (@intSiteNumber * 1000) + @intSeq;

        -- Insert patient (intRandomCodeID = NULL initially)
        INSERT INTO TPatients
        (
             intPatientID
            ,intPatientNumber
            ,intSiteID
            ,dtmDOB
            ,intGenderID
            ,intWeight
            ,intRandomCodeID
        )
        VALUES
        (
             @intPatientID
            ,@intPatientNumber
            ,@intSiteID
            ,@dtmDOB
            ,@intGenderID
            ,@intWeight
            ,NULL
        );

        -- Create Screening visit (intVisitTypeID = 1)
        DECLARE @intVisitID INT;
        SELECT @intVisitID = ISNULL(MAX(intVisitID), 0) + 1 FROM TVisits;

        INSERT INTO TVisits
        (
             intVisitID
            ,intPatientID
            ,dtmVisit
            ,intVisitTypeID
            ,intWithdrawReasonID
        )
        VALUES
        (
             @intVisitID
            ,@intPatientID
            ,COALESCE(@dtmVisit, GETDATE())
            ,1    -- Screening
            ,NULL
        );

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END
GO
