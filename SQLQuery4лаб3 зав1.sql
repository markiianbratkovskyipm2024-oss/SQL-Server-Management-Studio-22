USE StudentDB;
GO

-- Оновлюємо адресу студенту №1
UPDATE [Bratkovskiy].Student 
SET Address = N'вул. Тестова, 99' 
WHERE StudentID = 1;

-- Дивимося, як тригер автоматично заповнив поля ULC та DLC:
SELECT StudentID, LastName, UCR, DCR, ULC, DLC 
FROM [Bratkovskiy].Student 
WHERE StudentID = 1;