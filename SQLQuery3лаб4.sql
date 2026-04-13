USE StudentDB;
GO

-- 1. Збільшуємо місткість кімнати №1 до 3-х місць у таблиці Room
UPDATE [Bratkovskiy].Room
SET Capacity = 3
WHERE RoomID = 1;

-- 2. Тепер пробуємо знову підселити туди 3-го студента (Студента №4).
-- Цього разу тригер побачить, що ліміт дозволяє (3 <= 3), і пропустить запит!
UPDATE [Bratkovskiy].Student 
SET RoomID = 1 
WHERE StudentID = 4;

-- 3. Виводимо список студентів, які тепер живуть у кімнаті №1, щоб переконатися
SELECT 
    StudentID, 
    LastName, 
    FirstName, 
    RoomID 
FROM [Bratkovskiy].Student
WHERE RoomID = 1;