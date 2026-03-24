SELECT GroupStats.GroupName, GroupStats.AvgRating
FROM (
    -- Підзапит у FROM: формуємо віртуальну таблицю статистики груп
    SELECT g.GroupName, AVG(s.Rating) AS AvgRating
    FROM [Bratkovskiy].StudentGroup g
    JOIN [Bratkovskiy].Student s ON g.GroupID = s.GroupID
    GROUP BY g.GroupName
) AS GroupStats
WHERE GroupStats.AvgRating > ALL (
    -- Підзапит: витягуємо всі рейтинги студентів з Одеси
    SELECT Rating FROM [Bratkovskiy].Student WHERE BirthPlace = N'Одеса'
);