-- --------------------------------------------------------------------------------
-- Insert reference data
-- --------------------------------------------------------------------------------

-- Studies
INSERT INTO TStudies (intStudyID, strStudyDesc)
VALUES
(1, 'Study 12345')
,(2, 'Study 54321');

-- Visit Types
INSERT INTO TVisitTypes (intVisitTypeID, strVisitDesc)
VALUES
(1, 'Screening')
,(2, 'Randomization')
,(3, 'Withdrawal')

-- States
INSERT INTO TStates (intStateID, strStateDesc)
VALUES
(1, 'Ohio')
,(2, 'Kentucky')
,(3, 'Indiana')
,(4, 'New Jersey')
,(5, 'Virginia')
,(6, 'Georgia')
,(7, 'Iowa')

-- Genders
INSERT INTO TGenders (intGenderID, strGender)
VALUES
(1, 'Female')
,(2, 'Male')

-- Sites
INSERT INTO TSites (intSiteID, intSiteNumber, intStudyID, strName, strAddress, strCity, intStateID, strZip, strPhone)
VALUES
(1, 101, 1, 'Dr. Stan Heinrich', '123 E. Main St', 'Atlanta', 6, '25869', '1234567890')
,(2, 111, 1, 'Mercy Hospital', '3456 Elmhurst Rd.', 'Secaucus', 4, '32659', '5013629564')
,(3, 121, 1, 'St. Elizabeth Hospital', '976 Jackson Way', 'Ft. Thomas', 2, '41258', '3026521478')
,(4, 501, 2, 'Dr. Robert Adler', '9087 W. Maple Ave.', 'Cedar Rapids', 7, '42365', '6149652574')
,(5, 511, 2, 'Dr. Tim Schmitz', '4539 Helena Run', 'Mason', 1, '45040', '5136987462')
,(6, 521, 2, 'Dr. Lawrence Snell', '9201 NW. Washington Blvd.', 'Bristol', 5, '20163', '3876510249')

-- Random Codes
INSERT INTO TRandomCodes (intRandomCodeID, intRandomCode, intStudyID, strTreatment, blnAvailable)
VALUES
(1, 1000, 1, 'A', 'T')
,(2, 1001, 1, 'P', 'T')
,(3, 1002, 1, 'A', 'T')
,(4, 1003, 1, 'P', 'T')
,(5, 1004, 1, 'P', 'T')
,(6, 1005, 1, 'A', 'T')
,(7, 1006, 1, 'A', 'T')
,(8, 1007, 1, 'P', 'T')
,(9, 1008, 1, 'A', 'T')
,(10, 1009, 1, 'P', 'T')
,(11, 1010, 1, 'P', 'T')
,(12, 1011, 1, 'A', 'T')
,(13, 1012, 1, 'P', 'T')
,(14, 1013, 1, 'A', 'T')
,(15, 1014, 1, 'A', 'T')
,(16, 1015, 1, 'A', 'T')
,(17, 1016, 1, 'P', 'T')
,(18, 1017, 1, 'P', 'T')
,(19, 1018, 1, 'A', 'T')
,(20, 1019, 1, 'P', 'T')
,(21, 5000, 2, 'A', 'T')
,(22, 5001, 2, 'A', 'T')
,(23, 5002, 2, 'A', 'T')
,(24, 5003, 2, 'A', 'T')
,(25, 5004, 2, 'A', 'T')
,(26, 5005, 2, 'A', 'T')
,(27, 5006, 2, 'A', 'T')
,(28, 5007, 2, 'A', 'T')
,(29, 5008, 2, 'A', 'T')
,(30, 5009, 2, 'A', 'T')
,(31, 5010, 2, 'P', 'T')
,(32, 5011, 2, 'P', 'T')
,(33, 5012, 2, 'P', 'T')
,(34, 5013, 2, 'P', 'T')
,(35, 5014, 2, 'P', 'T')
,(36, 5015, 2, 'P', 'T')
,(37, 5016, 2, 'P', 'T')
,(38, 5017, 2, 'P', 'T')
,(39, 5018, 2, 'P', 'T')
,(40, 5019, 2, 'P', 'T')

-- Drug Kits
INSERT INTO TDrugKits (intDrugKitID, intDrugKitNumber, intSiteID, strTreatment, intVisitID)
VALUES
(1, 10000, 1, 'A', NULL)
,(2, 10001, 1, 'A', NULL)
,(3, 10002, 1, 'A', NULL)
,(4, 10003, 1, 'P', NULL)
,(5, 10004, 1, 'P', NULL)
,(6, 10005, 1, 'P', NULL)
,(7, 10006, 2, 'A', NULL)
,(8, 10007, 2, 'A', NULL)
,(9, 10008, 2, 'A', NULL)
,(10, 10009, 2, 'P', NULL)
,(11, 10010, 2, 'P', NULL)
,(12, 10011, 2, 'P', NULL)
,(13, 10012, 3, 'A', NULL)
,(14, 10013, 3, 'A', NULL)
,(15, 10014, 3, 'A', NULL)
,(16, 10015, 3, 'P', NULL)
,(17, 10016, 3, 'P', NULL)
,(18, 10017, 3, 'P', NULL)
,(19, 10018, 4, 'A', NULL)
,(20, 10019, 4, 'A', NULL)
,(21, 10020, 4, 'A', NULL)
,(22, 10021, 4, 'P', NULL)
,(23, 10022, 4, 'P', NULL)
,(24, 10023, 4, 'P', NULL)
,(25, 10024, 5, 'A', NULL)
,(26, 10025, 5, 'A', NULL)
,(27, 10026, 5, 'A', NULL)
,(28, 10027, 5, 'P', NULL)
,(29, 10028, 5, 'P', NULL)
,(30, 10029, 5, 'P', NULL)
,(31, 10030, 6, 'A', NULL)
,(32, 10031, 6, 'A', NULL)
,(33, 10032, 6, 'A', NULL)
,(34, 10033, 6, 'P', NULL)
,(35, 10034, 6, 'P', NULL)
,(36, 10035, 6, 'P', NULL)

-- Withdraw Reasons
INSERT INTO TWithdrawReasons (intWithdrawReasonID, strWithdrawDesc)
VALUES
(1, 'Patient withdrew consent')
,(2, 'Adverse event')
,(3, 'Health issue-related to study')
,(4, 'Health issue-unrelated to study')
,(5, 'Personal reason')
,(6, 'Completed the study')

