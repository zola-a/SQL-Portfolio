INSERT INTO TCustomersStates 
VALUES
		 ('1', 'Alabama'), ('2', 'Alaska'), ('3', 'Arizona'), ('4', 'Arkansas'), ('5', 'California')
		,('6', 'Colorado'), ('7', 'Connecticut'), ('8', 'Delaware'), ('9', 'Florida'), ('10', 'Georgia')
		,('11', 'Hawaii'), ('12', 'Idaho'), ('13', 'Illinois'), ('14', 'Indiana'), ('15', 'Iowa')
		,('16', 'Kansas'), ('17', 'Kentucky'), ('18', 'Louisiana'), ('19', 'Maine'), ('20', 'Maryland')
		,('21', 'Massachusetts'), ('22', 'Michigan'), ('23', 'Minnesota'), ('24', 'Mississippi'), ('25', 'Missouri')
		,('26', 'Montana'), ('27', 'Nebraska'), ('28', 'Nevada'), ('29', 'New Hampshire'), ('30', 'New Jersey')
		,('31', 'New Mexico'), ('32', 'New York'), ('33', 'North Carolina'), ('34', 'North Dakota'), ('35', 'Ohio')
		,('36', 'Oklahoma'), ('37', 'Oregon'), ('38', 'Pennsylvania'), ('39', 'Rhode Island'), ('40', 'South Carolina')
		,('41', 'South Dakota'), ('42', 'Tennessee'), ('43', 'Texas'), ('44', 'Utah'), ('45', 'Vermont')
		,('46', 'Virginia'), ('47', 'Washington'), ('48', 'West Virginia'), ('49', 'Wisconsin'), ('50', 'Wyoming')

INSERT INTO TCustomers 
VALUES
		 ('1', 'John', 'Smith', '123 Maple St', 'Columbus', '35', '43215', '614-555-0101')
		,('2', 'Mary', 'Johnson', '456 Oak St', 'Cincinnati', '35', '45202', '513-555-0202')
		,('3', 'James', 'Williams', '789 Pine St', 'Cleveland', '35', '44101', '216-555-0303')
		,('4', 'Patricia', 'Brown', '321 Birch St', 'Dayton', '35', '45402', '937-555-0404')
		,('5', 'Robert', 'Jones', '654 Cedar St', 'Louisville', '17', '40202', '502-555-0505')
		,('6', 'Linda', 'Garcia', '987 Spruce St', 'Lexington', '17', '40507', '859-555-0606')
		,('7', 'Michael', 'Martinez', '159 Elm St', 'Frankfort', '17', '40601', '502-555-0707')
		,('8', 'Barbara', 'Davis', '753 Walnut St', 'Covington', '17', '41011', '859-555-0808')
		,('9', 'Alice', 'Taylor', '101 Main St', 'Columbus', '35', '43215', '614-555-0909')
		,('10', 'Brian', 'Anderson', '202 Main St', 'Cincinnati', '35', '45202', '513-555-1011')
		,('11', 'Catherine', 'Moore', '303 Main St', 'Dayton', '35', '45402', '937-555-1112')
		,('12', 'Daniel', 'White', '404 Spruce St', 'Cleveland', '35', '44101', '216-555-1213')


INSERT INTO TStatuses 
VALUES
		 ('1', 'Open')
		,('2', 'Process')
		,('3', 'Complete')
		,('4', 'Complete')
		,('5', 'Process')
		,('6', 'Open')
		,('7', 'Complete')
		,('8', 'Open')
	

INSERT INTO TJobs 
VALUES
		 ('1', '1', '7', '2025-08-01', '2025-08-03', 'Install new HVAC system')
		,('2', '1', '2', '2025-08-05', '2025-08-07', 'Repair bathroom plumbing')   
		,('3', '2', '2', '2025-08-02', '2025-08-05', 'Repair plumbing leak')
		,('4', '3', '3', '2025-08-03', '2025-08-06', 'Paint exterior of house')
		,('5', '4', '4', '2025-08-04', '2025-08-06', 'Replace kitchen cabinets')
		,('6', '5', '5', '2025-08-05', '2025-08-08', 'Install new flooring')
		,('7', '5', '1', '2025-08-09', '2025-08-11', 'Repair roof damage')       
		,('8', '6', '6', '2025-08-06', '2025-08-08', 'Window replacement')
		,('9', '1', '3', '2025-08-10', '2025-08-12', 'Install ceiling fan')
		,('10', '1', '3', '2025-08-13', '2025-08-15', 'Replace faucet')
		,('11', '1', '4', '2025-08-16', '2025-08-17', 'Check water heater')
		,('12', '9', '3', '2025-08-05', '2025-08-05', 'Repair driveway')
		,('13', '10', '2', '2025-08-07', '2025-08-09', 'Replace light fixtures')
		,('14', '11', '8', '2025-08-08', '2025-08-09', 'Paint garage')



