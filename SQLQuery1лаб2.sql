CREATE TRIGGER [Bratkovskiy].trg_CheckLoanLimit
ON [Bratkovskiy].LibraryLoan
AFTER INSERT, UPDATE
AS
BEGIN
    -- Забороняємо вивід системних повідомлень про кількість оброблених рядків, 
    -- щоб не "смітити" в результатах
    SET NOCOUNT ON;

    -- Перевіряємо, чи є студенти, чий борг після цієї операції перевищить 100 грн
    IF EXISTS (
        SELECT i.StudentID
        FROM inserted i -- 'inserted' це віртуальна таблиця з новими даними, які зараз додаються
        JOIN [Bratkovskiy].LibraryLoan ll ON i.StudentID = ll.StudentID
        JOIN [Bratkovskiy].Book b ON ll.BookID = b.BookID
        WHERE ll.ReturnDate IS NULL -- беремо тільки ті книги, що ще не повернуті
        GROUP BY i.StudentID
        HAVING SUM(b.Price) > 100.00
    )
    BEGIN
        -- Якщо такий студент знайдений, скасовуємо операцію (транзакцію)
        ROLLBACK TRANSACTION;
        -- Виводимо повідомлення про помилку користувачу
        THROW 50001, N'Помилка: Студент не може мати одночасно позиченими книжок на суму більше ніж 100 грн.', 1;
    END
END;
GO