-- Вказуємо серверу працювати саме з вашою базою даних
USE StudentDB; 
GO

-- ==================================================
-- ВИВЕДЕННЯ ВСІХ ТАБЛИЦЬ БАЗИ ДАНИХ ДЛЯ ПЕРЕВІРКИ
-- ==================================================

-- 1. Таблиця "Кімнати в гуртожитку"
SELECT * FROM [Bratkovskiy].Room;

-- 2. Таблиця "Навчальні групи"
SELECT * FROM [Bratkovskiy].StudentGroup;

-- 3. Таблиця "Студенти" (Головна)
SELECT * FROM [Bratkovskiy].Student;

-- 4. Таблиця "Довідник хобі"
SELECT * FROM [Bratkovskiy].Hobby;

-- 5. Стикувальна таблиця "Студенти та їхні хобі"
SELECT * FROM [Bratkovskiy].StudentHobby;

-- 6. Таблиця "Бібліотечний фонд (Книги)"
SELECT * FROM [Bratkovskiy].Book;

-- 7. Таблиця "Журнал видачі книг"
SELECT * FROM [Bratkovskiy].LibraryLoan;

-- 8. Таблиця "Викладачі"
SELECT * FROM [Bratkovskiy].Teacher;

-- 9. Таблиця "Навчальні предмети"
SELECT * FROM [Bratkovskiy].Subject;

-- 10. Таблиця "Екзаменаційна відомість (Оцінки)"
SELECT * FROM [Bratkovskiy].Exam;