-- Append з явно вказаними значеннями
INSERT INTO [Bratkovskiy].Subject (SubjectName)
VALUES (N'Штучний інтелект');

-- Створюємо тимчасову таблицю для демонстрації наступного запиту
CREATE TABLE [Bratkovskiy].TopStudentsArchive (
    ArchivedLastName NVARCHAR(50), 
    Rating DECIMAL(5,2)
);

-- Append для додавання записів з інших таблиць
INSERT INTO [Bratkovskiy].TopStudentsArchive (ArchivedLastName, Rating)
SELECT LastName, Rating
FROM [Bratkovskiy].Student
WHERE Rating >= 90.0;