-- ============================================================================
-- NGO DATABASE - TEST DATA (LEBANESE)
-- ============================================================================
-- All data uses Lebanese names, cities, and information
-- No NULL values - all fields populated
-- All projects have managers assigned
-- ============================================================================

-- ============================================================================
-- 1. LOCATIONS (Lebanese Cities and Regions)
-- ============================================================================

SET IDENTITY_INSERT LOCATIONS ON;

INSERT INTO LOCATIONS
    (LocationID, GPS_Coordinates, City, Region, Country)
VALUES
    (1, '33.8938,35.5018', 'Beirut', 'Beirut Governorate', 'Lebanon'),
    (2, '34.4367,35.8497', 'Tripoli', 'North Governorate', 'Lebanon'),
    (3, '33.5571,35.3729', 'Sidon', 'South Governorate', 'Lebanon'),
    (4, '33.2705,35.1956', 'Tyre', 'South Governorate', 'Lebanon'),
    (5, '33.9806,35.6178', 'Jounieh', 'Mount Lebanon', 'Lebanon'),
    (6, '34.1236,35.6511', 'Byblos', 'Mount Lebanon', 'Lebanon'),
    (7, '33.8463,35.9019', 'Zahle', 'Bekaa Governorate', 'Lebanon'),
    (8, '34.0047,36.2110', 'Baalbek', 'Baalbek-Hermel', 'Lebanon'),
    (9, '33.3772,35.4839', 'Nabatieh', 'Nabatieh Governorate', 'Lebanon'),
    (10, '34.2533,35.6572', 'Batroun', 'North Governorate', 'Lebanon');

SET IDENTITY_INSERT LOCATIONS OFF;

-- ============================================================================
-- 2. SKILLS
-- ============================================================================
SET IDENTITY_INSERT SKILLS ON;

INSERT INTO SKILLS
    (SkillID, SkillName)
VALUES
    (1, 'Project Management'),
    (2, 'First Aid'),
    (3, 'Arabic Translation'),
    (4, 'English Translation'),
    (5, 'French Translation'),
    (6, 'Logistics Coordination'),
    (7, 'Community Outreach'),
    (8, 'Data Entry'),
    (9, 'Financial Management'),
    (10, 'Social Work'),
    (11, 'Medical Assistance'),
    (12, 'Teaching'),
    (13, 'Driving'),
    (14, 'IT Support'),
    (15, 'Counseling');

SET IDENTITY_INSERT SKILLS OFF;

-- ============================================================================
-- 3. PEOPLE (Employees and Volunteers - Lebanese Names)
-- ============================================================================
SET IDENTITY_INSERT PEOPLE ON;

-- Employees (PersonID 1-15)
INSERT INTO PEOPLE
    (PersonID, FullName, Address, Phone, Email, PersonType)
VALUES
    (1, 'Ahmad Nassif', 'Hamra Street 45, Beirut', '+961-1-234001', 'ahmad.nassif@ngo.org.lb', 'Employee'),
    (2, 'Fatima Khoury', 'Ashrafieh, Mar Mikhael, Beirut', '+961-1-234002', 'fatima.khoury@ngo.org.lb', 'Employee'),
    (3, 'Hassan Tabbara', 'Mina Street 12, Tripoli', '+961-6-234003', 'hassan.tabbara@ngo.org.lb', 'Employee'),
    (4, 'Mariam Sarkis', 'Saifi Village, Beirut', '+961-1-234004', 'mariam.sarkis@ngo.org.lb', 'Employee'),
    (5, 'Karim Bitar', 'Riad El Solh, Beirut', '+961-1-234005', 'karim.bitar@ngo.org.lb', 'Employee'),
    (6, 'Nour Kassar', 'Sidon Old City', '+961-7-234006', 'nour.kassar@ngo.org.lb', 'Employee'),
    (7, 'Fares Noun', 'Chouf Mountains, Mount Lebanon', '+961-5-234007', 'fares.noun@ngo.org.lb', 'Employee'),
    (8, 'Layla Tohme', 'Zgharta, North Lebanon', '+961-6-234008', 'layla.tohme@ngo.org.lb', 'Employee'),
    (9, 'Rami Fayad', 'Bsharri, North Lebanon', '+961-6-234009', 'rami.fayad@ngo.org.lb', 'Employee'),
    (10, 'Sara Karam', 'Al-Koura, Tripoli', '+961-6-234010', 'sara.karam@ngo.org.lb', 'Employee'),
    (11, 'Fadi Najem', 'Moussaitbeh, Beirut', '+961-1-234011', 'fadi.najem@ngo.org.lb', 'Employee'),
    (12, 'Rana Haddad', 'Jounieh Bay Area', '+961-9-234012', 'rana.haddad@ngo.org.lb', 'Employee'),
    (13, 'Walid Abboud', 'Zahle Main Street', '+961-8-234013', 'walid.abboud@ngo.org.lb', 'Employee'),
    (14, 'Maya Saad', 'Baalbek Old Town', '+961-8-234014', 'maya.saad@ngo.org.lb', 'Employee'),
    (15, 'Sami Mansour', 'Nabatieh Center', '+961-7-234015', 'sami.mansour@ngo.org.lb', 'Employee');

-- Volunteers (PersonID 16-30)
INSERT INTO PEOPLE
    (PersonID, FullName, Address, Phone, Email, PersonType)
VALUES
    (16, 'Ali Khalil', 'Verdun, Beirut', '+961-3-567001', 'ali.khalil@volunteer.lb', 'Volunteer'),
    (17, 'Zeina Tabbara', 'Ain El Mreisseh, Beirut', '+961-3-567002', 'zeina.tabbara@volunteer.lb', 'Volunteer'),
    (18, 'Hussein Itani', 'Basta, Beirut', '+961-3-567003', 'hussein.itani@volunteer.lb', 'Volunteer'),
    (19, 'Lara Safi', 'Dekwaneh, Mount Lebanon', '+961-3-567004', 'lara.safi@volunteer.lb', 'Volunteer'),
    (20, 'Georges Najjar', 'Antelias, Mount Lebanon', '+961-3-567005', 'georges.najjar@volunteer.lb', 'Volunteer'),
    (21, 'Nadine Mouawad', 'Batroun Old Souk', '+961-3-567006', 'nadine.mouawad@volunteer.lb', 'Volunteer'),
    (22, 'Pierre Azar', 'Byblos Harbor', '+961-3-567007', 'pierre.azar@volunteer.lb', 'Volunteer'),
    (23, 'Ghada Frem', 'Dbayeh, Mount Lebanon', '+961-3-567008', 'ghada.frem@volunteer.lb', 'Volunteer'),
    (24, 'Antoine Assaf', 'Broummana, Mount Lebanon', '+961-3-567009', 'antoine.assaf@volunteer.lb', 'Volunteer'),
    (25, 'Hala Daher', 'Aley, Mount Lebanon', '+961-3-567010', 'hala.daher@volunteer.lb', 'Volunteer'),
    (26, 'Michel Sabbagh', 'Tyre Coastal Road', '+961-3-567011', 'michel.sabbagh@volunteer.lb', 'Volunteer'),
    (27, 'Rania Rizk', 'Bint Jbeil, South Lebanon', '+961-3-567012', 'rania.rizk@volunteer.lb', 'Volunteer'),
    (28, 'Elie Slim', 'Marjayoun, South Lebanon', '+961-3-567013', 'elie.slim@volunteer.lb', 'Volunteer'),
    (29, 'Joumana Traboulsi', 'Hermel, Baalbek-Hermel', '+961-3-567014', 'joumana.traboulsi@volunteer.lb', 'Volunteer'),
    (30, 'Charbel Hamadeh', 'Rashaya, Bekaa', '+961-3-567015', 'charbel.hamadeh@volunteer.lb', 'Volunteer');

SET IDENTITY_INSERT PEOPLE OFF;

-- ============================================================================
-- 4. EMPLOYEES
-- ============================================================================
INSERT INTO EMPLOYEES
    (PersonID, JobTitle, Department, HireDate)
