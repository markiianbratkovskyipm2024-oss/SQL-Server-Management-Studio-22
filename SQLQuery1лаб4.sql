USE StudentDB;
GO

-- 1. Змушуємо тригер спрацювати на UPDATE (Оновлення) для трьох студентів (ID 2, 3, 4).
-- Наприклад, трохи підвищимо їм рейтинг. Тригер автоматично заповнить їм поля ULC та DLC.
UPDATE [Bratkovskiy].Student 
SET Rating = Rating + 1.00 
WHERE StudentID IN (2, 3, 4);

-- 2. Змушуємо тригер спрацювати на INSERT (Створення) для абсолютно нового 6-го студента.
-- Тригер автоматично заповнить йому ВСІ 4 поля: UCR, DCR, ULC та DLC.
INSERT INTO [Bratkovskiy].Student (LastName, FirstName, TicketNumber, BirthYear, BirthPlace, Gender, Rating, GroupID, RoomID)
VALUES (N'Коцюбинський', N'Михайло', N'KB10000006', 2006, N'Львів', 'M', 85.00, 1, 2);

-- 3. Виводимо  результат
SELECT 
    StudentID, 
    LastName, 
    FirstName,
    Rating,
    UCR, 
    DCR, 
    ULC, 
    DLC 
FROM [Bratkovskiy].Student;