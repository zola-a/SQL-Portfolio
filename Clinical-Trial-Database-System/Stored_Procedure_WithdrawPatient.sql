-- -----------------------------------------------------------------------------
-- Step 9: uspWithdrawPatient
-- Adds a Withdrawal visit for a patient.
-- Rules:
--   - Patient may or may not be randomized
--   - Withdrawal date must be AFTER most recent visit date


IF OBJECT_ID('uspWithdrawPatient','P') IS NOT NULL DROP PROCEDURE uspWithdrawPatient;
GO

CREATE PROCEDURE uspWithdrawPatient
      @intPatientID          INT
    , @dtmWithdraw           DATE
    , @intWithdrawReasonID   INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        ---------------------------------------------------------------------
        -- 1. Validate patient exists
        ---------------------------------------------------------------------
        IF NOT EXISTS (SELECT 1 FROM TPatients WHERE intPatientID = @intPatientID)
        BEGIN
            RAISERROR('Patient %d does not exist.', 16, 1, @intPatientID);
            ROLLBACK TRAN;
            RETURN;
        END

        ---------------------------------------------------------------------
        -- 2. Validate withdrawal reason exists
        ---------------------------------------------------------------------
        IF NOT EXISTS (SELECT 1 FROM TWithdrawReasons WHERE intWithdrawReasonID = @intWithdrawReasonID)
        BEGIN
            RAISERROR('Withdrawal Reason %d does not exist.', 16, 1, @intWithdrawReasonID);
            ROLLBACK TRAN;
            RETURN;
        END

        ---------------------------------------------------------------------
        -- 3. Get most recent visit date for this patient
        ---------------------------------------------------------------------
        DECLARE @dtmLastVisit DATE

        SELECT @dtmLastVisit = MAX(dtmVisit)
        FROM TVisits
        WHERE intPatientID = @intPatientID;

        IF @dtmWithdraw <= @dtmLastVisit
        BEGIN
            RAISERROR('Withdrawal date must be AFTER the last visit date (%s).',
                16, 1, CONVERT(varchar(20), @dtmLastVisit, 120));
            ROLLBACK TRAN
            RETURN
        END



        ---------------------------------------------------------------------
        -- 4. Create new visit ID
        ---------------------------------------------------------------------
        DECLARE @intVisitID INT
        SELECT @intVisitID = ISNULL(MAX(intVisitID), 0) + 1 FROM TVisits

        ---------------------------------------------------------------------
        -- 5. Insert Withdrawal Visit
        ---------------------------------------------------------------------
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
            ,@dtmWithdraw
            ,3         -- Withdrawal
            ,@intWithdrawReasonID
        );

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END
GO

