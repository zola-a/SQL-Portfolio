-- 3.1. Create SQL to update the address for a specific customer. 
-- Include a select statement before and after the update. 

SELECT strFirstName, strLastName, strAddress, strCity
FROM TCustomers
WHERE intCustomerID = 2


UPDATE TCustomers
SET strAddress = '123 Race ST'
WHERE intCustomerID = 2


SELECT strFirstName, strLastName, strAddress, strCity
FROM TCustomers
WHERE intCustomerID = 2


-- 3.2. Create SQL to increase the hourly rate by $2 for each worker that has been an employee for at least 1 year. 
--Include a select before and after the update. 
--Make sure that you have data so that some rows are updated and others are not. 


SELECT  intWorkerID, strFirstName, strLastName, strAddress
	  ,strCity, intStateID, strZip, strPhoneNumber, dtmHireDate, monHourlyRate
FROM TWorkers



UPDATE TWorkers
SET monHourlyRate = monHourlyRate + 2 
WHERE dtmHireDate < '2024-08-14'


SELECT  intWorkerID, strFirstName, strLastName, strAddress
	  ,strCity, intStateID, strZip, strPhoneNumber, dtmHireDate, monHourlyRate
FROM TWorkers


--3.3. Create SQL to delete a specific job that has associated work hours and materials assigned to it.
-- Include a select before and after the statement(s). 

Select intJobID, intCustomerID, strJobDesc
FROM TJobs


DELETE FROM TJobWorkers
WHERE intJobID = 8

DELETE FROM TJobMaterials
WHERE intJobID = 8

DELETE FROM TJobs
WHERE intJobID = 8

Select intJobID, intCustomerID, strJobDesc
FROM TJobs


-- 4.1	Write a query to list all jobs that are in process. Include the Job ID and 
--Description, Customer ID and name, and the start date. Order by the Job ID

Select intJobID, TJ.intCustomerID, TJ.strJobDesc, TJ.dtmStartDate
FROM TJobs AS TJ JOIN TCustomers AS TC
	ON TJ.intCustomerID = TC.intCustomerID
	
	JOIN TStatuses AS TS
	ON TS.intStatusID = TJ.intStatusID
WHERE TS.strStatus = 'Process'
ORDER BY TJ.intJobID



-- 4.2	 Write a query to list all complete jobs for a specific customer and the materials used on each job.
--Include the quantity, unit cost, and total cost for each material on each job. Order by Job ID and material ID. 
--Note: Select a customer that has at least 3 complete jobs and at least 1 open job and 1 in process job. 
--At least one of the complete jobs should have multiple materials. If needed, go back to your inserts and add data. 


Select TC.strFirstName, TS.strStatus, TJ.strJobDesc, TM.strDescription, TM.monCost, TJM.intQuantity, TJ.intJobID, TM.intMaterialID
FROM TJobs AS TJ JOIN TCustomers AS TC
	ON TJ.intCustomerID = TC.intCustomerID

	JOIN TStatuses AS TS
	ON TS.intStatusID = TJ.intStatusID

	JOIN TJobMaterials AS TJM
	ON TJM.intJobID = TJ.intJobID

	JOIN TMaterials AS TM
	ON TM.intMaterialID = TJM.intMaterialID
WHERE TC.intCustomerID = 1
ORDER BY TJ.intJobID
		,TM.intMaterialID


--  4.3	 This step should use the same customer as in step 4.2. Write a query to list the total cost for all 
--materials for each completed job for the customer. Use the data returned in step 4.2 to validate your results. 

Select TC.strFirstName AS Name
	,SUM(TJM.intQuantity * TM.monCost) AS 'Total Cost'
FROM TJobs AS TJ JOIN TCustomers AS TC
	ON TJ.intCustomerID = TC.intCustomerID

	JOIN TStatuses AS TS
	ON TS.intStatusID = TJ.intStatusID

	JOIN TJobMaterials AS TJM
	ON TJM.intJobID = TJ.intJobID

	JOIN TMaterials AS TM
	ON TM.intMaterialID = TJM.intMaterialID
WHERE TC.intCustomerID = 1
GROUP BY TC.strFirstName



