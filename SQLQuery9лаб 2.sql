WITH HierarchyCTE AS (
    -- Якірний елемент: знаходимо всіх старост
    SELECT StudentID, LastName, GroupID, 0 AS HierarchyLevel, CAST(N'Староста' AS NVARCHAR(20)) AS Role
    FROM [Bratkovskiy].Student
    WHERE StudentID IN (SELECT LeaderID FROM [Bratkovskiy].StudentGroup)
    
    UNION ALL
    
    -- Рекурсивна частина: знаходимо підлеглих студентів
    SELECT s.StudentID, s.LastName, s.GroupID, cte.HierarchyLevel + 1, CAST(N'Студент' AS NVARCHAR(20))
    FROM [Bratkovskiy].Student s
    INNER JOIN HierarchyCTE cte ON s.GroupID = cte.GroupID
    WHERE s.StudentID NOT IN (SELECT LeaderID FROM [Bratkovskiy].StudentGroup) AND cte.HierarchyLevel = 0
)
SELECT GroupID, HierarchyLevel, Role, LastName 
FROM HierarchyCTE 
ORDER BY GroupID, HierarchyLevel;