-- ============================================================================
-- NGO DATABASE SCHEMA - WITH ADDED CONSTRAINTS ONLY
-- ============================================================================
-- Original structure preserved
-- Added: CHECK constraints on PersonType, Status, Priority, Severity, Gender fields
-- ============================================================================

CREATE TABLE LOCATIONS
(
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    GPS_Coordinates VARCHAR(100),
    City VARCHAR(100) NOT NULL,
    Region VARCHAR(100),
    Country VARCHAR(100) NOT NULL
);

CREATE TABLE SKILLS
(
    SkillID INT IDENTITY(1,1) PRIMARY KEY,
    SkillName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PEOPLE
(
    PersonID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Address VARCHAR(500),
    Phone VARCHAR(20) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    PersonType VARCHAR(50) NOT NULL,
    -- Added constraint
    CONSTRAINT CHK_PersonType CHECK (PersonType IN ('Employee', 'Volunteer'))
);

CREATE TABLE EMPLOYEES
(
    PersonID INT PRIMARY KEY,
    JobTitle VARCHAR(100) NOT NULL,
    Department VARCHAR(100),
    HireDate DATE DEFAULT GETDATE(),
    CONSTRAINT FK_Employee_People FOREIGN KEY (PersonID) REFERENCES PEOPLE(PersonID)
);

CREATE TABLE VOLUNTEERS
(
    PersonID INT PRIMARY KEY,
    Zone VARCHAR(100),
    Status VARCHAR(50) DEFAULT 'Active',
    CONSTRAINT FK_Volunteer_People FOREIGN KEY (PersonID) REFERENCES PEOPLE(PersonID),
    -- Added constraint
    CONSTRAINT CHK_VolunteerStatus CHECK (Status IN ('Active', 'Inactive', 'On Leave', 'Terminated'))
);

CREATE TABLE PERSON_SKILLS
(
    PersonID INT NOT NULL,
    SkillID INT NOT NULL,
    PRIMARY KEY (PersonID, SkillID),
    CONSTRAINT FK_PS_Person FOREIGN KEY (PersonID) REFERENCES PEOPLE(PersonID),
    CONSTRAINT FK_PS_Skill FOREIGN KEY (SkillID) REFERENCES SKILLS(SkillID)
);

CREATE TABLE DONORS
(
    DonorID INT IDENTITY(1,1) PRIMARY KEY,
    DonorName VARCHAR(255) NOT NULL,
    DonorType VARCHAR(50),
    ContactPerson VARCHAR(255),
    -- Added constraint
    CONSTRAINT CHK_DonorType CHECK (DonorType IN ('Individual', 'Corporate', 'Foundation', 'Government', 'Other'))
);

CREATE TABLE GRANTS
(
    GrantID INT IDENTITY(1,1) PRIMARY KEY,
    DonorID INT NOT NULL,
    GrantTitle VARCHAR(255) NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL,
    Currency VARCHAR(10) DEFAULT 'USD',
    ExpiryDate DATE,
    CONSTRAINT FK_Grants_Donor FOREIGN KEY (DonorID) REFERENCES DONORS(DonorID),
    CONSTRAINT CHK_GrantAmount CHECK (TotalAmount > 0)
);

CREATE TABLE BENEFICIARIES
(
    BeneficiaryID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DOB DATE,
    Gender VARCHAR(20),
    Address VARCHAR(500),
    ContactInfo VARCHAR(255),
    SocioEconomicStatus VARCHAR(100),
    -- Added constraint
    CONSTRAINT CHK_Gender CHECK (Gender IN ('Male', 'Female', 'Other', 'Prefer Not to Say'))
);

CREATE TABLE SUPPLIERS
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE INVENTORY
(
    ItemID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierID INT NOT NULL,
    ItemName VARCHAR(255) NOT NULL,
    UnitOfMeasure VARCHAR(50),
    CONSTRAINT FK_Inventory_Supplier FOREIGN KEY (SupplierID) REFERENCES SUPPLIERS(SupplierID)
);

CREATE TABLE WAREHOUSE_STOCK
(
    StockID INT IDENTITY(1,1) PRIMARY KEY,
    ItemID INT NOT NULL,
    LocationID INT NOT NULL,
    Quantity DECIMAL(12,2) DEFAULT 0,
    ExpiryDate DATE,
    CONSTRAINT FK_Stock_Item FOREIGN KEY (ItemID) REFERENCES INVENTORY(ItemID),
    CONSTRAINT FK_Stock_Location FOREIGN KEY (LocationID) REFERENCES LOCATIONS(LocationID),
    CONSTRAINT CHK_StockQuantity CHECK (Quantity >= 0)
);

CREATE TABLE PROJECTS
(
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    Description VARCHAR(MAX),
    Status VARCHAR(50) DEFAULT 'Planned',
    ManagerID INT,
    StartDate DATE NOT NULL,
    EndDate DATE,
    CONSTRAINT FK_Project_Manager FOREIGN KEY (ManagerID) REFERENCES EMPLOYEES(PersonID),
    CONSTRAINT CHK_ProjectDates CHECK (StartDate < EndDate),
    -- Added constraint
    CONSTRAINT CHK_ProjectStatus CHECK (Status IN ('Planned', 'Active', 'On Hold', 'Completed', 'Cancelled'))
);

CREATE TABLE PROJECT_LOCATIONS
(
    ProjectID INT NOT NULL,
    LocationID INT NOT NULL,
    PRIMARY KEY (ProjectID, LocationID),
    CONSTRAINT FK_PL_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT FK_PL_Location FOREIGN KEY (LocationID) REFERENCES LOCATIONS(LocationID)
);

CREATE TABLE PROJECT_BENEFICIARIES
(
    PB_ID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    BeneficiaryID INT NOT NULL,
    EnrollmentDate DATE DEFAULT GETDATE(),
    CONSTRAINT FK_PB_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT FK_PB_Beneficiary FOREIGN KEY (BeneficiaryID) REFERENCES BENEFICIARIES(BeneficiaryID)
);

CREATE TABLE PROJECT_FUNDING
(
    FundingID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    GrantID INT NOT NULL,
    AmountAllocated DECIMAL(12,2) NOT NULL,
    CONSTRAINT FK_PF_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT FK_PF_Grant FOREIGN KEY (GrantID) REFERENCES GRANTS(GrantID),
    CONSTRAINT CHK_PF_Amount CHECK (AmountAllocated > 0)
);

CREATE TABLE BUDGETS
(
    BudgetID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    Category VARCHAR(100) NOT NULL,
    AllocatedAmount DECIMAL(12,2) NOT NULL,
    FiscalYear INT NOT NULL,
    CONSTRAINT FK_Budget_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT CHK_BudgetAmount CHECK (AllocatedAmount > 0)
);

CREATE TABLE RISKS
(
    RiskID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    Severity VARCHAR(50),
    Description VARCHAR(MAX),
    CONSTRAINT FK_Risk_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    -- Added constraint
    CONSTRAINT CHK_RiskSeverity CHECK (Severity IN ('Low', 'Medium', 'High', 'Critical'))
);

CREATE TABLE TASKS
(
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    TaskName VARCHAR(255) NOT NULL,
    ProjectID INT NOT NULL,
    SupervisorID INT,
    Description VARCHAR(MAX),
    Status VARCHAR(50) DEFAULT 'Pending',
    Priority VARCHAR(50),
    CONSTRAINT FK_Task_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT FK_Task_Supervisor FOREIGN KEY (SupervisorID) REFERENCES EMPLOYEES(PersonID),
    -- Added constraints
    CONSTRAINT CHK_TaskStatus CHECK (Status IN ('Pending', 'In Progress', 'Completed', 'Blocked', 'Cancelled')),
    CONSTRAINT CHK_TaskPriority CHECK (Priority IN ('Low', 'Medium', 'High', 'Critical'))
);

CREATE TABLE ASSIGNMENTS
(
    AssignID INT IDENTITY(1,1) PRIMARY KEY,
    PersonID INT NOT NULL,
    TaskID INT NOT NULL,
    RoleInTask VARCHAR(100),
    CONSTRAINT FK_Assign_Person FOREIGN KEY (PersonID) REFERENCES PEOPLE(PersonID),
    CONSTRAINT FK_Assign_Task FOREIGN KEY (TaskID) REFERENCES TASKS(TaskID)
);

CREATE TABLE DISTRIBUTION_LOG
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BeneficiaryID INT NOT NULL,
    ItemID INT NOT NULL,
    TaskID INT NOT NULL,
    Quantity DECIMAL(12,2) NOT NULL,
    Date DATETIME2(3) DEFAULT SYSDATETIME(),
    CONSTRAINT FK_Log_Beneficiary FOREIGN KEY (BeneficiaryID) REFERENCES BENEFICIARIES(BeneficiaryID),
    CONSTRAINT FK_Log_Item FOREIGN KEY (ItemID) REFERENCES INVENTORY(ItemID),
    CONSTRAINT FK_Log_Task FOREIGN KEY (TaskID) REFERENCES TASKS(TaskID),
    CONSTRAINT CHK_LogQuantity CHECK (Quantity > 0)
);

