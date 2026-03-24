SELECT 
    r.RoomNumber AS [Номер кімнати], 
    r.Capacity AS [Місткість],
    COUNT(s.StudentID) AS [Кількість мешканців],
    SUM(ISNULL(s.Scholarship, 0)) AS [Загальна сума стипендій]
FROM [Bratkovskiy].Room r
LEFT OUTER JOIN [Bratkovskiy].Student s ON r.RoomID = s.RoomID
WHERE EXISTS (
    -- Підзапит: перевіряємо, чи є в цій кімнаті хлопці
    SELECT 1 
    FROM [Bratkovskiy].Student s2 
    WHERE s2.RoomID = r.RoomID AND s2.Gender = 'M'
)
  AND (r.Capacity = 2 OR r.Capacity = 3)
GROUP BY r.RoomNumber, r.Capacity
ORDER BY [Загальна сума стипендій] DESC;