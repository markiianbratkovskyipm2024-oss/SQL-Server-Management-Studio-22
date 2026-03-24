SELECT 
    LastName AS [Прізвище], 
    FirstName AS [Ім'я], 
    TicketNumber AS [Студентський квиток], 
    Rating AS [Рейтинг], 
    Scholarship AS [Стипендія (грн)]
FROM [Bratkovskiy].Student
WHERE LastName = N'Мельник' AND FirstName = N'Олег';