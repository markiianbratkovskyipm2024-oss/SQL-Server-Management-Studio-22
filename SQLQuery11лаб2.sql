-- UPDATE на базі однієї таблиці
UPDATE [Bratkovskiy].Student
SET Rating = Rating + 5.0
WHERE BirthPlace = N'Вінниця';

-- UPDATE на базі кількох таблиць
UPDATE s
SET s.Scholarship = 0
FROM [Bratkovskiy].Student s
JOIN [Bratkovskiy].LibraryLoan ll ON s.StudentID = ll.StudentID
WHERE ll.ReturnDate IS NULL;