USE StudentDB;
GO

-- 1. Додаємо нового студента (Залізняк Максим)
INSERT INTO [Bratkovskiy].Student (LastName, FirstName, TicketNumber, BirthYear, Gender, GroupID, Rating)
VALUES (N'Залізняк', N'Максим', N'KB10000011', 2005, 'M', 1, 82.00);

-- Отримуємо його автоматичний ID (щоб не вгадувати номер)
DECLARE @NewID INT = (SELECT MAX(StudentID) FROM [Bratkovskiy].Student);

-- 2. Додаємо йому оцінку (82 бали) за іспит у січні 2025 року
INSERT INTO [Bratkovskiy].Exam (StudentID, SubjectID, TeacherID, Score, Grade, ExamDate)
VALUES (@NewID, 2, 2, 82, N'Добре', '2025-01-20');

-- 3. Запускаємо масове нарахування стипендій ще раз
EXEC [Bratkovskiy].sp_CalculateAllScholarships @p_Month = 1, @p_Year = 2025;

-- 4. Виводимо результат
SELECT 
    StudentID AS [ID], 
    LastName AS [Прізвище], 
    FirstName AS [Ім'я], 
    Rating AS [Рейтинг], 
    Scholarship AS [Нарахована стипендія]
FROM [Bratkovskiy].Student
ORDER BY Scholarship DESC, LastName ASC;