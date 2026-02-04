-- ============================================================================
-- FUNCTION 1: Get Person Task Count
-- Purpose: Returns the number of active tasks assigned to a specific person
-- ============================================================================
GO
CREATE FUNCTION fn_GetPersonTaskCount (@PersonID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TaskCount INT;

    SELECT @TaskCount = COUNT(*)
    FROM ASSIGNMENTS A
        INNER JOIN TASKS T ON A.TaskID = T.TaskID
    WHERE A.PersonID = @PersonID
        AND T.Status IN ('Pending', 'In Progress', 'Blocked');

    RETURN ISNULL(@TaskCount, 0);
END;
GO

-- Usage:
-- SELECT dbo.fn_GetPersonTaskCount(7);


-- ============================================================================
-- FUNCTION 2: Calculate Budget Utilization
-- Purpose: Returns the percentage of budget spent for a specific project
-- ============================================================================
GO
CREATE FUNCTION fn_GetBudgetUtilization (@ProjectID INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @TotalBudget DECIMAL(12,2);
    DECLARE @TotalExpenses DECIMAL(12,2);
    DECLARE @Utilization DECIMAL(5,2);

    SELECT @TotalBudget = ISNULL(SUM(AllocatedAmount), 0)
    FROM BUDGETS
    WHERE ProjectID = @ProjectID;

    SELECT @TotalExpenses = ISNULL(SUM(Amount), 0)
    FROM EXPENSES
    WHERE ProjectID = @ProjectID;

    IF @TotalBudget > 0
        SET @Utilization = (@TotalExpenses / @TotalBudget) * 100;
    ELSE
        SET @Utilization = 0;

    RETURN @Utilization;
END;
GO

-- Usage:
-- SELECT dbo.fn_GetBudgetUtilization(1);


-- ============================================================================
-- FUNCTION 3: Get Grant Remaining Balance
-- Purpose: Returns how much money is still available from a grant
-- ============================================================================
GO
CREATE FUNCTION fn_GetGrantRemainingBalance (@GrantID INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
    DECLARE @TotalAmount DECIMAL(12,2);
    DECLARE @AllocatedAmount DECIMAL(12,2);

    SELECT @TotalAmount = ISNULL(TotalAmount, 0)
    FROM GRANTS
    WHERE GrantID = @GrantID;

    SELECT @AllocatedAmount = ISNULL(SUM(AmountAllocated), 0)
    FROM PROJECT_FUNDING
    WHERE GrantID = @GrantID;

    RETURN @TotalAmount - @AllocatedAmount;
END;
GO

-- Usage:
-- SELECT dbo.fn_GetGrantRemainingBalance(1);