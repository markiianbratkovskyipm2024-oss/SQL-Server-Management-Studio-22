USE StudentDB;
GO

-- 1. Очищаємо ролі
ALTER ROLE Role_DataViewer DROP MEMBER LibrarianUser;
ALTER ROLE Role_StudentManager DROP MEMBER TestAdminUser;
GO

-- 2. Видаляємо ролі
DROP ROLE Role_DataViewer;
DROP ROLE Role_StudentManager;
GO

-- 3. Видаляємо користувачів
DROP USER LibrarianUser;
DROP USER HostelManagerUser;
DROP USER DeanOfficeUser;
DROP USER TestAdminUser;
GO