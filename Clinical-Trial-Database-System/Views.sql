- --------------------------------------------------------------------------------
-- Step 2, Question 2: View showing all patients at all sites for both studies
-- --------------------------------------------------------------------------------

GO
CREATE VIEW vPatients
AS
SELECT 
    p.intPatientID
    ,p.intPatientNumber
    ,p.intSiteID
    ,s.intSiteNumber
    ,s.strName AS SiteName
    ,s.intStudyID
    ,st.strStudyDesc
    ,p.dtmDOB
    ,p.intGenderID
    ,g.strGender
    ,p.intWeight
FROM TPatients p
    INNER JOIN TSites s
        ON p.intSiteID = s.intSiteID
    INNER JOIN TStudies st
        ON s.intStudyID = st.intStudyID
    INNER JOIN TGenders g
        ON p.intGenderID = g.intGenderID

GO

-- --------------------------------------------------------------------------------
-- Step 2, Question 3: View showing all randomized patients, their site and treatment
-- --------------------------------------------------------------------------------

GO

CREATE VIEW vRandomizedPatients
AS
SELECT 
    p.intPatientID
    ,p.intPatientNumber
    ,p.intSiteID
    ,s.intSiteNumber
    ,s.strName AS SiteName
    ,s.intStudyID
    ,st.strStudyDesc
    ,p.intRandomCodeID
    ,r.intRandomCode
    ,r.strTreatment
FROM TPatients p
    INNER JOIN TSites s
        ON p.intSiteID = s.intSiteID
    INNER JOIN TStudies st
        ON s.intStudyID = st.intStudyID
    INNER JOIN TRandomCodes r
        ON p.intRandomCodeID = r.intRandomCodeID
WHERE p.intRandomCodeID IS NOT NULL;

GO


GO
-- --------------------------------------------------------------------------------
-- Step 2, Question 4a: Next available random code for Study 12345 (sequential)
-- --------------------------------------------------------------------------------
CREATE VIEW vRandomCodesStudy12345
AS
SELECT MIN(intRandomCodeID) AS NextRandomCodeID
    ,intStudyID
    ,strTreatment
FROM TRandomCodes
WHERE intStudyID = 1
    AND blnAvailable = 'T'
GROUP BY strTreatment, intStudyID;

GO


-- --------------------------------------------------------------------------------
-- Step 2, Question 4b: Next available random code for Study 54321 (balanced)
-- --------------------------------------------------------------------------------


GO

CREATE VIEW vRandomCodesStudy54321
AS
SELECT *
FROM TRandomCodes
WHERE intStudyID = 2
    AND blnAvailable = 'T';

GO

-- --------------------------------------------------------------------------------
-- Step 2, Question 5a: Available drug kits for Study 12345
-- --------------------------------------------------------------------------------

GO

CREATE VIEW vAvailableDrug12345
AS
SELECT dk.intDrugKitID
    ,dk.intDrugKitNumber
    ,dk.intSiteID
    ,s.intSiteNumber
    ,dk.strTreatment
FROM TDrugKits dk
    INNER JOIN TSites s
        ON dk.intSiteID = s.intSiteID
WHERE s.intStudyID = 1
    AND dk.intVisitID IS NULL;


GO

-- --------------------------------------------------------------------------------
-- Step 2, Question 5b: Available drug kits for Study 54321
-- --------------------------------------------------------------------------------
GO

CREATE VIEW vAvailableDrug54321
AS
SELECT dk.intDrugKitID
    ,dk.intDrugKitNumber
    ,dk.intSiteID
    ,s.intSiteNumber
    ,dk.strTreatment
FROM TDrugKits dk
    INNER JOIN TSites s
        ON dk.intSiteID = s.intSiteID
WHERE s.intStudyID = 2
    AND dk.intVisitID IS NULL;

GO

-- --------------------------------------------------------------------------------
-- Step 2, Question 6: Withdrawn patients with site, date, and reason
-- --------------------------------------------------------------------------------

GO


GO

CREATE VIEW vWithdrawals
AS
SELECT v.intVisitID
    ,v.intPatientID
    ,p.intPatientNumber
    ,p.intSiteID
    ,s.intSiteNumber
    ,s.strName AS SiteName
    ,v.dtmVisit AS WithdrawalDate
    ,v.intWithdrawReasonID
    ,w.strWithdrawDesc
FROM TVisits v
    INNER JOIN TPatients p
        ON v.intPatientID = p.intPatientID
    INNER JOIN TSites s
        ON p.intSiteID = s.intSiteID
    INNER JOIN TWithdrawReasons w
        ON v.intWithdrawReasonID = w.intWithdrawReasonID
WHERE v.intVisitTypeID = 3;  -- Withdrawal visit

GO
