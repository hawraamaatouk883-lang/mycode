
-- ============================================================================
-- STORED PROCEDURES (3)
-- ============================================================================

-- ============================================================================
-- PROCEDURE 7: Replenish Stock
-- Purpose: Adds inventory from supplier + updates quantities
-- ============================================================================
GO
CREATE PROCEDURE sp_ReplenishStock
    @ItemID INT,
    @LocationID INT,
    @Quantity DECIMAL(12,2),
    @ExpiryDate DATE,
    @Result NVARCHAR(200) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ItemName VARCHAR(255);
    DECLARE @LocationCity VARCHAR(100);
    DECLARE @ExistingStockID INT;
    DECLARE @NewQuantity DECIMAL(12,2);

    -- Validate Item
    SELECT @ItemName = ItemName
    FROM INVENTORY
    WHERE ItemID = @ItemID;

    IF @ItemName IS NULL
    BEGIN
        SET @Result = 'Error: Item not found.';
        RETURN;
    END

    -- Validate Location
    SELECT @LocationCity = City
    FROM LOCATIONS
    WHERE LocationID = @LocationID;

    IF @LocationCity IS NULL
    BEGIN
        SET @Result = 'Error: Location not found.';
        RETURN;
    END

    -- Validate Quantity
    IF @Quantity <= 0
    BEGIN
        SET @Result = 'Error: Quantity must be greater than 0.';
        RETURN;
    END

    -- Check if stock record exists for this item at this location
    SELECT @ExistingStockID = StockID
    FROM WAREHOUSE_STOCK
    WHERE ItemID = @ItemID AND LocationID = @LocationID;

    IF @ExistingStockID IS NOT NULL
    BEGIN
        -- Update existing stock
        UPDATE WAREHOUSE_STOCK
        SET Quantity = Quantity + @Quantity,
            ExpiryDate = @ExpiryDate
        WHERE StockID = @ExistingStockID;

        SELECT @NewQuantity = Quantity
        FROM WAREHOUSE_STOCK
        WHERE StockID = @ExistingStockID;

        SET @Result = 'Success: Added ' + CAST(@Quantity AS VARCHAR) + ' ' + @ItemName + 
                      ' to ' + @LocationCity + '. New total: ' + CAST(@NewQuantity AS VARCHAR);
    END
    ELSE
    BEGIN
        -- Insert new stock record
        INSERT INTO WAREHOUSE_STOCK
            (ItemID, LocationID, Quantity, ExpiryDate)
        VALUES
            (@ItemID, @LocationID, @Quantity, @ExpiryDate);

        SET @Result = 'Success: Created new stock record. Added ' + CAST(@Quantity AS VARCHAR) + 
                      ' ' + @ItemName + ' to ' + @LocationCity;
    END
END;
GO

-- Usage:
-- DECLARE @Result NVARCHAR(200);
-- EXEC sp_ReplenishStock @ItemID = 1, @LocationID = 1, @Quantity = 100, @ExpiryDate = '2025-12-31', @Result = @Result OUTPUT;
-- SELECT @Result;


-- ============================================================================
-- PROCEDURE 8: Record Expense with Budget Check
-- Purpose: Records expense + checks if budget exceeded + warns if over limit
-- ============================================================================
GO
CREATE PROCEDURE sp_RecordExpense
    @ProjectID INT,
    @BudgetID INT,
    @TaskID INT,
    @Category VARCHAR(100),
    @Amount DECIMAL(12,2),
    @InvoiceReference VARCHAR(100),
    @Result NVARCHAR(300) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BudgetAmount DECIMAL(12,2);
    DECLARE @CurrentExpenses DECIMAL(12,2);
    DECLARE @NewTotal DECIMAL(12,2);
    DECLARE @RemainingBudget DECIMAL(12,2);
    DECLARE @ProjectName VARCHAR(255);

    -- Validate Project
    SELECT @ProjectName = ProjectName
    FROM PROJECTS
    WHERE ProjectID = @ProjectID;

    IF @ProjectName IS NULL
    BEGIN
        SET @Result = 'Error: Project not found.';
        RETURN;
    END

    -- Validate Budget
    SELECT @BudgetAmount = AllocatedAmount
    FROM BUDGETS
    WHERE BudgetID = @BudgetID AND ProjectID = @ProjectID;

    IF @BudgetAmount IS NULL
    BEGIN
        SET @Result = 'Error: Budget not found for this project.';
        RETURN;
    END

    -- Validate Amount
    IF @Amount <= 0
    BEGIN
        SET @Result = 'Error: Amount must be greater than 0.';
        RETURN;
    END

    -- Get current expenses for this budget
    SELECT @CurrentExpenses = ISNULL(SUM(Amount), 0)
    FROM EXPENSES
    WHERE BudgetID = @BudgetID;

    SET @NewTotal = @CurrentExpenses + @Amount;
    SET @RemainingBudget = @BudgetAmount - @NewTotal;

    -- Check if this expense will exceed budget
    IF @NewTotal > @BudgetAmount
    BEGIN
        SET @Result = 'Warning: Expense recorded but EXCEEDS BUDGET! Budget: ' + 
                      CAST(@BudgetAmount AS VARCHAR) + ', Total expenses: ' + CAST(@NewTotal AS VARCHAR) + 
                      ', Over by: ' + CAST(ABS(@RemainingBudget) AS VARCHAR);

        -- Still record the expense but with warning
        INSERT INTO EXPENSES
            (ProjectID, TaskID, BudgetID, Category, Amount, Date, InvoiceReference)
        VALUES
            (@ProjectID, @TaskID, @BudgetID, @Category, @Amount, GETDATE(), @InvoiceReference);

        RETURN;
    END

    -- Check if near limit (90%)
    IF @NewTotal >= @BudgetAmount * 0.9
    BEGIN
        INSERT INTO EXPENSES
            (ProjectID, TaskID, BudgetID, Category, Amount, Date, InvoiceReference)
        VALUES
            (@ProjectID, @TaskID, @BudgetID, @Category, @Amount, GETDATE(), @InvoiceReference);

        SET @Result = 'Warning: Expense recorded. NEAR BUDGET LIMIT! Remaining: ' + 
                      CAST(@RemainingBudget AS VARCHAR) + ' (' + 
                      CAST(CAST((@RemainingBudget / @BudgetAmount) * 100 AS DECIMAL(5,2)) AS VARCHAR) + '% left)';
        RETURN;
    END

    -- Normal case - record expense
    INSERT INTO EXPENSES
        (ProjectID, TaskID, BudgetID, Category, Amount, Date, InvoiceReference)
    VALUES
        (@ProjectID, @TaskID, @BudgetID, @Category, @Amount, GETDATE(), @InvoiceReference);

    SET @Result = 'Success: Expense of ' + CAST(@Amount AS VARCHAR) + ' recorded. Remaining budget: ' + 
                  CAST(@RemainingBudget AS VARCHAR);