VALUES
    (1, 'Executive Director', 'Administration', '2018-01-15'),
    (2, 'Finance Manager', 'Finance', '2018-03-01'),
    (3, 'Operations Manager', 'Operations', '2018-06-15'),
    (4, 'HR Manager', 'Human Resources', '2019-01-10'),
    (5, 'Project Manager', 'Programs', '2019-04-01'),
    (6, 'Project Manager', 'Programs', '2019-07-15'),
    (7, 'Field Coordinator', 'Operations', '2020-02-01'),
    (8, 'Communications Officer', 'Communications', '2020-05-15'),
    (9, 'Logistics Officer', 'Operations', '2020-08-01'),
    (10, 'M&E Officer', 'Programs', '2021-01-15'),
    (11, 'Accountant', 'Finance', '2021-04-01'),
    (12, 'Program Assistant', 'Programs', '2021-07-15'),
    (13, 'Warehouse Manager', 'Operations', '2022-01-10'),
    (14, 'Community Liaison', 'Programs', '2022-06-01'),
    (15, 'IT Administrator', 'Administration', '2023-01-15');

-- ============================================================================
-- 5. VOLUNTEERS
-- ============================================================================
INSERT INTO VOLUNTEERS
    (PersonID, Zone, Status)
VALUES
    (16, 'Beirut Central', 'Active'),
    (17, 'Beirut West', 'Active'),
    (18, 'Beirut South', 'Active'),
    (19, 'Mount Lebanon North', 'Active'),
    (20, 'Mount Lebanon Central', 'Active'),
    (21, 'North Lebanon Coast', 'Active'),
    (22, 'North Lebanon Inland', 'Active'),
    (23, 'Mount Lebanon South', 'On Leave'),
    (24, 'Mount Lebanon East', 'Active'),
    (25, 'Chouf Region', 'Active'),
    (26, 'South Lebanon Coast', 'Active'),
    (27, 'South Lebanon Inland', 'Active'),
    (28, 'Marjayoun District', 'Inactive'),
    (29, 'Baalbek-Hermel', 'Active'),
    (30, 'Bekaa Valley', 'Active');

-- ============================================================================
-- 6. PERSON_SKILLS
-- ============================================================================
INSERT INTO PERSON_SKILLS
    (PersonID, SkillID)
VALUES
    -- Employees
    (1, 1),
    (1, 9),
    (1, 7),
    (2, 9),
    (2, 8),
    (2, 1),
    (3, 1),
    (3, 6),
    (3, 13),
    (4, 7),
    (4, 10),
    (4, 15),
    (5, 1),
    (5, 6),
    (5, 7),
    (6, 1),
    (6, 10),
    (6, 12),
    (7, 6),
    (7, 13),
    (7, 2),
    (8, 3),
    (8, 4),
    (8, 5),
    (9, 6),
    (9, 13),
    (9, 8),
    (10, 8),
    (10, 1),
    (10, 14),
    (11, 9),
    (11, 8),
    (12, 8),
    (12, 7),
    (12, 3),
    (13, 6),
    (13, 13),
    (13, 8),
    (14, 7),
    (14, 10),
    (14, 3),
    (15, 14),
    (15, 8),
    -- Volunteers
    (16, 2),
    (16, 7),
    (16, 3),
    (17, 10),
    (17, 15),
    (17, 7),
    (18, 13),
    (18, 6),
    (18, 2),
    (19, 12),
    (19, 3),
    (19, 4),
    (20, 2),
    (20, 11),
    (20, 7),
    (21, 7),
    (21, 3),
    (21, 12),
    (22, 4),
    (22, 5),
    (22, 8),
    (23, 10),
    (23, 15),
    (23, 7),
    (24, 13),
    (24, 6),
    (24, 2),
    (25, 12),
    (25, 7),
    (25, 3),
    (26, 2),
    (26, 11),
    (26, 13),
    (27, 7),
    (27, 10),
    (27, 3),
    (28, 6),
    (28, 13),
    (28, 2),
    (29, 7),
    (29, 12),
    (29, 3),
    (30, 2),
    (30, 6),
    (30, 13);

-- ============================================================================
-- 7. DONORS (Lebanese and International)
-- ============================================================================
SET IDENTITY_INSERT DONORS ON;

INSERT INTO DONORS
    (DonorID, DonorName, DonorType, ContactPerson)
VALUES
    (1, 'Banque du Liban Foundation', 'Foundation', 'Marwan Khouri'),
    (2, 'Cedar Foundation', 'Foundation', 'Rima Fakhry'),
    (3, 'USAID Lebanon', 'Government', 'John Mitchell'),
    (4, 'European Union Delegation', 'Government', 'Maria Schmidt'),
    (5, 'Bank Audi CSR', 'Corporate', 'Samir Hanna'),
    (6, 'Blom Bank Foundation', 'Corporate', 'Nayla Chammas'),
    (7, 'Phoenix Foundation Lebanon', 'Foundation', 'Samir Kanaan'),
    (8, 'UNICEF Lebanon', 'Other', 'Yukie Mokuo'),
    (9, 'Lebanese Red Cross', 'Other', 'Antoine Zoghbi'),
    (10, 'Lebanese Welfare Association', 'Foundation', 'Walid Yazbek'),
    (11, 'Beirut Community Foundation', 'Foundation', 'Bassam Hamdan'),
    (12, 'North Lebanon Foundation', 'Foundation', 'Hisham Shatila'),
    (13, 'UNHCR Lebanon', 'Government', 'Ayaki Ito'),
    (14, 'World Food Programme', 'Government', 'Abdallah Al-Wardat'),
    (15, 'Mount Lebanon Foundation', 'Foundation', 'Diana Kallas');

SET IDENTITY_INSERT DONORS OFF;

-- ============================================================================
-- 8. GRANTS
-- ============================================================================
SET IDENTITY_INSERT GRANTS ON;

INSERT INTO GRANTS
    (GrantID, DonorID, GrantTitle, TotalAmount, Currency, ExpiryDate)
VALUES
    (1, 1, 'Community Development Initiative 2024', 500000.00, 'USD', '2025-12-31'),
    (2, 2, 'Education Support Program', 750000.00, 'USD', '2025-06-30'),
    (3, 3, 'Emergency Relief Fund', 1000000.00, 'USD', '2024-12-31'),
    (4, 4, 'Healthcare Access Project', 850000.00, 'EUR', '2025-09-30'),
    (5, 5, 'Youth Empowerment Grant', 300000.00, 'USD', '2025-03-31'),
    (6, 6, 'Rural Development Fund', 450000.00, 'USD', '2025-08-31'),
    (7, 7, 'Vocational Training Initiative', 600000.00, 'USD', '2025-12-31'),
    (8, 8, 'Child Protection Program', 900000.00, 'USD', '2025-06-30'),
    (9, 9, 'First Aid Training Grant', 200000.00, 'USD', '2024-12-31'),
    (10, 10, 'Social Welfare Support', 400000.00, 'USD', '2025-04-30'),
    (11, 11, 'Women Empowerment Fund', 550000.00, 'USD', '2025-10-31'),
    (12, 12, 'Infrastructure Rehabilitation', 700000.00, 'USD', '2025-07-31'),
    (13, 13, 'Refugee Assistance Program', 1200000.00, 'USD', '2025-12-31'),
    (14, 14, 'Food Security Initiative', 800000.00, 'USD', '2025-05-31'),
    (15, 15, 'Peace Building Project', 350000.00, 'USD', '2025-11-30');

SET IDENTITY_INSERT GRANTS OFF;

-- ============================================================================
-- 9. BENEFICIARIES (Lebanese Families)
-- ============================================================================
SET IDENTITY_INSERT BENEFICIARIES ON;

INSERT INTO BENEFICIARIES
    (BeneficiaryID, Name, DOB, Gender, Address, ContactInfo, SocioEconomicStatus)
