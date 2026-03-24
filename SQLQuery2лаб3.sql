USE StudentDB;
GO

EXEC [Bratkovskiy].sp_CalculateScholarship @p_StudentID = 1, @p_Month = 1, @p_Year = 2025;

SELECT LastName, Rating, Scholarship 
FROM [Bratkovskiy].Student 
WHERE StudentID = 1;