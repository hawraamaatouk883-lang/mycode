# 🏛️ NGO Database Management System

A comprehensive SQL Server database system designed to manage all core operations of a Non-Governmental Organization (NGO), including human resources, project management, supply chain, financial tracking, beneficiary services, and monitoring & evaluation.

> **University Project** — Database Design & Development Course

---

## Overview

This project models a real-world NGO operational database covering the full lifecycle of humanitarian work — from receiving donor grants, managing projects and tasks, tracking inventory and distributions, to measuring impact on beneficiaries.

The database is built using **Microsoft SQL Server** with proper normalization (3NF), referential integrity, CHECK constraints, and programmable objects (functions, views, stored procedures, and triggers).

---

## Features

- **Human Resources** — Manage employees, volunteers, and their skills
- **Funding & Finance** — Track donors, grants, budgets, and expenses
- **Project Management** — Handle projects, tasks, assignments, and risks
- **Beneficiary Services** — Register beneficiaries and track enrollments
- **Supply Chain** — Manage suppliers, inventory, and warehouse stock
- **Distribution Tracking** — Log item distributions to beneficiaries
- **Monitoring & Evaluation** — Track impact metrics and project progress

---

## Database Schema

The database consists of **22 tables** organized into the following domains:

### People Management

- `PEOPLE` — Base table for all persons (inheritance pattern)
- `EMPLOYEES` — Employee-specific data (extends PEOPLE)
- `VOLUNTEERS` — Volunteer-specific data (extends PEOPLE)
- `SKILLS` — Skill definitions
- `PERSON_SKILLS` — Many-to-many relationship between People and Skills

### Funding & Finance

- `DONORS` — Donor organizations and individuals
- `GRANTS` — Grant records linked to donors
- `PROJECT_FUNDING` — Grant allocations to projects
- `BUDGETS` — Budget categories per project
- `EXPENSES` — Expense records linked to budgets

### Project Operations

- `PROJECTS` — Project records with manager assignments
- `TASKS` — Tasks within projects
- `ASSIGNMENTS` — People assigned to tasks
- `RISKS` — Risk register per project

### Beneficiary Management

- `BENEFICIARIES` — Beneficiary records
- `PROJECT_BENEFICIARIES` — Enrollment in projects

### Supply Chain

- `LOCATIONS` — Geographic locations
- `SUPPLIERS` — Supplier companies
- `INVENTORY` — Item catalog
- `WAREHOUSE_STOCK` — Stock quantities per location
- `DISTRIBUTION_LOG` — Distribution records

### Monitoring & Evaluation

- `IMPACT_METRIC` — Progress tracking per project and task

### Key Relationships

```
PEOPLE ──┬── EMPLOYEES ──── PROJECTS (as Manager)
         └── VOLUNTEERS     
                            
DONORS ──── GRANTS ──── PROJECT_FUNDING ──── PROJECTS
                                              ├── TASKS ──── ASSIGNMENTS ──── PEOPLE
                                              ├── BUDGETS ──── EXPENSES
                                              ├── RISKS
                                              ├── PROJECT_LOCATIONS ──── LOCATIONS
                                              ├── PROJECT_BENEFICIARIES ──── BENEFICIARIES
                                              └── IMPACT_METRIC

SUPPLIERS ──── INVENTORY ──── WAREHOUSE_STOCK ──── LOCATIONS
                              └── DISTRIBUTION_LOG ──── BENEFICIARIES
```

---

## Database Objects

### Functions (3)

- `fn_GetPersonTaskCount` — Returns the number of active tasks assigned to a specific person
- `fn_GetBudgetUtilization` — Returns the percentage of budget spent for a project
- `fn_GetGrantRemainingBalance` — Returns remaining money available from a grant

### Views (3)

- `vw_PersonTaskSummary` — Shows all people with task counts and availability status
- `vw_ProjectBudgetStatus` — Shows projects with budget vs expenses and utilization alerts
- `vw_WarehouseStockAlert` — Shows inventory items with stock level and expiry alerts

### Stored Procedures (3)