CREATE TABLE EXPENSES
(
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    TaskID INT,
    BudgetID INT NOT NULL,
    Category VARCHAR(100),
    Amount DECIMAL(12,2) NOT NULL,
    Date DATE DEFAULT GETDATE(),
    InvoiceReference VARCHAR(100),
    CONSTRAINT FK_Expense_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT FK_Expense_Task FOREIGN KEY (TaskID) REFERENCES TASKS(TaskID),
    CONSTRAINT FK_Expense_Budget FOREIGN KEY (BudgetID) REFERENCES BUDGETS(BudgetID),
    CONSTRAINT CHK_ExpenseAmount CHECK (Amount > 0)
);

CREATE TABLE IMPACT_METRIC
(
    MetricID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT,
    ProjectID INT NOT NULL,
    MetricType VARCHAR(100) NOT NULL,
    AchievedValue DECIMAL(12,2) DEFAULT 0,
    LastUpdated DATETIME2(3) DEFAULT SYSDATETIME(),
    CONSTRAINT FK_Metric_Task FOREIGN KEY (TaskID) REFERENCES TASKS(TaskID),
    CONSTRAINT FK_Metric_Project FOREIGN KEY (ProjectID) REFERENCES PROJECTS(ProjectID),
    CONSTRAINT CHK_Metric_Progress CHECK (AchievedValue BETWEEN 0 AND 100)
);

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================