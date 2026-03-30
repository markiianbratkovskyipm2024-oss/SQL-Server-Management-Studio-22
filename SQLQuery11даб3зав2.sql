USE StudentDB;
GO

-- Використовуємо абсолютно нове слово
INSERT INTO [Bratkovskiy].Hobby (HobbyID, HobbyName) 
VALUES (9999, N'Кулінарія');

-- Виводимо результат
SELECT * FROM [Bratkovskiy].Hobby ORDER BY HobbyID DESC;