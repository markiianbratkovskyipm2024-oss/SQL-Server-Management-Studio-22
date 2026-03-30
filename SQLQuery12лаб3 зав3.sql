USE StudentDB;
GO

CREATE OR ALTER TRIGGER [Bratkovskiy].trg_CheckRoomCapacity
ON [Bratkovskiy].Student
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT s.RoomID
        FROM [Bratkovskiy].Student s
        JOIN [Bratkovskiy].Room r ON s.RoomID = r.RoomID
        WHERE s.RoomID IN (SELECT RoomID FROM inserted WHERE RoomID IS NOT NULL)
        GROUP BY s.RoomID, r.Capacity
        HAVING COUNT(s.StudentID) > r.Capacity
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50002, N'Помилка: Перевищено ліміт місткості кімнати! Заселення скасовано.', 1;
    END
END;
GO