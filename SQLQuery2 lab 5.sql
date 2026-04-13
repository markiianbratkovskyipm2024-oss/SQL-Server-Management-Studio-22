USE StudentDB;
GO

-- Права для Бібліотекаря
GRANT SELECT ON [Bratkovskiy].Student TO LibrarianUser;
GRANT SELECT ON [Bratkovskiy].Book TO LibrarianUser;
GRANT SELECT, INSERT, UPDATE ON [Bratkovskiy].LibraryLoan TO LibrarianUser;

-- Права для Коменданта
GRANT SELECT, UPDATE ON [Bratkovskiy].Room TO HostelManagerUser;
GRANT SELECT ON [Bratkovskiy].Student TO HostelManagerUser;

-- Права для Деканату
GRANT SELECT ON [Bratkovskiy].Student TO DeanOfficeUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Bratkovskiy].Exam TO DeanOfficeUser;

-- Права для Тестового користувача (для пунктів 6-8)
GRANT UPDATE ON [Bratkovskiy].Student TO TestAdminUser; -- Привілей 1
GRANT SELECT ON [Bratkovskiy].Exam TO TestAdminUser;    -- Привілей 2
GO