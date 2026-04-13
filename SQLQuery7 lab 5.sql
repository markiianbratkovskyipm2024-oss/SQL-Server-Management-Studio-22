USE StudentDB;
GO

-- Видаляємо користувача з ролі
ALTER ROLE Role_StudentManager DROP MEMBER TestAdminUser;
GO

-- ПЕРЕВІРКА:
EXECUTE AS USER = 'TestAdminUser';
    -- 1. Цей запит видасть ПОМИЛКУ (відмовлено в доступі), бо ми забрали роль:
    -- UPDATE [Bratkovskiy].Student SET Rating = Rating + 1 WHERE StudentID = 1;
    
    -- 2. Цей запит виконається УСПІШНО, бо це персональне право, яке ми не чіпали:
    SELECT * FROM [Bratkovskiy].Exam;
REVERT;
GO