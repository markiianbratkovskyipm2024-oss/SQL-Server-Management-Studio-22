USE StudentDB;
GO

-- Спочатку система непомітно створює їх (щоб було що видаляти)
CREATE USER LibrarianUser WITHOUT LOGIN;
CREATE USER HostelManagerUser WITHOUT LOGIN;
CREATE USER DeanOfficeUser WITHOUT LOGIN;
CREATE USER TestAdminUser WITHOUT LOGIN; 
CREATE ROLE Role_DataViewer;
CREATE ROLE Role_StudentManager;
ALTER ROLE Role_DataViewer ADD MEMBER LibrarianUser;
ALTER ROLE Role_StudentManager ADD MEMBER TestAdminUser;
GO

-- А тепер система одразу ж правильно їх очищає і видаляє
ALTER ROLE Role_DataViewer DROP MEMBER LibrarianUser;
ALTER ROLE Role_StudentManager DROP MEMBER TestAdminUser;
DROP ROLE Role_DataViewer;
DROP ROLE Role_StudentManager;
DROP USER LibrarianUser;
DROP USER HostelManagerUser;
DROP USER DeanOfficeUser;
DROP USER TestAdminUser;
GO