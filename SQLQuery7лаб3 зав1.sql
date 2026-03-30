USE StudentDB;
GO

CREATE OR ALTER TRIGGER [Bratkovskiy].trg_Student_Audit
ON [Bratkovskiy].Student
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CurrentUser NVARCHAR(50) = SYSTEM_USER;
    DECLARE @CurrentDate DATETIME = GETDATE();

    -- Якщо це INSERT (є в inserted, немає в deleted)
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        UPDATE s
        SET s.UCR = @CurrentUser, s.DCR = @CurrentDate,
            s.ULC = @CurrentUser, s.DLC = @CurrentDate
        FROM [Bratkovskiy].Student s
        JOIN inserted i ON s.StudentID = i.StudentID;
    END
    -- Якщо це UPDATE (є і в inserted, і в deleted)
    ELSE IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        UPDATE s
        SET s.ULC = @CurrentUser, s.DLC = @CurrentDate
        FROM [Bratkovskiy].Student s
        JOIN inserted i ON s.StudentID = i.StudentID;
    END
END;
GO