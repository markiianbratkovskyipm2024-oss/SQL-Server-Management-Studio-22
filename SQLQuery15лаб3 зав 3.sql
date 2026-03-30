USE StudentDB;
GO

-- 1. Створюємо абсолютно нову книгу спеціально для цього тесту
INSERT INTO [Bratkovskiy].Book (BookNumber, Author, Title, Genre, Price)
VALUES (N'B999', N'Автор Тест', N'Тестова книга', N'Тест', 50.00);

-- 2. Отримуємо ID цієї нової книги, щоб не вгадувати
DECLARE @NewBookID INT = (SELECT MAX(BookID) FROM [Bratkovskiy].Book);

-- 3. Студент №1 має борг. Спробуємо видати йому цю НОВУ книгу:
INSERT INTO [Bratkovskiy].LibraryLoan (StudentID, BookID, LoanDate, ReturnDate) 
VALUES (1, @NewBookID, GETDATE(), NULL);