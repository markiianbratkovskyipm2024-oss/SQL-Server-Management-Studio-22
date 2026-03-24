SELECT g.GroupName AS [Група], s.LastName AS [Прізвище], s.FirstName AS [Ім'я], s.Rating AS [Рейтинг]
FROM [Bratkovskiy].Student s
JOIN [Bratkovskiy].StudentGroup g ON s.GroupID = g.GroupID
ORDER BY g.GroupName, s.LastName;