SELECT 
    LastName AS [Прізвище], 
    FirstName AS [Ім'я], 
    BirthPlace AS [Місто народження],
    Rating AS [Рейтинг],
    (YEAR(GETDATE()) - BirthYear) AS [Обчислений вік]
FROM [Bratkovskiy].Student
WHERE GroupID IN (1, 2, 3)
  AND Rating BETWEEN 70.0 AND 95.0
  AND LastName LIKE N'%е%'
  AND (BirthPlace = N'Львів' OR BirthPlace = N'Київ')
ORDER BY [Обчислений вік] DESC, LastName ASC;