ALTER TABLE TCustomers
ADD CONSTRAINT FK_TCustomers_States
FOREIGN KEY (intStateID) REFERENCES TCustomersStates(intStateID);

ALTER TABLE TJobs
ADD CONSTRAINT FK_TJobs_Customers
FOREIGN KEY (intCustomerID) REFERENCES TCustomers(intCustomerID);

ALTER TABLE TJobs
ADD CONSTRAINT FK_TJobs_Statuses
FOREIGN KEY (intStatusID) REFERENCES TStatuses(intStatusID);

ALTER TABLE TJobMaterials
ADD CONSTRAINT FK_TJobMaterials_Jobs
FOREIGN KEY (intJobID) REFERENCES TJobs(intJobID);

ALTER TABLE TJobMaterials
ADD CONSTRAINT FK_TJobMaterials_Materials
FOREIGN KEY (intMaterialID) REFERENCES TMaterials(intMaterialID);

ALTER TABLE TVendors
ADD CONSTRAINT FK_TVendors_States
FOREIGN KEY (intStateID) REFERENCES TVendorsStates(intStateID);

ALTER TABLE TMaterials
ADD CONSTRAINT FK_TMaterials_Vendors
FOREIGN KEY (intVendorID) REFERENCES TVendors(intVendorID);

ALTER TABLE TJobWorkers
ADD CONSTRAINT FK_TJobWorkers_Jobs
FOREIGN KEY (intJobID) REFERENCES TJobs(intJobID);

ALTER TABLE TJobWorkers
ADD CONSTRAINT FK_TJobWorkers_Workers
FOREIGN KEY (intWorkerID) REFERENCES TWorkers(intWorkerID);

ALTER TABLE TWorkerSkills
ADD CONSTRAINT FK_TWorkerSkills_Workers
FOREIGN KEY (intWorkerID) REFERENCES TWorkers(intWorkerID);

ALTER TABLE TWorkerSkills
ADD CONSTRAINT FK_TWorkerSkills_Skills
FOREIGN KEY (intSkillID) REFERENCES TSkills(intSkillID);