VALUES
    (1, 'Mohammad Al-Amin', '1985-03-15', 'Male', 'Bourj Hammoud, Beirut', '+961-70-100001', 'Low Income'),
    (2, 'Khadija Hammoud', '1990-07-22', 'Female', 'Sabra, Beirut', '+961-70-100002', 'Low Income'),
    (3, 'Youssef Baydoun', '1978-11-08', 'Male', 'Bab Al-Tabbaneh, Tripoli', '+961-70-100003', 'Very Low Income'),
    (4, 'Amina Dandash', '1995-02-14', 'Female', 'Jabal Mohsen, Tripoli', '+961-70-100004', 'Low Income'),
    (5, 'Ibrahim Shamas', '1982-09-30', 'Male', 'Ein El-Hilweh, Sidon', '+961-70-100005', 'Very Low Income'),
    (6, 'Zahra Hijazi', '1988-05-18', 'Female', 'Miyeh ou Miyeh, Sidon', '+961-70-100006', 'Low Income'),
    (7, 'Mahmoud Bazzi', '1975-12-25', 'Male', 'Al-Bass, Tyre', '+961-70-100007', 'Very Low Income'),
    (8, 'Samira Fawaz', '1992-08-03', 'Female', 'Burj El-Shemali, Tyre', '+961-70-100008', 'Low Income'),
    (9, 'Khaled Obeid', '1980-04-11', 'Male', 'Hay El-Sellom, Beirut', '+961-70-100009', 'Low Income'),
    (10, 'Fatmeh Ayoub', '1987-01-27', 'Female', 'Ouzai, Beirut', '+961-70-100010', 'Very Low Income'),
    (11, 'Bilal Mroue', '1983-06-19', 'Male', 'Qobbeh, Tripoli', '+961-70-100011', 'Low Income'),
    (12, 'Nada Houssami', '1991-10-05', 'Female', 'Mankoubin, Tripoli', '+961-70-100012', 'Very Low Income'),
    (13, 'Adel Jaafar', '1979-03-28', 'Male', 'Baalbek Old Quarter', '+961-70-100013', 'Low Income'),
    (14, 'Maryam Chehab', '1994-12-12', 'Female', 'Brital, Baalbek', '+961-70-100014', 'Very Low Income'),
    (15, 'Mustafa Nassar', '1986-07-07', 'Male', 'Saadnayel, Bekaa', '+961-70-100015', 'Low Income'),
    (16, 'Reem Halawi', '1993-02-20', 'Female', 'Bar Elias, Bekaa', '+961-70-100016', 'Low Income'),
    (17, 'Tarek Diab', '1981-09-14', 'Male', 'Nabatieh Camp', '+961-70-100017', 'Very Low Income'),
    (18, 'Souad Moussawi', '1989-04-02', 'Female', 'Kfar Roummane, Nabatieh', '+961-70-100018', 'Low Income'),
    (19, 'Jamal Harb', '1977-11-23', 'Male', 'Rashidieh, Tyre', '+961-70-100019', 'Very Low Income'),
    (20, 'Hanan Khalifeh', '1996-08-16', 'Female', 'Shatila, Beirut', '+961-70-100020', 'Very Low Income'),
    (21, 'Nabil Rahhal', '1984-05-09', 'Male', 'Tariq El-Jdideh, Beirut', '+961-70-100021', 'Low Income'),
    (22, 'Lamia Zein', '1990-01-31', 'Female', 'Cola, Beirut', '+961-70-100022', 'Low Income'),
    (23, 'Wael Kobeissi', '1976-10-17', 'Male', 'Chiyah, Beirut', '+961-70-100023', 'Very Low Income'),
    (24, 'Iman Raad', '1988-03-24', 'Female', 'Ghobeiry, Beirut', '+961-70-100024', 'Low Income'),
    (25, 'Samir Fakhoury', '1982-12-06', 'Male', 'Akkar Plains', '+961-70-100025', 'Very Low Income'),
    (26, 'Dalal Shaar', '1995-07-29', 'Female', 'Wadi Khaled, Akkar', '+961-70-100026', 'Very Low Income'),
    (27, 'Riad Wehbe', '1980-02-13', 'Male', 'Hermel Town', '+961-70-100027', 'Low Income'),
    (28, 'Hayat Noun', '1992-06-08', 'Female', 'Labweh, Baalbek', '+961-70-100028', 'Low Income'),
    (29, 'Fouad Darwish', '1978-09-21', 'Male', 'Marjayoun Town', '+961-70-100029', 'Low Income'),
    (30, 'Nisreen Saleh', '1986-04-15', 'Female', 'Khiam, South Lebanon', '+961-70-100030', 'Very Low Income');

SET IDENTITY_INSERT BENEFICIARIES OFF;

-- ============================================================================
-- 10. SUPPLIERS (Lebanese Companies)
-- ============================================================================
SET IDENTITY_INSERT SUPPLIERS ON;

INSERT INTO SUPPLIERS
    (SupplierID, CompanyName, Phone, Email)
VALUES
    (1, 'Spinney''s Lebanon', '+961-1-888001', 'wholesale@spinneys.com.lb'),
    (2, 'Bou Khalil Trading', '+961-1-888002', 'orders@boukhalil.com.lb'),
    (3, 'Fattal Medical Supplies', '+961-1-888003', 'sales@fattal.com.lb'),
    (4, 'Pharmaline SAL', '+961-1-888004', 'info@pharmaline.com.lb'),
    (5, 'ABC Department Stores', '+961-1-888005', 'corporate@abc.com.lb'),
    (6, 'Malco Trading', '+961-1-888006', 'supplies@malco.com.lb'),
    (7, 'Levant Distributors', '+961-1-888007', 'orders@levantdist.com.lb'),
    (8, 'Cedar Pharmaceuticals', '+961-1-888008', 'wholesale@cedarpharma.com.lb'),
    (9, 'Phoenicia Food Industries', '+961-1-888009', 'bulk@phoeniciafood.com.lb'),
    (10, 'Al-Mawarid Trading', '+961-1-888010', 'info@almawarid.com.lb');

SET IDENTITY_INSERT SUPPLIERS OFF;

-- ============================================================================
-- 11. INVENTORY
-- ============================================================================
SET IDENTITY_INSERT INVENTORY ON;

INSERT INTO INVENTORY
    (ItemID, SupplierID, ItemName, UnitOfMeasure)
VALUES
    (1, 1, 'Rice (25kg bag)', 'Bag'),
    (2, 1, 'Flour (25kg bag)', 'Bag'),
    (3, 1, 'Cooking Oil (5L)', 'Bottle'),
    (4, 1, 'Sugar (10kg bag)', 'Bag'),
    (5, 2, 'Canned Beans (400g)', 'Can'),
    (6, 2, 'Canned Tuna (185g)', 'Can'),
    (7, 2, 'Pasta (500g)', 'Pack'),
    (8, 9, 'Lentils (1kg)', 'Bag'),
    (9, 3, 'First Aid Kit', 'Kit'),
    (10, 3, 'Bandages (Box of 100)', 'Box'),
    (11, 4, 'Paracetamol (500mg, 100 tablets)', 'Box'),
    (12, 4, 'Antiseptic Solution (500ml)', 'Bottle'),
    (13, 8, 'Ibuprofen (400mg, 50 tablets)', 'Box'),
    (14, 5, 'Blankets (Fleece)', 'Piece'),
    (15, 5, 'Mattresses (Single)', 'Piece'),
    (16, 6, 'Hygiene Kit', 'Kit'),
    (17, 6, 'Baby Diapers (Pack of 30)', 'Pack'),
    (18, 7, 'School Bags', 'Piece'),
    (19, 7, 'Notebooks (Pack of 5)', 'Pack'),
    (20, 7, 'Pen Set (10 pens)', 'Set'),
    (21, 10, 'Water Bottles (1.5L, Pack of 6)', 'Pack'),
    (22, 10, 'Soap Bars (Pack of 6)', 'Pack'),
    (23, 6, 'Toothpaste (100ml)', 'Tube'),
    (24, 6, 'Shampoo (500ml)', 'Bottle'),
    (25, 9, 'Chickpeas (1kg)', 'Bag');

SET IDENTITY_INSERT INVENTORY OFF;

-- ============================================================================
-- 12. WAREHOUSE_STOCK
-- ============================================================================
SET IDENTITY_INSERT WAREHOUSE_STOCK ON;

INSERT INTO WAREHOUSE_STOCK
    (StockID, ItemID, LocationID, Quantity, ExpiryDate)