INSERT INTO TVendorsStates 
VALUES
		 ('1', 'Alabama'), ('2', 'Alaska'), ('3', 'Arizona'), ('4', 'Arkansas'), ('5', 'California')
		,('6', 'Colorado'), ('7', 'Connecticut'), ('8', 'Delaware'), ('9', 'Florida'), ('10', 'Georgia')
		,('11', 'Hawaii'), ('12', 'Idaho'), ('13', 'Illinois'), ('14', 'Indiana'), ('15', 'Iowa')
		,('16', 'Kansas'), ('17', 'Kentucky'), ('18', 'Louisiana'), ('19', 'Maine'), ('20', 'Maryland')
		,('21', 'Massachusetts'), ('22', 'Michigan'), ('23', 'Minnesota'), ('24', 'Mississippi'), ('25', 'Missouri')
		,('26', 'Montana'), ('27', 'Nebraska'), ('28', 'Nevada'), ('29', 'New Hampshire'), ('30', 'New Jersey')
		,('31', 'New Mexico'), ('32', 'New York'), ('33', 'North Carolina'), ('34', 'North Dakota'), ('35', 'Ohio')
		,('36', 'Oklahoma'), ('37', 'Oregon'), ('38', 'Pennsylvania'), ('39', 'Rhode Island'), ('40', 'South Carolina')
		,('41', 'South Dakota'), ('42', 'Tennessee'), ('43', 'Texas'), ('44', 'Utah'), ('45', 'Vermont')
		,('46', 'Virginia'), ('47', 'Washington'), ('48', 'West Virginia'), ('49', 'Wisconsin'), ('50', 'Wyoming')



INSERT INTO TVendors 
VALUES
		 ('1', 'Ohio Supply Co', '101 Industrial Rd', 'Columbus', '35', '43215', '614-555-1010')
		,('2', 'Cincinnati Tools', '202 Tool St', 'Cincinnati', '35', '45202', '513-555-2020')
		,('3', 'Cleveland Hardware', '303 Warehouse Ln', 'Cleveland', '35', '44101', '216-555-3030')
		,('4', 'Dayton Equipment', '404 Factory Dr', 'Dayton', '35', '45402', '937-555-4040')
		,('5', 'Louisville Supplies', '505 Market St', 'Louisville', '17', '40202', '502-555-5050')
		,('6', 'Lexington Tools', '606 Main St', 'Lexington', '17', '40507', '859-555-6060')
		,('7', 'Frankfort Materials', '707 Depot Rd', 'Frankfort', '17', '40601', '502-555-7070')
		,('8', 'Covington Hardware', '808 Supply Ave', 'Covington', '17', '41011', '859-555-8080')


INSERT INTO TMaterials 
VALUES
		 ('1', 'HVAC Unit', '2500.00', '1')
		,('2', 'PVC Pipes', '120.00', '2')
		,('3', 'Exterior Paint', '80.00', '3')
		,('4', 'Kitchen Cabinets Set', '1500.00', '4')
		,('5', 'Hardwood Flooring', '600.00', '5')
		,('6', 'Roof Shingles', '400.00', '6')
		,('7', 'Garden Soil', '50.00', '7')
		,('8', 'Double Pane Windows', '800.00', '8')
		,('9', 'Light Fixtures', '150.00', '2')
		,('10', 'Ceiling Fan', '250.00', '1')
		,('11', 'Faucet', '75.00', '3')
		,('12', 'Driveway Concrete', '300.00', '4')
		,('13', 'Garage Paint', '60.00', '3')
		,('14', 'Unused Material A', '100.00', '5')
		,('15', 'Unused Material B', '200.00', '6')


INSERT INTO TWorkersStates 
VALUES
		 ('1', 'Alabama'), ('2', 'Alaska'), ('3', 'Arizona'), ('4', 'Arkansas'), ('5', 'California')
		,('6', 'Colorado'), ('7', 'Connecticut'), ('8', 'Delaware'), ('9', 'Florida'), ('10', 'Georgia')
		,('11', 'Hawaii'), ('12', 'Idaho'), ('13', 'Illinois'), ('14', 'Indiana'), ('15', 'Iowa')
		,('16', 'Kansas'), ('17', 'Kentucky'), ('18', 'Louisiana'), ('19', 'Maine'), ('20', 'Maryland')
		,('21', 'Massachusetts'), ('22', 'Michigan'), ('23', 'Minnesota'), ('24', 'Mississippi'), ('25', 'Missouri')
		,('26', 'Montana'), ('27', 'Nebraska'), ('28', 'Nevada'), ('29', 'New Hampshire'), ('30', 'New Jersey')
		,('31', 'New Mexico'), ('32', 'New York'), ('33', 'North Carolina'), ('34', 'North Dakota'), ('35', 'Ohio')
		,('36', 'Oklahoma'), ('37', 'Oregon'), ('38', 'Pennsylvania'), ('39', 'Rhode Island'), ('40', 'South Carolina')
		,('41', 'South Dakota'), ('42', 'Tennessee'), ('43', 'Texas'), ('44', 'Utah'), ('45', 'Vermont')
		,('46', 'Virginia'), ('47', 'Washington'), ('48', 'West Virginia'), ('49', 'Wisconsin'), ('50', 'Wyoming')


