SELECT 
    s.LastName AS [Прізвище], 
    s.FirstName AS [Ім'я], 
    COUNT(ll.BookID) AS [Кількість неповернених книг],
    SUM(b.Price) AS [Загальний борг (грн)]
FROM [Bratkovskiy].LibraryLoan ll
JOIN [Bratkovskiy].Student s ON ll.StudentID = s.StudentID
JOIN [Bratkovskiy].Book b ON ll.BookID = b.BookID
WHERE ll.ReturnDate IS NULL 
  AND DATEDIFF(year, ll.LoanDate, GETDATE()) >= 1
GROUP BY s.LastName, s.FirstName;