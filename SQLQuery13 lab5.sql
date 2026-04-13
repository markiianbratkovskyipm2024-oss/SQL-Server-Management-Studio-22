USE StudentDB;
GO

-- Швидко створюємо все заново
CREATE USER LibrarianUser WITHOUT LOGIN;
CREATE USER HostelManagerUser WITHOUT LOGIN;
CREATE USER DeanOfficeUser WITHOUT LOGIN;
CREATE USER TestAdminUser WITHOUT LOGIN; 

CREATE ROLE Role_DataViewer;
CREATE ROLE Role_StudentManager;

ALTER ROLE Role_DataViewer ADD MEMBER LibrarianUser;
ALTER ROLE Role_StudentManager ADD MEMBER TestAdminUser;
GO