--4.4	 Write a query to list all jobs that have work entered for them. Include the job ID, job description, 
--and job status description. List the total hours worked for each job with the lowest, highest, and average hourly rate.
--Make sure that your data includes at least one job that does not have hours logged. This job should not be included in the query. 
--Order by highest to lowest average hourly rate. 


SELECT TJ.intJobID, TJ.strJobDesc, TS.strStatus, 
       SUM(TJW.intHoursWorked) AS TotalHours
      ,MIN(TW.monHourlyRate) AS MinRate
      ,MAX(TW.monHourlyRate) AS MaxRate
      ,AVG(TW.monHourlyRate) AS AvgRate
FROM TJobs AS TJ JOIN TJobWorkers AS TJW
	ON TJ.intJobID = TJW.intJobID

	JOIN TWorkers AS TW
	ON TJW.intWorkerID = TW.intWorkerID

	JOIN TStatuses AS TS 
	ON TJ.intStatusID = TS.intStatusID
GROUP BY TJ.intJobID, TJ.strJobDesc, TS.strStatus
ORDER BY AVG(TW.monHourlyRate) DESC



--4.5	 Write a query that lists all materials that have not been used on any jobs.
--Include Material ID and Description. Order by Material ID.


SELECT TM.intMaterialID, TM.strDescription
FROM TMaterials AS TM LEFT JOIN TJobMaterials AS TJM
    ON TM.intMaterialID = TJM.intMaterialID
WHERE TJM.intMaterialID IS NULL
ORDER BY TM.intMaterialID


--4.6 Create a query that lists all workers with a specific skill, their hire date, and 
--the total number of jobs that they worked on. List the Skill ID and description with each row. Order by Worker ID. 

SELECT TW.strFirstName, TW.strLastName,  TW.dtmHireDate, TW.intWorkerID
		,TS.intSkillID, TS.strDescription, TS.strSkill
		,COUNT(TJW.intJobID) AS 'TOTAL JOB NUMBER' 
FROM TWorkers AS TW JOIN TWorkerSkills AS TWS
	ON TW.intWorkerID = TWS.intWorkerID

	JOIN TSkills AS TS
	ON TWS.intSkillID = TS.intSkillID

	JOIN TJobWorkers AS TJW
	ON TJW.intWorkerID = TW.intWorkerID
WHERE TS.strSkill = 'Plumbing'
GROUP BY TW.strFirstName, TW.strLastName,  TW.dtmHireDate, TW.intWorkerID
		,TS.intSkillID, TS.strDescription, TS.strSkill
ORDER BY TW.intWorkerID




-- 4.7	 Create a query that lists all workers that worked greater than 20 hours for all jobs that they worked on.
--Include the Worker ID and name, number of hours worked, and number of jobs that they worked on. Order by Worker ID. 

SELECT TW.intWorkerID
		,TW.strFirstName + ' ' + TW.strLastName AS WorkerName
       ,SUM(TJW.intHoursWorked) AS 'Total Hours'
       ,COUNT(TJW.intJobID) AS 'TOTAL JOB NUMBER'
FROM TWorkers AS TW JOIN TJobWorkers AS TJW 
	ON TW.intWorkerID = TJW.intWorkerID
GROUP BY TW.intWorkerID, TW.strFirstName, TW.strLastName
HAVING MIN(TJW.intHoursWorked) > 20
ORDER BY TW.intWorkerID




--  4.8	 Create a query that includes the labor costs associated with each job. Include Customer ID and Name. 


SELECT TC.strFirstName + ' ' + TC.strLastName AS 'Customer Name'
       ,SUM(TJW.intHoursWorked * TW.monHourlyRate) AS 'Labor Cost'
FROM TJobs AS TJ JOIN TJobWorkers AS TJW 
	ON TJ.intJobID = TJW.intJobID

	JOIN TWorkers AS TW 
	ON TJW.intWorkerID = TW.intWorkerID

	JOIN TCustomers AS TC
	ON TJ.intCustomerID = TC.intCustomerID
GROUP BY  TC.strFirstName, TC.strLastName




