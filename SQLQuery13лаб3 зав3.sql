USE StudentDB;
GO

-- Кімната №1 (RoomID = 1) має ліміт 2 місця. Там вже живуть 2 студенти.
-- Спробуємо силою підселити туди третього (наприклад, студента №4):
UPDATE [Bratkovskiy].Student 
SET RoomID = 1 
WHERE StudentID = 4;