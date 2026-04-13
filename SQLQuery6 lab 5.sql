USE StudentDB;
GO

-- Відкликаємо персональний привілей
REVOKE UPDATE ON [Bratkovskiy].Student FROM TestAdminUser;
GO

-- ПЕРЕВІРКА (Імітуємо вхід від імені TestAdminUser):
EXECUTE AS USER = 'TestAdminUser';
    -- Цей запит виконається УСПІШНО, оскільки користувач має роль Role_StudentManager
    UPDATE [Bratkovskiy].Student SET Rating = Rating + 1 WHERE StudentID = 1;
REVERT; -- Повертаємось до прав адміністратора
GO