--  4.9	 Write a query that lists all customers who are located on 'Main Street'. Include the customer Id and full address. 
--Order by Customer ID. Make sure that you have at least three customers on 'Main Street' each with different house numbers. 
--Make sure that you also have customers that are not on 'Main Street'. 

SELECT intCustomerID
	,strAddress + ', ' + strCity + ', ' + strZip AS 'Full Address'
FROM TCustomers
WHERE strAddress LIKE '%Main St%'
ORDER BY intCustomerID




--4.10 Write a query to list completed jobs that started and ended in the same month. List Job, Job Status, Start Date and End Date. 


SELECT TJ.intJobID, TS.strStatus, TJ.dtmStartDate, TJ.dtmEndDate, TJ.strJobDesc
FROM TJobs AS TJ JOIN TStatuses AS TS
	ON TJ.intStatusID = TS.intStatusID
WHERE TS.strStatus = 'Complete'
  AND MONTH(dtmStartDate) = MONTH(dtmEndDate)
  AND YEAR(dtmStartDate) = YEAR(dtmEndDate)



--4.11 Create a query to list workers that worked on three or more jobs for the same customer. 

SELECT TW.strFirstName, TW.strLastName
		,COUNT(TJ.intJobID) AS 'Number of Jobs'
FROM TWorkers AS TW JOIN TJobWorkers AS TJW
	ON TW.intWorkerID = TJW.intWorkerID

	JOIN TJobs AS TJ
	ON TJ.intJobID = TJW.intJobID
GROUP BY TW.strFirstName, TW.strLastName
HAVING COUNT(TJ.intJobID) >= 3



	
-- 4.12 Create a query to list all workers and their total # of skills. Make sure that you have workers that have 
--multiple skills and that you have at least 1 worker with no skills. The worker with no skills should be 
--included with a total number of skills = 0. Order by Worker ID. 

SELECT TW.intWorkerID
		,TW.strFirstName + ' ' + TW.strLastName AS 'Worker Name'
       ,COUNT(TWS.intSkillID) AS 'Total Skills'
FROM TWorkers AS TW LEFT JOIN TWorkerSkills AS TWS
ON TW.intWorkerID = TWS.intWorkerID
GROUP BY TW.intWorkerID, TW.strFirstName, TW.strLastName
ORDER BY TW.intWorkerID



-- 4.13 Write a query to list the total Charge to the customer for each job. 
--Calculate the total charge to the customer as the total cost of materials + total Labor costs + 30% Profit. 


SELECT TJ.intJobID, TC.intCustomerID
	   ,TC.strFirstName + ' ' + TC.strLastName AS 'Customer Name'
       ,SUM(TJM.intQuantity * TM.monCost) AS 'Total Material Cost'
       ,SUM(TJW.intHoursWorked * TW.monHourlyRate) AS 'Total Labor Cost'
       ,(SUM(TJM.intQuantity * TM.monCost) + SUM(TJW.intHoursWorked * TW.monHourlyRate)) * 1.3 AS 'Total Charge'
FROM TJobs AS TJ JOIN TJobMaterials TJM 
	ON TJ.intJobID = TJM.intJobID

	JOIN TMaterials AS TM
	ON TJM.intMaterialID = TM.intMaterialID
	
	JOIN TJobWorkers AS TJW 
	ON TJ.intJobID = TJW.intJobID
	
	JOIN TWorkers AS TW 
	ON TJW.intWorkerID = TW.intWorkerID
	
	JOIN TCustomers AS TC
	ON TJ.intCustomerID = TC.intCustomerID
GROUP BY TJ.intJobID, TC.intCustomerID
		,TC.strFirstName, TC.strLastName



--4.14 Write a query that totals what is owed to each vendor for a particular job. 

SELECT TV.intVendorID, TV.strVendorName,
       SUM(TJM.intQuantity * TM.monCost) AS 'Amount Owed'
FROM TJobMaterials AS TJM JOIN TMaterials AS TM 
	ON TJM.intMaterialID = TM.intMaterialID

	JOIN TVendors AS TV 
	ON TM.intVendorID = TV.intVendorID
WHERE TJM.intJobID = 10
GROUP BY TV.intVendorID, TV.strVendorName