VALUES
    -- Beirut Warehouse
    (1, 1, 1, 500.00, '2025-06-30'),
    (2, 2, 1, 400.00, '2025-05-31'),
    (3, 3, 1, 300.00, '2025-12-31'),
    (4, 4, 1, 250.00, '2025-08-31'),
    (5, 9, 1, 100.00, '2026-12-31'),
    (6, 14, 1, 200.00, '2030-01-01'),
    (7, 16, 1, 150.00, '2025-09-30'),
    -- Tripoli Warehouse
    (8, 1, 2, 350.00, '2025-06-30'),
    (9, 5, 2, 600.00, '2026-03-31'),
    (10, 6, 2, 500.00, '2026-06-30'),
    (11, 11, 2, 200.00, '2025-12-31'),
    (12, 18, 2, 100.00, '2030-01-01'),
    -- Sidon Warehouse
    (13, 1, 3, 400.00, '2025-06-30'),
    (14, 7, 3, 800.00, '2025-09-30'),
    (15, 8, 3, 300.00, '2025-11-30'),
    (16, 15, 3, 50.00, '2030-01-01'),
    (17, 17, 3, 200.00, '2025-04-30'),
    -- Zahle Warehouse
    (18, 1, 7, 300.00, '2025-06-30'),
    (19, 2, 7, 250.00, '2025-05-31'),
    (20, 10, 7, 150.00, '2026-08-31'),
    (21, 12, 7, 100.00, '2025-10-31'),
    (22, 21, 7, 400.00, '2025-03-31'),
    -- Baalbek Warehouse
    (23, 1, 8, 250.00, '2025-06-30'),
    (24, 3, 8, 150.00, '2025-12-31'),
    (25, 19, 8, 300.00, '2030-01-01'),
    (26, 20, 8, 250.00, '2030-01-01'),
    (27, 25, 8, 200.00, '2025-10-31');

SET IDENTITY_INSERT WAREHOUSE_STOCK OFF;

-- ============================================================================
-- 13. PROJECTS (All with Managers - No NULL ManagerID)
-- ============================================================================
SET IDENTITY_INSERT PROJECTS ON;

INSERT INTO PROJECTS
    (ProjectID, ProjectName, Description, Status, ManagerID, StartDate, EndDate)
VALUES
    (1, 'Beirut Emergency Relief', 'Emergency food and medical assistance for vulnerable families in Beirut following economic crisis', 'Active', 5, '2024-01-01', '2024-12-31'),
    (2, 'North Lebanon Education Initiative', 'Providing educational support and school supplies to children in Tripoli and Akkar', 'Active', 6, '2024-02-01', '2025-01-31'),
    (3, 'South Lebanon Healthcare Access', 'Mobile health clinics and medical outreach in underserved areas of South Lebanon', 'Active', 5, '2024-03-01', '2025-02-28'),
    (4, 'Bekaa Valley Food Security', 'Agricultural support and food distribution program in Bekaa region', 'Active', 6, '2024-01-15', '2024-12-15'),
    (5, 'Youth Empowerment Beirut', 'Vocational training and job placement for youth aged 18-25 in Greater Beirut', 'Planned', 5, '2024-06-01', '2025-05-31'),
    (6, 'Women Economic Empowerment', 'Microfinance and skills training for women-headed households across Lebanon', 'Active', 6, '2024-04-01', '2025-03-31'),
    (7, 'Child Protection Program', 'Psychosocial support and safe spaces for vulnerable children nationwide', 'Active', 5, '2024-02-15', '2025-02-14'),
    (8, 'Refugee Integration Support', 'Integration assistance for refugee families in host communities', 'Active', 6, '2024-03-15', '2025-03-14'),
    (9, 'Rural Water and Sanitation', 'WASH infrastructure improvement in rural Akkar and Hermel', 'Planned', 5, '2024-07-01', '2025-06-30'),
    (10, 'Elderly Care Initiative', 'Home care and support services for elderly individuals living alone', 'Active', 6, '2024-05-01', '2025-04-30');

SET IDENTITY_INSERT PROJECTS OFF;

-- ============================================================================
-- 14. PROJECT_LOCATIONS
-- ============================================================================
INSERT INTO PROJECT_LOCATIONS
    (ProjectID, LocationID)
VALUES
    (1, 1),
    -- Beirut Emergency Relief - Beirut
    (1, 5),
    -- Beirut Emergency Relief - Jounieh
    (2, 2),
    -- North Lebanon Education - Tripoli
    (2, 10),
    -- North Lebanon Education - Batroun
    (3, 3),
    -- South Lebanon Healthcare - Sidon
    (3, 4),
    -- South Lebanon Healthcare - Tyre
    (3, 9),
    -- South Lebanon Healthcare - Nabatieh
    (4, 7),
    -- Bekaa Food Security - Zahle
    (4, 8),
    -- Bekaa Food Security - Baalbek
    (5, 1),
    -- Youth Empowerment - Beirut
    (5, 5),
    -- Youth Empowerment - Jounieh
    (6, 1),
    -- Women Empowerment - Beirut
    (6, 2),
    -- Women Empowerment - Tripoli
    (6, 3),
    -- Women Empowerment - Sidon
    (7, 1),
    -- Child Protection - Beirut
    (7, 2),
    -- Child Protection - Tripoli
    (7, 3),
    -- Child Protection - Sidon
    (7, 7),
    -- Child Protection - Zahle
    (8, 1),
    -- Refugee Integration - Beirut
    (8, 7),
    -- Refugee Integration - Zahle
    (8, 8),
    -- Refugee Integration - Baalbek
    (9, 2),
    -- Rural WASH - Tripoli (Akkar)
    (9, 8),
    -- Rural WASH - Baalbek (Hermel)
    (10, 1),
    -- Elderly Care - Beirut
    (10, 2),
    -- Elderly Care - Tripoli
    (10, 3);
-- Elderly Care - Sidon

-- ============================================================================
-- 15. PROJECT_BENEFICIARIES
-- ============================================================================
SET IDENTITY_INSERT PROJECT_BENEFICIARIES ON;

INSERT INTO PROJECT_BENEFICIARIES
    (PB_ID, ProjectID, BeneficiaryID, EnrollmentDate)
VALUES
    -- Beirut Emergency Relief
    (1, 1, 1, '2024-01-15'),
    (2, 1, 2, '2024-01-15'),
    (3, 1, 9, '2024-01-20'),
    (4, 1, 10, '2024-01-20'),
    (5, 1, 20, '2024-02-01'),
    (6, 1, 21, '2024-02-01'),
    (7, 1, 22, '2024-02-05'),
    (8, 1, 23, '2024-02-10'),
    (9, 1, 24, '2024-02-10'),
    -- North Lebanon Education
    (10, 2, 3, '2024-02-15'),
    (11, 2, 4, '2024-02-15'),
    (12, 2, 11, '2024-02-20'),
    (13, 2, 12, '2024-02-20'),
    (14, 2, 25, '2024-03-01'),
    (15, 2, 26, '2024-03-01'),
    -- South Lebanon Healthcare
    (16, 3, 5, '2024-03-10'),
    (17, 3, 6, '2024-03-10'),
    (18, 3, 7, '2024-03-15'),
    (19, 3, 8, '2024-03-15'),
    (20, 3, 17, '2024-03-20'),
    (21, 3, 18, '2024-03-20'),
    (22, 3, 19, '2024-03-25'),
    (23, 3, 29, '2024-04-01'),
    (24, 3, 30, '2024-04-01'),
    -- Bekaa Food Security
    (25, 4, 13, '2024-01-25'),
    (26, 4, 14, '2024-01-25'),
    (27, 4, 15, '2024-02-01'),
    (28, 4, 16, '2024-02-01'),
    (29, 4, 27, '2024-02-10'),
    (30, 4, 28, '2024-02-10'),
    -- Women Economic Empowerment
    (31, 6, 2, '2024-04-10'),
    (32, 6, 6, '2024-04-10'),
    (33, 6, 10, '2024-04-15'),
    (34, 6, 12, '2024-04-15'),
    (35, 6, 18, '2024-04-20'),
    (36, 6, 20, '2024-04-20'),
    (37, 6, 22, '2024-04-25'),
    (38, 6, 24, '2024-04-25'),
    (39, 6, 26, '2024-05-01'),
    (40, 6, 28, '2024-05-01'),
    -- Child Protection Program
    (41, 7, 1, '2024-02-20'),
    (42, 7, 3, '2024-02-20'),
    (43, 7, 5, '2024-02-25'),
    (44, 7, 7, '2024-02-25'),
    (45, 7, 13, '2024-03-01'),
    -- Refugee Integration Support
    (46, 8, 20, '2024-03-20'),
    (47, 8, 14, '2024-03-20'),
    (48, 8, 16, '2024-03-25'),
    (49, 8, 28, '2024-03-25'),
    -- Elderly Care Initiative
    (50, 10, 7, '2024-05-10'),
    (51, 10, 19, '2024-05-10'),
    (52, 10, 23, '2024-05-15'),
    (53, 10, 25, '2024-05-15'),
    (54, 10, 29, '2024-05-20');

