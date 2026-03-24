EXEC [Bratkovskiy].sp_CalculateAllScholarships @p_Month = 1, @p_Year = 2025;

-- Перевірка результату:
SELECT LastName, FirstName, Rating, Scholarship 
FROM [Bratkovskiy].Student 
ORDER BY Scholarship DESC;