END;
GO

-- Usage:
-- DECLARE @Result NVARCHAR(300);
-- EXEC sp_RecordExpense @ProjectID = 1, @BudgetID = 1, @TaskID = 1, @Category = 'Food Supplies', @Amount = 5000, @InvoiceReference = 'INV-2024-100', @Result = @Result OUTPUT;
-- SELECT @Result;


-- ============================================================================
-- PROCEDURE 9: Generate Project Report
-- Purpose: Produces comprehensive report with funding, budget, tasks, team, risks
-- ============================================================================
GO
CREATE PROCEDURE sp_GenerateProjectReport
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate Project
    IF NOT EXISTS (SELECT 1
    FROM PROJECTS
    WHERE ProjectID = @ProjectID)
    BEGIN
        SELECT 'Error: Project not found.' AS Message;
        RETURN;
    END

    -- 1. Project Information
    SELECT
        'PROJECT INFO' AS ReportSection,
        P.ProjectID,
        P.ProjectName,
        P.Description,
        P.Status,
        P.StartDate,
        P.EndDate,
        PE.FullName AS ProjectManager
    FROM PROJECTS P
        LEFT JOIN PEOPLE PE ON P.ManagerID = PE.PersonID
    WHERE P.ProjectID = @ProjectID;

    -- 2. Funding Summary
    SELECT
        'FUNDING' AS ReportSection,
        D.DonorName,
        G.GrantTitle,
        PF.AmountAllocated,
        G.Currency
    FROM PROJECT_FUNDING PF
        INNER JOIN GRANTS G ON PF.GrantID = G.GrantID
        INNER JOIN DONORS D ON G.DonorID = D.DonorID
    WHERE PF.ProjectID = @ProjectID;

    -- 3. Budget vs Expenses
    SELECT
        'BUDGET STATUS' AS ReportSection,
        B.Category,
        B.AllocatedAmount AS Budget,
        ISNULL(E.Spent, 0) AS Spent,
        B.AllocatedAmount - ISNULL(E.Spent, 0) AS Remaining
    FROM BUDGETS B
        LEFT JOIN (
        SELECT BudgetID, SUM(Amount) AS Spent
        FROM EXPENSES
        GROUP BY BudgetID
    ) E ON B.BudgetID = E.BudgetID
    WHERE B.ProjectID = @ProjectID;

    -- 4. Task Summary
    SELECT
        'TASKS' AS ReportSection,
        Status,
        COUNT(*) AS TaskCount
    FROM TASKS
    WHERE ProjectID = @ProjectID
    GROUP BY Status;

    -- 5. Beneficiary Count
    SELECT
        'BENEFICIARIES' AS ReportSection,
        COUNT(DISTINCT BeneficiaryID) AS TotalBeneficiaries
    FROM PROJECT_BENEFICIARIES
    WHERE ProjectID = @ProjectID;

    -- 6. Risks
    SELECT
        'RISKS' AS ReportSection,
        Severity,
        Description
    FROM RISKS
    WHERE ProjectID = @ProjectID;
END;
GO

-- Usage:
-- EXEC sp_GenerateProjectReport @ProjectID = 1;


