CREATE PROCEDURE [Bratkovskiy].sp_CalculateAllScholarships
    @p_Month INT,
    @p_Year INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_CurrentStudentID INT;

    -- Оголошуємо курсор для вибірки всіх студентів
    DECLARE student_cursor CURSOR FOR
    SELECT StudentID FROM [Bratkovskiy].Student;

    OPEN student_cursor;
    FETCH NEXT FROM student_cursor INTO @v_CurrentStudentID;

    -- Цикл перебору студентів
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Виклик першої процедури для поточного студента
        EXEC [Bratkovskiy].sp_CalculateScholarship
            @p_StudentID = @v_CurrentStudentID,
            @p_Month = @p_Month,
            @p_Year = @p_Year;

        -- Перехід до наступного студента
        FETCH NEXT FROM student_cursor INTO @v_CurrentStudentID;
    END;

    CLOSE student_cursor;
    DEALLOCATE student_cursor;
END;
GO