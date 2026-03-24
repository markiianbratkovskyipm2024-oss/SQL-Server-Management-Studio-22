SELECT GroupName, [M] AS [Кількість хлопців], [F] AS [Кількість дівчат]
FROM (
    SELECT g.GroupName, s.Gender, s.StudentID
    FROM [Bratkovskiy].StudentGroup g
    JOIN [Bratkovskiy].Student s ON g.GroupID = s.GroupID
) AS SourceTable
PIVOT (
    COUNT(StudentID)
    FOR Gender IN ([M], [F])
) AS PivotTable;