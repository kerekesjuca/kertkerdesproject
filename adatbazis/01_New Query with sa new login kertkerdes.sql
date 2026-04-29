USE master;
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'kertkerdes')
BEGIN
    CREATE LOGIN kertkerdes
    WITH PASSWORD = 'K3rtK3rd3s@2026';
END
GO
