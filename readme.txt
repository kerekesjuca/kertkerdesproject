# KertKerdesTeszt – Adatbázis telepítési útmutató

Ez a projekt a **KertKerdesDb** nevű SQL Server adatbázist használja.

## Szükséges környezet

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL Server Authentication engedélyezve

## Bejelentkezés

A projekt SQL login használatával csatlakozik az adatbázishoz.

Az alkalmazásban az `appsettings.json` fájlban ez a felhasználó van megadva:

"User ID=kertkerdes;Password=K3rtK3rd3s2026;"

1. Login létrehozása (sa jogosultsággal): SSMS-ben sa felhasználóval futtasd:

USE master;
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'kertkerdes')
BEGIN
    CREATE LOGIN kertkerdes
    WITH PASSWORD = 'K3rtK3rd3s2026';
END
GO

****
Fejlesztői környezet
SQL Server 2022 Developer Edition
SSMS-ben SQL Server authentication-nel kell belépni
sa (master)
DB owner login létrehozása: kertkerdes
psw: K3rtK3rd3s2026
New Query-ben futtatni a KertKerdesDb_create.sql scriptet

***

Visual Studio 2022 Professional
VS-ben Solution explorerben a projekten jobb click: restore nuget packages
appsettings.json connection string-ben update-eld a saját:
- szerver neved,
- adatbázis neved,
- saját felhasználóneved,
- saját jelszóval 
Ha létrehoztad SSMS-ben ezeket, akkor ezt lehet írni az appsettings.json connection string-be
User ID: kertkerdes
psw: K3rtK3rd3s2026

***

webapp admin jlo: admin123
egyéb usr psw:  aA1!0000

***