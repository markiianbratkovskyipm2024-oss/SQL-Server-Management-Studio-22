USE StudentDB;
GO

-- 1. Головна таблиця "Студенти" 
-- (Прокрутіть результати вправо до самого кінця, щоб побачити нові колонки UCR, DCR, ULC, DLC)
SELECT * FROM [Bratkovskiy].Student;

-- 2. Таблиця "Хобі"
-- (Тут ви побачите ваші нові хобі з правильно згенерованими ID замість 9999)
SELECT * FROM [Bratkovskiy].Hobby;

-- 3. Таблиця "Журнал видачі книг"
-- (Щоб побачити, хто які книги брав і які має борги)
SELECT * FROM [Bratkovskiy].LibraryLoan;

-- 4. Таблиця "Кімнати"
-- (Щоб побачити ліміти місткості - поле Capacity)
SELECT * FROM [Bratkovskiy].Room;

-- 5. Таблиця "Книги"
-- (Щоб побачити ціни книг для розрахунку боргу 100 грн)
SELECT * FROM [Bratkovskiy].Book;