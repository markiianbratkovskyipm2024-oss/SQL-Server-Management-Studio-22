USE StudentDB;
GO

-- Права для Глядача
GRANT SELECT ON [Bratkovskiy].Book TO Role_DataViewer;
GRANT SELECT ON [Bratkovskiy].Room TO Role_DataViewer;
GRANT SELECT ON [Bratkovskiy].Hobby TO Role_DataViewer;

-- Права для Куратора (ця роль також матиме право UPDATE на Student)
GRANT SELECT, INSERT, UPDATE ON [Bratkovskiy].Student TO Role_StudentManager;
GO