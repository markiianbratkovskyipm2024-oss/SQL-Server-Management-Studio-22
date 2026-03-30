USE StudentDB; 
GO

-- 1. Створюємо АБО оновлюємо процедуру (щоб не було помилок про дублікати)
CREATE OR ALTER PROCEDURE [Bratkovskiy].sp_CalculateAllScholarships
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

-- 2. Одразу ЗАПУСКАЄМО цю масову процедуру для всіх студентів за січень 2025 року
EXEC [Bratkovskiy].sp_CalculateAllScholarships @p_Month = 1, @p_Year = 2025;

-- 3. ВИВОДИМО РЕЗУЛЬТАТ, щоб ви могли зробити скріншот для викладача
SELECT 
    StudentID AS [ID], 
    LastName AS [Прізвище], 
    FirstName AS [Ім'я], 
    Rating AS [Рейтинг], 
    Scholarship AS [Нарахована стипендія]
FROM [Bratkovskiy].Student
ORDER BY Scholarship DESC;