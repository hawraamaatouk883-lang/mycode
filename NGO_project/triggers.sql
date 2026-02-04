-- ============================================================================
-- TRIGGERS (3)
-- ============================================================================

-- ============================================================================
-- TRIGGER 10: Prevent Task Overload
-- Purpose: Blocks assignment if person already has 3+ active tasks
-- ============================================================================
GO
CREATE TRIGGER tr_PreventTaskOverload
ON ASSIGNMENTS
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PersonID INT;
    DECLARE @TaskID INT;
    DECLARE @RoleInTask VARCHAR(100);
    DECLARE @ActiveTaskCount INT;
    DECLARE @PersonName VARCHAR(255);

    SELECT @PersonID = PersonID, @TaskID = TaskID, @RoleInTask = RoleInTask
    FROM inserted;

    SELECT @PersonName = FullName
    FROM PEOPLE
    WHERE PersonID = @PersonID;

    SELECT @ActiveTaskCount = COUNT(*)
    FROM ASSIGNMENTS A
        INNER JOIN TASKS T ON A.TaskID = T.TaskID
    WHERE A.PersonID = @PersonID
        AND T.Status IN ('Pending', 'In Progress', 'Blocked');

    IF @ActiveTaskCount >= 3
    BEGIN
        RAISERROR('Cannot assign task: %s already has %d active tasks. Maximum is 3.', 16, 1, @PersonName, @ActiveTaskCount);
        RETURN;
    END

    INSERT INTO ASSIGNMENTS
        (PersonID, TaskID, RoleInTask)
    SELECT PersonID, TaskID, RoleInTask
    FROM inserted;

    PRINT 'Task assigned successfully to ' + @PersonName;
END;
GO




-- ============================================================================
-- TRIGGER 11: Auto-Deduct Stock on Distribution
-- Purpose: Automatically decreases warehouse quantity when distribution is logged
-- ============================================================================
GO
CREATE TRIGGER tr_DeductStockOnDistribution
ON DISTRIBUTION_LOG
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ItemID INT;
    DECLARE @Quantity DECIMAL(12,2);
    DECLARE @TaskID INT;
    DECLARE @LocationID INT;

    SELECT @ItemID = ItemID, @Quantity = Quantity, @TaskID = TaskID
    FROM inserted;

    -- Find location from task's project
    SELECT TOP 1
        @LocationID = PL.LocationID
    FROM TASKS T
        INNER JOIN PROJECT_LOCATIONS PL ON T.ProjectID = PL.ProjectID
        INNER JOIN WAREHOUSE_STOCK WS ON PL.LocationID = WS.LocationID AND WS.ItemID = @ItemID
    WHERE T.TaskID = @TaskID
    ORDER BY WS.Quantity DESC;

    IF @LocationID IS NOT NULL
    BEGIN
        UPDATE WAREHOUSE_STOCK
        SET Quantity = Quantity - @Quantity
        WHERE ItemID = @ItemID AND LocationID = @LocationID;

        PRINT 'Stock deducted successfully.';
    END
END;
GO




-- ============================================================================
-- TRIGGER 12: Auto-Update Project Status
-- Purpose: Automatically changes project status when all tasks are completed
-- ============================================================================
GO
CREATE TRIGGER tr_UpdateProjectStatus
ON TASKS
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProjectID INT;
    DECLARE @TotalTasks INT;
    DECLARE @CompletedTasks INT;
    DECLARE @CurrentStatus VARCHAR(50);

    SELECT @ProjectID = ProjectID
    FROM inserted;

    SELECT @CurrentStatus = Status
    FROM PROJECTS
    WHERE ProjectID = @ProjectID;

    IF @CurrentStatus = 'Cancelled'
        RETURN;

    SELECT
        @TotalTasks = COUNT(*),
        @CompletedTasks = SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END)
    FROM TASKS
    WHERE ProjectID = @ProjectID;

    IF @TotalTasks > 0 AND @CompletedTasks = @TotalTasks
    BEGIN
        UPDATE PROJECTS
        SET Status = 'Completed'
        WHERE ProjectID = @ProjectID;

        PRINT 'Project marked as Completed - all tasks finished.';
    END
END;
GO
