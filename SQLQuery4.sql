SELECT LastName AS [Прізвище], FirstName AS [Ім'я], Rating AS [Рейтинг]
FROM [Bratkovskiy].Student
WHERE Rating BETWEEN 70.0 AND 95.0
ORDER BY Rating DESC;