SET IDENTITY_INSERT PROJECT_BENEFICIARIES OFF;

-- ============================================================================
-- 16. PROJECT_FUNDING
-- ============================================================================
SET IDENTITY_INSERT PROJECT_FUNDING ON;

INSERT INTO PROJECT_FUNDING
    (FundingID, ProjectID, GrantID, AmountAllocated)
VALUES
    (1, 1, 3, 300000.00),
    -- Beirut Emergency - USAID
    (2, 1, 9, 50000.00),
    -- Beirut Emergency - Red Cross
    (3, 2, 2, 400000.00),
    -- North Education - Cedar Foundation
    (4, 2, 8, 200000.00),
    -- North Education - UNICEF
    (5, 3, 4, 500000.00),
    -- South Healthcare - EU
    (6, 3, 9, 100000.00),
    -- South Healthcare - Red Cross
    (7, 4, 14, 400000.00),
    -- Bekaa Food - WFP
    (8, 4, 1, 150000.00),
    -- Bekaa Food - BDL Foundation
    (9, 5, 5, 200000.00),
    -- Youth Empowerment - Bank Audi
    (10, 5, 7, 300000.00),
    -- Youth Empowerment - Phoenix Foundation
    (11, 6, 11, 400000.00),
    -- Women Empowerment - Beirut Community Foundation
    (12, 6, 6, 200000.00),
    -- Women Empowerment - Blom Bank
    (13, 7, 8, 500000.00),
    -- Child Protection - UNICEF
    (14, 7, 10, 150000.00),
    -- Child Protection - Lebanese Welfare Association
    (15, 8, 13, 600000.00),
    -- Refugee Integration - UNHCR
    (16, 8, 4, 200000.00),
    -- Refugee Integration - EU
    (17, 9, 12, 350000.00),
    -- Rural WASH - North Lebanon Foundation
    (18, 9, 1, 200000.00),
    -- Rural WASH - BDL Foundation
    (19, 10, 15, 200000.00),-- Elderly Care - Mount Lebanon Foundation
    (20, 10, 10, 150000.00);-- Elderly Care - Lebanese Welfare Association

SET IDENTITY_INSERT PROJECT_FUNDING OFF;

-- ============================================================================
-- 17. BUDGETS
-- ============================================================================
SET IDENTITY_INSERT BUDGETS ON;

INSERT INTO BUDGETS
    (BudgetID, ProjectID, Category, AllocatedAmount, FiscalYear)
VALUES
    -- Beirut Emergency Relief
    (1, 1, 'Food Supplies', 150000.00, 2024),
    (2, 1, 'Medical Supplies', 100000.00, 2024),
    (3, 1, 'Staff Costs', 60000.00, 2024),
    (4, 1, 'Logistics', 40000.00, 2024),
    -- North Lebanon Education
    (5, 2, 'School Supplies', 200000.00, 2024),
    (6, 2, 'Teacher Training', 150000.00, 2024),
    (7, 2, 'Infrastructure', 180000.00, 2024),
    (8, 2, 'Staff Costs', 70000.00, 2024),
    -- South Lebanon Healthcare
    (9, 3, 'Medical Equipment', 200000.00, 2024),
    (10, 3, 'Medications', 150000.00, 2024),
    (11, 3, 'Mobile Clinics', 180000.00, 2024),
    (12, 3, 'Staff Costs', 70000.00, 2024),
    -- Bekaa Food Security
    (13, 4, 'Food Packages', 250000.00, 2024),
    (14, 4, 'Agricultural Inputs', 200000.00, 2024),
    (15, 4, 'Distribution Costs', 100000.00, 2024),
    -- Youth Empowerment
    (16, 5, 'Training Programs', 250000.00, 2024),
    (17, 5, 'Equipment', 150000.00, 2024),
    (18, 5, 'Stipends', 100000.00, 2024),
    -- Women Economic Empowerment
    (19, 6, 'Microfinance Fund', 300000.00, 2024),
    (20, 6, 'Skills Training', 200000.00, 2024),
    (21, 6, 'Childcare Support', 100000.00, 2024),
    -- Child Protection
    (22, 7, 'Safe Spaces', 200000.00, 2024),
    (23, 7, 'Psychosocial Support', 250000.00, 2024),
    (24, 7, 'Staff Costs', 200000.00, 2024),
    -- Refugee Integration
    (25, 8, 'Housing Support', 300000.00, 2024),
    (26, 8, 'Language Training', 200000.00, 2024),
    (27, 8, 'Legal Aid', 150000.00, 2024),
    (28, 8, 'Community Activities', 150000.00, 2024),
    -- Rural WASH
    (29, 9, 'Water Infrastructure', 300000.00, 2024),
    (30, 9, 'Sanitation Facilities', 200000.00, 2024),
    (31, 9, 'Community Training', 50000.00, 2024),
    -- Elderly Care
    (32, 10, 'Home Care Services', 200000.00, 2024),
    (33, 10, 'Medical Support', 100000.00, 2024),
    (34, 10, 'Social Activities', 50000.00, 2024);

SET IDENTITY_INSERT BUDGETS OFF;

-- ============================================================================
-- 18. RISKS
-- ============================================================================
SET IDENTITY_INSERT RISKS ON;

INSERT INTO RISKS
    (RiskID, ProjectID, Severity, Description)
VALUES
    (1, 1, 'High', 'Economic instability may increase demand beyond available resources'),
    (2, 1, 'Medium', 'Fuel shortages affecting distribution logistics'),
    (3, 2, 'Medium', 'School closures due to security situation in some areas'),
    (4, 2, 'Low', 'Teacher availability during summer months'),
    (5, 3, 'High', 'Access restrictions to some southern villages'),
    (6, 3, 'Medium', 'Medication shortages from suppliers'),
    (7, 4, 'High', 'Agricultural season delays due to climate conditions'),
    (8, 4, 'Medium', 'Rising food prices affecting procurement'),
    (9, 5, 'Medium', 'Low youth participation due to migration trends'),
    (10, 5, 'Low', 'Employer hesitancy for job placements'),
    (11, 6, 'Medium', 'Cultural barriers to women participation in some areas'),
    (12, 6, 'Low', 'Microfinance repayment challenges'),
    (13, 7, 'High', 'Psychological trauma cases exceeding capacity'),
    (14, 7, 'Medium', 'Staff burnout from demanding caseloads'),
    (15, 8, 'High', 'Tensions between refugee and host communities'),
    (16, 8, 'Medium', 'Legal documentation delays'),
    (17, 9, 'Medium', 'Construction material price fluctuations'),
    (18, 9, 'High', 'Water source contamination in target areas'),
    (19, 10, 'Medium', 'Difficulty reaching isolated elderly individuals'),
    (20, 10, 'Low', 'Volunteer availability for home visits');

SET IDENTITY_INSERT RISKS OFF;

-- ============================================================================
-- 19. TASKS
-- ============================================================================
SET IDENTITY_INSERT TASKS ON;

INSERT INTO TASKS
    (TaskID, TaskName, ProjectID, SupervisorID, Description, Status, Priority)
