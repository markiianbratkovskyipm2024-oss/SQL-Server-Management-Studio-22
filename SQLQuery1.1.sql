-- Перевірка, що всі студенти на місці:
SELECT * FROM [Bratkovskiy].Student;

-- ==========================================
-- ЗВІТИ ДЛЯ ЛАБОРАТОРНОЇ РОБОТИ
-- ==========================================

-- 1. Список студентів по групах
SELECT g.GroupName AS [Група], s.LastName AS [Прізвище], s.FirstName AS [Ім'я], s.Rating AS [Рейтинг]
FROM [Bratkovskiy].Student s
JOIN [Bratkovskiy].StudentGroup g ON s.GroupID = g.GroupID
ORDER BY g.GroupName, s.LastName;

-- 2. Список студентів, які мають рейтинг від 70 до 95
SELECT LastName AS [Прізвище], FirstName AS [Ім'я], Rating AS [Рейтинг]
FROM [Bratkovskiy].Student
WHERE Rating BETWEEN 70.0 AND 95.0
ORDER BY Rating DESC;

-- 3. Боржники бібліотеки (книги не повернені більше року)
SELECT 
    s.LastName AS [Прізвище], 
    s.FirstName AS [Ім'я], 
    COUNT(ll.BookID) AS [Кількість неповернених книг],
    SUM(b.Price) AS [Загальний борг (грн)]
FROM [Bratkovskiy].LibraryLoan ll
JOIN [Bratkovskiy].Student s ON ll.StudentID = s.StudentID
JOIN [Bratkovskiy].Book b ON ll.BookID = b.BookID
WHERE ll.ReturnDate IS NULL 
  AND DATEDIFF(year, ll.LoanDate, GETDATE()) >= 1
GROUP BY s.LastName, s.FirstName;

-- 4. Довідка для студента (наприклад, Мельник Олег)
SELECT 
    LastName AS [Прізвище], 
    FirstName AS [Ім'я], 
    TicketNumber AS [Студентський квиток], 
    Rating AS [Рейтинг], 
    Scholarship AS [Стипендія (грн)]
FROM [Bratkovskiy].Student
WHERE LastName = N'Мельник' AND FirstName = N'Олег';