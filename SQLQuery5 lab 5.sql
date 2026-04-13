USE StudentDB;
GO

-- Призначаємо роль Глядача бібліотекарю (як додаткові права)
ALTER ROLE Role_DataViewer ADD MEMBER LibrarianUser;

-- Призначаємо роль Куратора тестовому користувачу
ALTER ROLE Role_StudentManager ADD MEMBER TestAdminUser;
GO