VALUES
    -- Beirut Emergency Relief Tasks
    (1, 'Food Package Distribution - Bourj Hammoud', 1, 7, 'Distribute 200 food packages to families in Bourj Hammoud area', 'Completed', 'High'),
    (2, 'Medical Supply Distribution - Sabra', 1, 7, 'Distribute medical supplies and first aid kits to Sabra community center', 'Completed', 'High'),
    (3, 'Food Package Distribution - Ouzai', 1, 9, 'Distribute 150 food packages to families in Ouzai area', 'In Progress', 'High'),
    (4, 'Beneficiary Assessment - Beirut South', 1, 14, 'Conduct needs assessment for new beneficiaries in southern Beirut', 'In Progress', 'Medium'),
    -- North Lebanon Education Tasks
    (5, 'School Supply Distribution - Tripoli', 2, 7, 'Distribute school bags and supplies to 500 students in Tripoli schools', 'Completed', 'High'),
    (6, 'Teacher Training Workshop - Batroun', 2, 12, 'Conduct 3-day teacher training workshop on modern teaching methods', 'Completed', 'Medium'),
    (7, 'School Renovation - Bab Al-Tabbaneh', 2, 9, 'Renovate classrooms and facilities at public school in Bab Al-Tabbaneh', 'In Progress', 'High'),
    (8, 'After-School Program Setup', 2, 12, 'Establish after-school tutoring program in 5 schools', 'Pending', 'Medium'),
    -- South Lebanon Healthcare Tasks
    (9, 'Mobile Clinic - Tyre', 3, 7, 'Operate mobile health clinic in Tyre district for 2 weeks', 'Completed', 'High'),
    (10, 'Mobile Clinic - Nabatieh', 3, 7, 'Operate mobile health clinic in Nabatieh district for 2 weeks', 'In Progress', 'High'),
    (11, 'Medication Distribution - Sidon', 3, 9, 'Distribute chronic disease medications to registered patients in Sidon', 'Completed', 'Critical'),
    (12, 'Health Awareness Campaign', 3, 14, 'Conduct health awareness sessions in 10 villages', 'In Progress', 'Medium'),
    -- Bekaa Food Security Tasks
    (13, 'Food Distribution - Zahle', 4, 9, 'Monthly food package distribution to 300 families in Zahle', 'Completed', 'High'),
    (14, 'Agricultural Training - Baalbek', 4, 14, 'Train 50 farmers on sustainable agriculture techniques', 'Completed', 'Medium'),
    (15, 'Seed Distribution - Bekaa Valley', 4, 13, 'Distribute seeds and fertilizers to 200 farming families', 'In Progress', 'High'),
    (16, 'Irrigation System Installation', 4, 9, 'Install drip irrigation systems for 30 small farms', 'Pending', 'Medium'),
    -- Youth Empowerment Tasks
    (17, 'IT Skills Training Program', 5, 12, 'Conduct 3-month IT skills training for 50 youth', 'Pending', 'High'),
    (18, 'Entrepreneurship Workshop', 5, 14, 'Organize entrepreneurship and business planning workshops', 'Pending', 'Medium'),
    -- Women Economic Empowerment Tasks
    (19, 'Microfinance Disbursement - Round 1', 6, 11, 'Disburse microloans to 100 approved women entrepreneurs', 'Completed', 'High'),
    (20, 'Handicraft Training - Beirut', 6, 12, 'Conduct handicraft and artisan skills training for 30 women', 'In Progress', 'Medium'),
    (21, 'Business Management Training', 6, 12, 'Train 50 women on basic business management and accounting', 'In Progress', 'Medium'),
    (22, 'Market Linkage Program', 6, 14, 'Connect women producers with local markets and retailers', 'Pending', 'Medium'),
    -- Child Protection Tasks
    (23, 'Safe Space Setup - Beirut', 7, 14, 'Establish child-friendly safe space in Beirut community center', 'Completed', 'High'),
    (24, 'Psychosocial Support Sessions - Tripoli', 7, 14, 'Conduct weekly PSS sessions for 100 children in Tripoli', 'In Progress', 'Critical'),
    (25, 'Case Management Training', 7, 4, 'Train 20 social workers on child protection case management', 'Completed', 'High'),
    (26, 'Parent Awareness Sessions', 7, 14, 'Conduct positive parenting sessions in 5 communities', 'In Progress', 'Medium'),
    -- Refugee Integration Tasks
    (27, 'Arabic Language Classes', 8, 12, 'Provide Arabic language classes for 200 refugee adults', 'In Progress', 'Medium'),
    (28, 'Legal Documentation Support', 8, 11, 'Assist 150 families with residency and legal documentation', 'In Progress', 'High'),
    (29, 'Community Dialogue Sessions', 8, 14, 'Organize monthly dialogue sessions between refugee and host communities', 'In Progress', 'Medium'),
    (30, 'Housing Rehabilitation', 8, 9, 'Rehabilitate 50 housing units for vulnerable refugee families', 'Pending', 'High'),
    -- Rural WASH Tasks
    (31, 'Water Network Assessment - Akkar', 9, 9, 'Assess water infrastructure needs in 20 Akkar villages', 'Pending', 'High'),
    (32, 'Latrine Construction - Hermel', 9, 9, 'Construct 100 household latrines in Hermel area', 'Pending', 'High'),
    -- Elderly Care Tasks
    (33, 'Home Visit Program - Beirut', 10, 14, 'Regular home visits to 50 elderly individuals in Beirut', 'In Progress', 'High'),
    (34, 'Medical Checkup Campaign', 10, 7, 'Organize monthly health checkups for registered elderly', 'In Progress', 'High'),
    (35, 'Social Activities Program', 10, 12, 'Organize weekly social gatherings and activities for elderly', 'In Progress', 'Low');

SET IDENTITY_INSERT TASKS OFF;

-- ============================================================================
-- 20. ASSIGNMENTS
-- ============================================================================
SET IDENTITY_INSERT ASSIGNMENTS ON;

INSERT INTO ASSIGNMENTS
    (AssignID, PersonID, TaskID, RoleInTask)
