USE dbSQL2;
SET NOCOUNT ON;

-- Drop tables (keep for reset ability)
IF OBJECT_ID ('TWorkerSkills') IS NOT NULL DROP TABLE TWorkerSkills;
IF OBJECT_ID ('TJobWorkers') IS NOT NULL DROP TABLE TJobWorkers;
IF OBJECT_ID ('TJobMaterials') IS NOT NULL DROP TABLE TJobMaterials;
IF OBJECT_ID ('TMaterials') IS NOT NULL DROP TABLE TMaterials;
IF OBJECT_ID ('TJobs') IS NOT NULL DROP TABLE TJobs;
IF OBJECT_ID ('TWorkers') IS NOT NULL DROP TABLE TWorkers;
IF OBJECT_ID ('TWorkersStates') IS NOT NULL DROP TABLE TWorkersStates;
IF OBJECT_ID ('TSkills') IS NOT NULL DROP TABLE TSkills;
IF OBJECT_ID ('TCustomers') IS NOT NULL DROP TABLE TCustomers;
IF OBJECT_ID ('TCustomersStates') IS NOT NULL DROP TABLE TCustomersStates;
IF OBJECT_ID ('TStatuses') IS NOT NULL DROP TABLE TStatuses;
IF OBJECT_ID ('TVendors') IS NOT NULL DROP TABLE TVendors;
IF OBJECT_ID ('TVendorsStates') IS NOT NULL DROP TABLE TVendorsStates;

-- TABLES
CREATE TABLE TCustomersStates (
    intStateID INT NOT NULL PRIMARY KEY,
    strStateName VARCHAR(50) NOT NULL
);

CREATE TABLE TCustomers (
    intCustomerID INT NOT NULL PRIMARY KEY,
    strFirstName VARCHAR(50) NOT NULL,
    strLastName VARCHAR(50) NOT NULL,
    strAddress VARCHAR(50) NOT NULL,
    strCity VARCHAR(50) NOT NULL,
    intStateID INT NOT NULL,
    strZip VARCHAR(50) NOT NULL,
    strPhoneNumber VARCHAR(50) NOT NULL
);

CREATE TABLE TStatuses (
    intStatusID INT NOT NULL PRIMARY KEY,
    strStatus VARCHAR(50) NOT NULL
);

CREATE TABLE TJobs (
    intJobID INT NOT NULL PRIMARY KEY,
    intCustomerID INT NOT NULL,
    intStatusID INT NOT NULL,
    dtmStartDate DATETIME NOT NULL,
    dtmEndDate DATETIME NOT NULL,
    strJobDesc VARCHAR(2000) NOT NULL
);

CREATE TABLE TVendorsStates (
    intStateID INT NOT NULL PRIMARY KEY,
    strState VARCHAR(50) NOT NULL
);

CREATE TABLE TVendors (
    intVendorID INT NOT NULL PRIMARY KEY,
    strVendorName VARCHAR(50) NOT NULL,
    strAddress VARCHAR(50) NOT NULL,
    strCity VARCHAR(50) NOT NULL,
    intStateID INT NOT NULL,
    strZip VARCHAR(50) NOT NULL,
    strPhoneNumber VARCHAR(50) NOT NULL
);

CREATE TABLE TMaterials (
    intMaterialID INT NOT NULL PRIMARY KEY,
    strDescription VARCHAR(100) NOT NULL,
    monCost MONEY NOT NULL,
    intVendorID INT NOT NULL
);

CREATE TABLE TWorkersStates (
    intStateID INT NOT NULL PRIMARY KEY,
    strState VARCHAR(50) NOT NULL
);

CREATE TABLE TWorkers (
    intWorkerID INT NOT NULL PRIMARY KEY,
    strFirstName VARCHAR(50) NOT NULL,
    strLastName VARCHAR(50) NOT NULL,
    strAddress VARCHAR(50) NOT NULL,
    strCity VARCHAR(50) NOT NULL,
    intStateID INT NOT NULL,
    strZip VARCHAR(50) NOT NULL,
    strPhoneNumber VARCHAR(50) NOT NULL,
    dtmHireDate DATETIME NOT NULL,
    monHourlyRate MONEY NOT NULL
);

CREATE TABLE TSkills (
    intSkillID INT NOT NULL PRIMARY KEY,
    strSkill VARCHAR(50) NOT NULL,
    strDescription VARCHAR(100) NOT NULL
);

CREATE TABLE TWorkerSkills (
    intWorkerSkillID INT NOT NULL PRIMARY KEY,
    intWorkerID INT NOT NULL,
    intSkillID INT NOT NULL
);

CREATE TABLE TJobMaterials (
    intJobMaterialID INT NOT NULL PRIMARY KEY,
    intJobID INT NOT NULL,
    intMaterialID INT NOT NULL,
    intQuantity INT NOT NULL
);

CREATE TABLE TJobWorkers (
    intJobWorkerID INT NOT NULL PRIMARY KEY,
    intJobID INT NOT NULL,
    intWorkerID INT NOT NULL,
    intHoursWorked INT NOT NULL
);