INSERT INTO TWorkers 
VALUES
		 ('1', 'Tom', 'Harris', '11 Elm St', 'Columbus', '35', '43215', '614-555-1111', '2025-01-05', '25.00')
		,('2', 'Sara', 'Lee', '22 Pine St', 'Cincinnati', '35', '45202', '513-555-2222', '2024-01-07', '27.00')
		,('3', 'Paul', 'Walker', '33 Oak St', 'Cleveland', '35', '44101', '216-555-3333', '2023-01-09', '30.00')
		,('4', 'Nancy', 'Adams', '44 Maple St', 'Dayton', '35', '45402', '937-555-4444', '2025-01-11', '28.00')
		,('5', 'Kevin', 'Baker', '55 Cedar St', 'Louisville', '17', '40202', '502-555-5555', '2024-01-13', '26.00')
		,('6', 'Emily', 'Clark', '66 Birch St', 'Lexington', '17','40507', '859-555-6666', '2022-01-15', '29.00')
		,('7', 'Frank', 'Hughes', '77 Maple St', 'Columbus', '35', '43215', '614-555-1313', '2023-05-01', '28.00')
		,('8', 'Grace', 'Perry', '88 Oak St', 'Cincinnati', '35', '45202', '513-555-1414', '2024-03-01', '26.00')
		,('9', 'Hannah', 'Bell', '99 Pine St', 'Dayton', '35', '45402', '937-555-1515', '2025-01-01', '24.00')
		,('10', 'Lola', 'Bella', '123 Guess St', 'Cincinnati', '35', '45345', '513-443-3333', '2024-09-02', '23.00')



INSERT INTO TSkills  
VALUES
		 ('1', 'Plumbing', 'Fixing pipes, leaks, and water systems')
		,('2', 'Electrical', 'Installing and repairing electrical systems')
		,('3', 'Carpentry', 'Woodwork including furniture and structures')
		,('4', 'Painting', 'Interior and exterior painting')
		,('5', 'HVAC', 'Heating, ventilation, and air conditioning systems')
		,('6', 'Landscaping', 'Garden and lawn design and maintenance')
		,('7', 'Roofing', 'Roof construction and repair')
		,('8', 'Flooring', 'Installation of hardwood, tile, and laminate floors')
		,('9', 'Masonry', 'Brick and stone work')
		,('10', 'Lighting', 'Installation of lighting systems')


INSERT INTO TWorkerSkills 
VALUES
		 ('1', '1', '5')   
		,('2', '2', '1')  
		,('3', '3', '4')   
		,('4', '4', '3')  
		,('5', '5', '8')  
		,('6', '5', '7')  
		,('7', '6', '2')   
		,('8', '6', '6')   
		,('9', '7', '9')   
		,('10', '8', '10')
		,('11', '9', '4') 



INSERT INTO TJobMaterials 
VALUES
		 ('1', '1', '1', '11')   
		 ,('2', '2', '2', '5')   
		,('3', '3', '3', '25')   
		,('4', '4', '4', '12')   
		,('5', '5', '5', '3')   
		,('6', '6', '6', '12')   
		,('7', '7', '7', '14')  
		,('8', '8', '8', '20')   
		,('9', '9', '10', '2') 
		,('10', '10', '11', '3') 
		,('11', '12', '12', '4') 
		,('12', '14', '13', '5') 





INSERT INTO TJobWorkers 
VALUES
     ('1', '1', '1', '48')  
    ,('2', '2', '2', '36')  
    ,('3', '3', '3', '20')  
    ,('4', '4', '4', '39')
    ,('5', '5', '5', '12')  
    ,('6', '6', '6', '27')  
    ,('7', '7', '2', '25')  
    ,('8', '8', '4', '0')   
	,('9', '9', '1', '25')
    ,('10', '10', '2', '16') 
    ,('11', '11', '1', '14') 
    ,('12', '12', '7', '38') 
    ,('13', '13', '8', '17') 
    ,('14', '14', '9', '26') 