VALUES
    -- Task 1: Food Package Distribution - Bourj Hammoud
    (1, 7, 1, 'Team Leader'),
    (2, 16, 1, 'Distribution Assistant'),
    (3, 18, 1, 'Driver'),
    -- Task 2: Medical Supply Distribution - Sabra
    (4, 7, 2, 'Team Leader'),
    (5, 20, 2, 'Medical Supplies Handler'),
    (6, 17, 2, 'Community Liaison'),
    -- Task 3: Food Package Distribution - Ouzai
    (7, 9, 3, 'Team Leader'),
    (8, 18, 3, 'Driver'),
    (9, 16, 3, 'Distribution Assistant'),
    -- Task 4: Beneficiary Assessment
    (10, 14, 4, 'Lead Assessor'),
    (11, 17, 4, 'Social Worker'),
    (12, 23, 4, 'Data Collector'),
    -- Task 5: School Supply Distribution
    (13, 7, 5, 'Team Leader'),
    (14, 21, 5, 'Distribution Coordinator'),
    (15, 22, 5, 'Inventory Manager'),
    -- Task 6: Teacher Training Workshop
    (16, 12, 6, 'Workshop Facilitator'),
    (17, 19, 6, 'Training Assistant'),
    -- Task 7: School Renovation
    (18, 9, 7, 'Site Supervisor'),
    (19, 24, 7, 'Logistics Support'),
    -- Task 8: After-School Program
    (20, 12, 8, 'Program Coordinator'),
    (21, 19, 8, 'Tutor'),
    (22, 21, 8, 'Tutor'),
    -- Task 9: Mobile Clinic - Tyre
    (23, 7, 9, 'Clinic Coordinator'),
    (24, 26, 9, 'Medical Assistant'),
    (25, 28, 9, 'Driver'),
    -- Task 10: Mobile Clinic - Nabatieh
    (26, 7, 10, 'Clinic Coordinator'),
    (27, 27, 10, 'Medical Assistant'),
    (28, 18, 10, 'Driver'),
    -- Task 11: Medication Distribution
    (29, 9, 11, 'Distribution Leader'),
    (30, 20, 11, 'Pharmacy Assistant'),
    -- Task 12: Health Awareness Campaign
    (31, 14, 12, 'Campaign Leader'),
    (32, 27, 12, 'Health Educator'),
    (33, 26, 12, 'Community Mobilizer'),
    -- Task 13: Food Distribution - Zahle
    (34, 9, 13, 'Distribution Leader'),
    (35, 30, 13, 'Warehouse Assistant'),
    (36, 29, 13, 'Driver'),
    -- Task 14: Agricultural Training
    (37, 14, 14, 'Training Coordinator'),
    (38, 30, 14, 'Field Assistant'),
    -- Task 15: Seed Distribution
    (39, 13, 15, 'Distribution Manager'),
    (40, 29, 15, 'Logistics Assistant'),
    -- Task 19: Microfinance Disbursement
    (41, 11, 19, 'Finance Officer'),
    (42, 2, 19, 'Verification Officer'),
    -- Task 20: Handicraft Training
    (43, 12, 20, 'Training Coordinator'),
    (44, 23, 20, 'Craft Instructor'),
    -- Task 21: Business Management Training
    (45, 12, 21, 'Lead Trainer'),
    (46, 11, 21, 'Finance Trainer'),
    -- Task 23: Safe Space Setup
    (47, 14, 23, 'Setup Coordinator'),
    (48, 17, 23, 'Social Worker'),
    -- Task 24: PSS Sessions
    (49, 14, 24, 'PSS Facilitator'),
    (50, 21, 24, 'Activity Leader'),
    -- Task 25: Case Management Training
    (51, 4, 25, 'Lead Trainer'),
    (52, 17, 25, 'Co-Trainer'),
    -- Task 26: Parent Awareness
    (53, 14, 26, 'Session Facilitator'),
    (54, 27, 26, 'Community Liaison'),
    -- Task 27: Arabic Language Classes
    (55, 12, 27, 'Language Instructor'),
    (56, 22, 27, 'Teaching Assistant'),
    -- Task 28: Legal Documentation
    (57, 11, 28, 'Legal Coordinator'),
    (58, 8, 28, 'Documentation Officer'),
    -- Task 29: Community Dialogue
    (59, 14, 29, 'Dialogue Facilitator'),
    (60, 29, 29, 'Community Representative'),
    -- Task 33: Home Visit Program
    (61, 14, 33, 'Visit Coordinator'),
    (62, 17, 33, 'Social Worker'),
    (63, 25, 33, 'Volunteer Visitor'),
    -- Task 34: Medical Checkup
    (64, 7, 34, 'Health Coordinator'),
    (65, 20, 34, 'Medical Assistant'),
    -- Task 35: Social Activities
    (66, 12, 35, 'Activity Coordinator'),
    (67, 25, 35, 'Volunteer Assistant');

SET IDENTITY_INSERT ASSIGNMENTS OFF;

-- ============================================================================
-- 21. DISTRIBUTION_LOG
-- ============================================================================
SET IDENTITY_INSERT DISTRIBUTION_LOG ON;

INSERT INTO DISTRIBUTION_LOG
    (LogID, BeneficiaryID, ItemID, TaskID, Quantity, Date)
VALUES
    -- Task 1: Food Distribution Bourj Hammoud
    (1, 1, 1, 1, 2.00, '2024-02-15 09:30:00'),
    (2, 1, 3, 1, 2.00, '2024-02-15 09:30:00'),
    (3, 1, 4, 1, 1.00, '2024-02-15 09:30:00'),
    (4, 9, 1, 1, 2.00, '2024-02-15 10:00:00'),
    (5, 9, 3, 1, 2.00, '2024-02-15 10:00:00'),
    (6, 21, 1, 1, 2.00, '2024-02-15 10:30:00'),
    (7, 21, 7, 1, 5.00, '2024-02-15 10:30:00'),
    -- Task 2: Medical Supply Distribution Sabra
    (8, 2, 9, 2, 1.00, '2024-02-20 10:00:00'),
    (9, 2, 11, 2, 2.00, '2024-02-20 10:00:00'),
    (10, 10, 9, 2, 1.00, '2024-02-20 10:30:00'),
    (11, 10, 12, 2, 1.00, '2024-02-20 10:30:00'),
    (12, 20, 9, 2, 1.00, '2024-02-20 11:00:00'),
    (13, 20, 10, 2, 2.00, '2024-02-20 11:00:00'),
    -- Task 3: Food Distribution Ouzai
    (14, 22, 1, 3, 2.00, '2024-03-10 09:00:00'),
    (15, 22, 2, 3, 1.00, '2024-03-10 09:00:00'),
    (16, 23, 1, 3, 2.00, '2024-03-10 09:30:00'),
    (17, 23, 5, 3, 10.00, '2024-03-10 09:30:00'),
    (18, 24, 1, 3, 2.00, '2024-03-10 10:00:00'),
    (19, 24, 6, 3, 10.00, '2024-03-10 10:00:00'),
    -- Task 5: School Supply Distribution
    (20, 3, 18, 5, 1.00, '2024-03-01 08:30:00'),
    (21, 3, 19, 5, 2.00, '2024-03-01 08:30:00'),
    (22, 3, 20, 5, 1.00, '2024-03-01 08:30:00'),
    (23, 4, 18, 5, 1.00, '2024-03-01 09:00:00'),
    (24, 4, 19, 5, 2.00, '2024-03-01 09:00:00'),
    (25, 11, 18, 5, 1.00, '2024-03-01 09:30:00'),
    (26, 12, 18, 5, 1.00, '2024-03-01 10:00:00'),
    -- Task 11: Medication Distribution Sidon
    (27, 5, 11, 11, 3.00, '2024-04-05 09:00:00'),
    (28, 5, 13, 11, 2.00, '2024-04-05 09:00:00'),
    (29, 6, 11, 11, 2.00, '2024-04-05 09:30:00'),
    (30, 6, 12, 11, 1.00, '2024-04-05 09:30:00'),
    (31, 17, 11, 11, 3.00, '2024-04-05 10:00:00'),
    (32, 18, 11, 11, 2.00, '2024-04-05 10:30:00'),
    (33, 19, 13, 11, 2.00, '2024-04-05 11:00:00'),
    -- Task 13: Food Distribution Zahle
    (34, 13, 1, 13, 3.00, '2024-03-20 09:00:00'),
    (35, 13, 8, 13, 5.00, '2024-03-20 09:00:00'),
    (36, 14, 1, 13, 3.00, '2024-03-20 09:30:00'),
    (37, 14, 25, 13, 5.00, '2024-03-20 09:30:00'),
    (38, 15, 1, 13, 2.00, '2024-03-20 10:00:00'),
    (39, 16, 1, 13, 2.00, '2024-03-20 10:30:00'),
    (40, 27, 1, 13, 3.00, '2024-03-20 11:00:00'),
    (41, 28, 1, 13, 2.00, '2024-03-20 11:30:00'),
    -- Task 33: Home Visit - Hygiene Kits
    (42, 7, 16, 33, 1.00, '2024-05-15 10:00:00'),
    (43, 19, 16, 33, 1.00, '2024-05-15 11:00:00'),
    (44, 23, 16, 33, 1.00, '2024-05-15 14:00:00'),
    (45, 29, 16, 33, 1.00, '2024-05-16 10:00:00');

SET IDENTITY_INSERT DISTRIBUTION_LOG OFF;

-- ============================================================================
-- 22. EXPENSES
-- ============================================================================
SET IDENTITY_INSERT EXPENSES ON;

INSERT INTO EXPENSES
    (ExpenseID, ProjectID, TaskID, BudgetID, Category, Amount, Date, InvoiceReference)
