USE StudentDB;
GO

-- Змінюємо адресу студенту, щоб тригер спрацював на UPDATE
UPDATE [Bratkovskiy].Student 
SET Address = N'вул. Тестова, 99' 
WHERE StudentID = 1;

-- Виводимо результат
SELECT StudentID, LastName, UCR, DCR, ULC, DLC 
FROM [Bratkovskiy].Student 
WHERE StudentID = 1;