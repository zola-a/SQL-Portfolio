-- Step 1: Drop Tables (children → parents)
-- --------------------------------------------------------------------------------
IF OBJECT_ID('TDrugKits')          IS NOT NULL DROP TABLE TDrugKits
IF OBJECT_ID('TVisits')            IS NOT NULL DROP TABLE TVisits
IF OBJECT_ID('TPatients')          IS NOT NULL DROP TABLE TPatients
IF OBJECT_ID('TRandomCodes')       IS NOT NULL DROP TABLE TRandomCodes
IF OBJECT_ID('TSites')             IS NOT NULL DROP TABLE TSites
IF OBJECT_ID('TVisitTypes')        IS NOT NULL DROP TABLE TVisitTypes
IF OBJECT_ID('TWithdrawReasons')   IS NOT NULL DROP TABLE TWithdrawReasons
IF OBJECT_ID('TGenders')           IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID('TStates')            IS NOT NULL DROP TABLE TStates
IF OBJECT_ID('TStudies')           IS NOT NULL DROP TABLE TStudies


-- --------------------------------------------------------------------------------
-- Step 2: Create Tables
-- --------------------------------------------------------------------------------

CREATE TABLE TStudies 
(
    intStudyID		INTEGER			NOT NULL
    ,strStudyDesc	VARCHAR(50)		NOT NULL
    CONSTRAINT PK_TStudies PRIMARY KEY (intStudyID)
)

CREATE TABLE TStates 
(
    intStateID		INTEGER			NOT NULL
    ,strStateDesc	VARCHAR(50)		NOT NULL
    CONSTRAINT PK_TStates PRIMARY KEY (intStateID)
)

CREATE TABLE TGenders 
(
    intGenderID		INTEGER			NOT NULL
    ,strGender		VARCHAR(50)		NOT NULL
    CONSTRAINT PK_TGenders PRIMARY KEY (intGenderID)
)

CREATE TABLE TSites 
(
    intSiteID		INTEGER			NOT NULL
    ,intSiteNumber	INTEGER			NOT NULL
    ,intStudyID		INTEGER			NOT NULL
    ,strName		VARCHAR(100)	NOT NULL
    ,strAddress		VARCHAR(100)	NOT NULL
    ,strCity		VARCHAR(50)		NOT NULL
    ,intStateID		INTEGER			NOT NULL
    ,strZip			VARCHAR(10)		NOT NULL
    ,strPhone		VARCHAR(20)		NOT NULL
    CONSTRAINT PK_TSites PRIMARY KEY (intSiteID)
)

CREATE TABLE TPatients 
(
    intPatientID		INTEGER		NOT NULL
    ,intPatientNumber	INTEGER		NOT NULL
    ,intSiteID			INTEGER		NOT NULL
    ,dtmDOB				DATE		NOT NULL
    ,intGenderID		INTEGER		NOT NULL
    ,intWeight			INTEGER		NOT NULL
    ,intRandomCodeID	INTEGER		NULL
    CONSTRAINT PK_TPatients PRIMARY KEY (intPatientID)
)

CREATE TABLE TVisitTypes 
(
    intVisitTypeID		INTEGER		NOT NULL
    ,strVisitDesc		VARCHAR(50)	NOT NULL
    CONSTRAINT PK_TVisitTypes PRIMARY KEY (intVisitTypeID)
)

CREATE TABLE TVisits 
(
    intVisitID			 INTEGER	NOT NULL
    ,intPatientID		 INTEGER	NOT NULL
    ,dtmVisit			 DATE		NOT NULL
    ,intVisitTypeID		 INTEGER	NOT NULL
    ,intWithdrawReasonID INTEGER	NULL
    CONSTRAINT PK_TVisits PRIMARY KEY (intVisitID)
)

CREATE TABLE TWithdrawReasons 
(
    intWithdrawReasonID		INTEGER		 NOT NULL
    ,strWithdrawDesc		VARCHAR(100) NOT NULL
    CONSTRAINT PK_TWithdrawReasons PRIMARY KEY (intWithdrawReasonID)
)

CREATE TABLE TRandomCodes 
(
    intRandomCodeID		INTEGER		NOT NULL
    ,intRandomCode		INTEGER		NOT NULL
    ,intStudyID			INTEGER		NOT NULL
    ,strTreatment		VARCHAR(1)  NOT NULL
    ,blnAvailable		VARCHAR(1)  NOT NULL
    CONSTRAINT PK_TRandomCodes PRIMARY KEY (intRandomCodeID)
)

CREATE TABLE TDrugKits 
(
    intDrugKitID		INTEGER		NOT NULL
    ,intDrugKitNumber	INTEGER		NOT NULL
    ,intSiteID			INTEGER		NOT NULL
    ,strTreatment		VARCHAR(1)	NOT NULL
    ,intVisitID			INTEGER		NULL
    CONSTRAINT PK_TDrugKits PRIMARY KEY (intDrugKitID)
)

-- --------------------------------------------------------------------------------
-- Step 3: Foreign Keys
-- --------------------------------------------------------------------------------
ALTER TABLE TSites ADD CONSTRAINT FK_TSITES_TSTUDIES 
FOREIGN KEY (intStudyID) REFERENCES TStudies(intStudyID)

ALTER TABLE TSites ADD CONSTRAINT FK_TSITES_TSTATES 
FOREIGN KEY (intStateID) REFERENCES TStates(intStateID)

ALTER TABLE TPatients ADD CONSTRAINT FK_TPATIENTS_TSITES 
FOREIGN KEY (intSiteID) REFERENCES TSites(intSiteID)

ALTER TABLE TPatients ADD CONSTRAINT FK_TPATIENTS_TGENDERS 
FOREIGN KEY (intGenderID) REFERENCES TGenders(intGenderID)

ALTER TABLE TPatients ADD CONSTRAINT FK_TPATIENTS_TRANDOMCODES 
FOREIGN KEY (intRandomCodeID) REFERENCES TRandomCodes(intRandomCodeID)
ALTER TABLE TVisits ADD CONSTRAINT FK_TVISITS_TPATIENTS 
FOREIGN KEY (intPatientID) REFERENCES TPatients(intPatientID)

ALTER TABLE TVisits ADD CONSTRAINT FK_TVISITS_TVISITTYPES 
FOREIGN KEY (intVisitTypeID) REFERENCES TVisitTypes(intVisitTypeID)

ALTER TABLE TVisits ADD CONSTRAINT FK_TVISITS_TWITHDRAWREASONS 
FOREIGN KEY (intWithdrawReasonID) REFERENCES TWithdrawReasons(intWithdrawReasonID)

ALTER TABLE TRandomCodes ADD CONSTRAINT FK_TRANDOMCODES_TSTUDIES 
FOREIGN KEY (intStudyID) REFERENCES TStudies(intStudyID)

ALTER TABLE TDrugKits ADD CONSTRAINT FK_TDRUGKITS_TSITES 
FOREIGN KEY (intSiteID) REFERENCES TSites(intSiteID)

ALTER TABLE TDrugKits ADD CONSTRAINT FK_TDRUGKITS_TVISITS 
FOREIGN KEY (intVisitID) REFERENCES TVisits(intVisitID)