VALUES
    -- Beirut Emergency Relief Expenses
    (1, 1, 1, 1, 'Food Supplies', 15000.00, '2024-02-10', 'INV-2024-001'),
    (2, 1, 1, 4, 'Transportation', 2500.00, '2024-02-14', 'INV-2024-002'),
    (3, 1, 2, 2, 'Medical Supplies', 8000.00, '2024-02-18', 'INV-2024-003'),
    (4, 1, 3, 1, 'Food Supplies', 12000.00, '2024-03-08', 'INV-2024-004'),
    (5, 1, 3, 4, 'Transportation', 2000.00, '2024-03-09', 'INV-2024-005'),
    (6, 1, 4, 3, 'Staff Per Diem', 1500.00, '2024-03-15', 'INV-2024-006'),
    -- North Lebanon Education Expenses
    (7, 2, 5, 5, 'School Bags', 25000.00, '2024-02-25', 'INV-2024-007'),
    (8, 2, 5, 5, 'Notebooks and Stationery', 15000.00, '2024-02-26', 'INV-2024-008'),
    (9, 2, 6, 6, 'Workshop Materials', 5000.00, '2024-03-05', 'INV-2024-009'),
    (10, 2, 6, 6, 'Trainer Fees', 8000.00, '2024-03-10', 'INV-2024-010'),
    (11, 2, 7, 7, 'Construction Materials', 35000.00, '2024-03-20', 'INV-2024-011'),
    (12, 2, 7, 7, 'Labor Costs', 20000.00, '2024-04-01', 'INV-2024-012'),
    -- South Lebanon Healthcare Expenses
    (13, 3, 9, 11, 'Vehicle Rental', 5000.00, '2024-03-25', 'INV-2024-013'),
    (14, 3, 9, 10, 'Medications', 12000.00, '2024-03-26', 'INV-2024-014'),
    (15, 3, 10, 11, 'Vehicle Rental', 5000.00, '2024-04-10', 'INV-2024-015'),
    (16, 3, 11, 10, 'Chronic Disease Medications', 20000.00, '2024-04-01', 'INV-2024-016'),
    (17, 3, 12, 12, 'Awareness Materials', 3000.00, '2024-04-15', 'INV-2024-017'),
    -- Bekaa Food Security Expenses
    (18, 4, 13, 13, 'Food Packages', 30000.00, '2024-03-15', 'INV-2024-018'),
    (19, 4, 13, 15, 'Distribution Logistics', 5000.00, '2024-03-18', 'INV-2024-019'),
    (20, 4, 14, 14, 'Training Materials', 4000.00, '2024-03-25', 'INV-2024-020'),
    (21, 4, 15, 14, 'Seeds and Fertilizers', 25000.00, '2024-04-05', 'INV-2024-021'),
    -- Women Economic Empowerment Expenses
    (22, 6, 19, 19, 'Microloans Disbursed', 50000.00, '2024-04-20', 'INV-2024-022'),
    (23, 6, 20, 20, 'Craft Materials', 8000.00, '2024-04-25', 'INV-2024-023'),
    (24, 6, 21, 20, 'Training Venue', 2000.00, '2024-05-01', 'INV-2024-024'),
    -- Child Protection Expenses
    (25, 7, 23, 22, 'Furniture and Equipment', 15000.00, '2024-02-25', 'INV-2024-025'),
    (26, 7, 23, 22, 'Play Materials', 5000.00, '2024-02-28', 'INV-2024-026'),
    (27, 7, 24, 23, 'PSS Materials', 3000.00, '2024-03-10', 'INV-2024-027'),
    (28, 7, 25, 24, 'Training Costs', 8000.00, '2024-03-05', 'INV-2024-028'),
    -- Refugee Integration Expenses
    (29, 8, 27, 26, 'Teaching Materials', 4000.00, '2024-04-01', 'INV-2024-029'),
    (30, 8, 28, 27, 'Legal Fees', 10000.00, '2024-04-10', 'INV-2024-030'),
    (31, 8, 29, 28, 'Event Costs', 2000.00, '2024-04-15', 'INV-2024-031'),
    -- Elderly Care Expenses
    (32, 10, 33, 32, 'Care Packages', 5000.00, '2024-05-10', 'INV-2024-032'),
    (33, 10, 34, 33, 'Medical Supplies', 8000.00, '2024-05-15', 'INV-2024-033'),
    (34, 10, 35, 34, 'Activity Materials', 1500.00, '2024-05-20', 'INV-2024-034');

SET IDENTITY_INSERT EXPENSES OFF;

-- ============================================================================
-- 23. IMPACT_METRIC
-- ============================================================================
SET IDENTITY_INSERT IMPACT_METRIC ON;

INSERT INTO IMPACT_METRIC
    (MetricID, TaskID, ProjectID, MetricType, AchievedValue, LastUpdated)
VALUES
    -- Beirut Emergency Relief
    (1, 1, 1, 'Food Packages Distributed', 95.00, '2024-02-28 17:00:00'),
    (2, 2, 1, 'Medical Kits Distributed', 100.00, '2024-02-28 17:00:00'),
    (3, 3, 1, 'Food Packages Distributed', 60.00, '2024-03-15 17:00:00'),
    (4, 4, 1, 'Assessments Completed', 40.00, '2024-03-20 17:00:00'),
    -- North Lebanon Education
    (5, 5, 2, 'Students Reached', 100.00, '2024-03-10 17:00:00'),
    (6, 6, 2, 'Teachers Trained', 100.00, '2024-03-15 17:00:00'),
    (7, 7, 2, 'Renovation Progress', 65.00, '2024-04-10 17:00:00'),
    (8, 8, 2, 'Program Setup', 25.00, '2024-04-15 17:00:00'),
    -- South Lebanon Healthcare
    (9, 9, 3, 'Patients Served', 100.00, '2024-04-08 17:00:00'),
    (10, 10, 3, 'Patients Served', 55.00, '2024-04-20 17:00:00'),
    (11, 11, 3, 'Medications Distributed', 100.00, '2024-04-10 17:00:00'),
    (12, 12, 3, 'Villages Covered', 50.00, '2024-04-25 17:00:00'),
    -- Bekaa Food Security
    (13, 13, 4, 'Families Reached', 100.00, '2024-03-25 17:00:00'),
    (14, 14, 4, 'Farmers Trained', 100.00, '2024-04-01 17:00:00'),
    (15, 15, 4, 'Seeds Distributed', 70.00, '2024-04-15 17:00:00'),
    (16, 16, 4, 'Systems Installed', 0.00, '2024-04-20 17:00:00'),
    -- Youth Empowerment
    (17, 17, 5, 'Youth Enrolled', 0.00, '2024-05-01 17:00:00'),
    (18, 18, 5, 'Workshops Conducted', 0.00, '2024-05-01 17:00:00'),
    -- Women Economic Empowerment
    (19, 19, 6, 'Loans Disbursed', 100.00, '2024-04-30 17:00:00'),
    (20, 20, 6, 'Women Trained', 45.00, '2024-05-10 17:00:00'),
    (21, 21, 6, 'Training Completion', 35.00, '2024-05-15 17:00:00'),
    (22, 22, 6, 'Market Linkages', 10.00, '2024-05-20 17:00:00'),
    -- Child Protection
    (23, 23, 7, 'Safe Space Operational', 100.00, '2024-03-01 17:00:00'),
    (24, 24, 7, 'Children Reached', 75.00, '2024-04-30 17:00:00'),
    (25, 25, 7, 'Social Workers Trained', 100.00, '2024-03-15 17:00:00'),
    (26, 26, 7, 'Sessions Conducted', 50.00, '2024-05-01 17:00:00'),
    -- Refugee Integration
    (27, 27, 8, 'Adults Enrolled', 65.00, '2024-05-01 17:00:00'),
    (28, 28, 8, 'Families Assisted', 55.00, '2024-05-10 17:00:00'),
    (29, 29, 8, 'Sessions Held', 40.00, '2024-05-15 17:00:00'),
    (30, 30, 8, 'Units Rehabilitated', 0.00, '2024-05-20 17:00:00'),
    -- Rural WASH
    (31, 31, 9, 'Villages Assessed', 0.00, '2024-05-25 17:00:00'),
    (32, 32, 9, 'Latrines Built', 0.00, '2024-05-25 17:00:00'),
    -- Elderly Care
    (33, 33, 10, 'Elderly Visited', 70.00, '2024-05-20 17:00:00'),
    (34, 34, 10, 'Checkups Completed', 60.00, '2024-05-25 17:00:00'),
    (35, 35, 10, 'Activities Organized', 80.00, '2024-05-25 17:00:00');

SET IDENTITY_INSERT IMPACT_METRIC OFF;

-- ============================================================================
-- END OF TEST DATA
-- ============================================================================

-- Verification Queries (Optional - Run to verify data integrity)