- `sp_ReplenishStock` — Adds inventory from supplier and updates warehouse quantities
- `sp_RecordExpense` — Records an expense with automatic budget limit checking
- `sp_GenerateProjectReport` — Generates a comprehensive project status report

### Triggers (3)

- `tr_PreventTaskOverload` — Fires on INSERT into ASSIGNMENTS. Blocks assignment if person has 3 or more active tasks
- `tr_DeductStockOnDistribution` — Fires on INSERT into DISTRIBUTION_LOG. Automatically decreases warehouse stock
- `tr_UpdateProjectStatus` — Fires on UPDATE of TASKS. Auto-completes project when all tasks are done

---

## Usage Examples

### Check how many active tasks a person has
```sql
SELECT dbo.fn_GetPersonTaskCount(7);
```

### View all available people
```sql
SELECT * FROM vw_PersonTaskSummary
WHERE AvailabilityStatus = 'Available';
```

### Check items running low in warehouses
```sql
SELECT * FROM vw_WarehouseStockAlert
WHERE StockLevel IN ('Critical', 'Out of Stock');
```

### Record an expense with budget validation
```sql
DECLARE @Result NVARCHAR(300);
EXEC sp_RecordExpense
    @ProjectID = 1,
    @BudgetID = 1,
    @TaskID = 1,
    @Category = 'Food Supplies',
    @Amount = 5000,
    @InvoiceReference = 'INV-2024-100',
    @Result = @Result OUTPUT;
SELECT @Result;
```

### Replenish warehouse stock
```sql
DECLARE @Result NVARCHAR(200);
EXEC sp_ReplenishStock
    @ItemID = 1,
    @LocationID = 1,
    @Quantity = 100,
    @ExpiryDate = '2025-12-31',
    @Result = @Result OUTPUT;
SELECT @Result;
```

### Generate a full project report
```sql
EXEC sp_GenerateProjectReport @ProjectID = 1;
```

---

## Business Rules

- A person can be either an Employee or a Volunteer, enforced by a CHECK constraint on `PEOPLE.PersonType`
- A person cannot have more than 3 active tasks, enforced by the trigger `tr_PreventTaskOverload`
- Distributing items to beneficiaries automatically reduces warehouse stock through the trigger `tr_DeductStockOnDistribution`
- A project is automatically marked as Completed when all its tasks are done, handled by the trigger `tr_UpdateProjectStatus`
- Expenses are validated against budget limits through the procedure `sp_RecordExpense`
- Grant amounts must be positive, enforced by the CHECK constraint `CHK_GrantAmount`
- Stock quantity cannot go below zero, enforced by the CHECK constraint `CHK_StockQuantity`
- Project start date must be before end date, enforced by the CHECK constraint `CHK_ProjectDates`
- Volunteer status is restricted to Active, Inactive, On Leave, or Terminated
- Risk severity is restricted to Low, Medium, High, or Critical
- Task status is restricted to Pending, In Progress, Completed, Blocked, or Cancelled
- Task priority is restricted to Low, Medium, High, or Critical

---

## Test Data

The sample data uses **Lebanese names, cities, and organizations** including:

- **10 Locations** across Lebanon — Beirut, Tripoli, Sidon, Tyre, Jounieh, Byblos, Zahle, Baalbek, Nabatieh, and Batroun
- **15 Employees** and **15 Volunteers** with Lebanese names
- **30 Beneficiaries** from vulnerable areas across the country
- **15 Donors** including Lebanese foundations and international organizations
- **10 Projects** covering education, healthcare, food security, women empowerment, child protection, and more
- **25 Inventory items** sourced from **10 Lebanese suppliers**
- **35 Tasks** with various statuses and priorities
- **67 Assignments** linking people to tasks
- **45 Distribution records** tracking item deliveries to beneficiaries
- Full data across all 22 tables with **no NULL values** in required fields

---

## Technologies

- **Database:** Microsoft SQL Server
- **Language:** T-SQL
- **Tools:** SQL Server Management Studio (SSMS)

---

## License

This project is developed for educational purposes as part of a university database course.
