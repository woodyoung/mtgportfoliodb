﻿/*
Deployment script for MtgPortfolio

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MtgPortfolio"
:setvar DefaultFilePrefix "MtgPortfolio"
:setvar DefaultDataPath "C:\Users\wyoung\AppData\Local\Microsoft\VisualStudio\SSDT"
:setvar DefaultLogPath "C:\Users\wyoung\AppData\Local\Microsoft\VisualStudio\SSDT"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column UpdatedOn on table [Codes].[Format] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [Codes].[Format])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Dropping [Codes].[DF_Format_Up,
	CONSTRAINT [UQ_Format_Code]...';


GO
ALTER TABLE [Codes].[Format] DROP CONSTRAINT [DF_Format_Up,
	CONSTRAINT [UQ_Format_Code];


GO
PRINT N'Altering [Codes].[Format]...';


GO
ALTER TABLE [Codes].[Format] ALTER COLUMN [UpdatedOn] DATETIME NOT NULL;


GO
ALTER TABLE [Codes].[Format]
    ADD [IsActive] BIT DEFAULT ((1)) NOT NULL;


GO
PRINT N'Creating [Codes].[UQ_Format_Code]...';


GO
ALTER TABLE [Codes].[Format]
    ADD CONSTRAINT [UQ_Format_Code] UNIQUE NONCLUSTERED ([Code] ASC);


GO
PRINT N'Creating [Codes].[DF_Format_UpdatedOn]...';


GO
ALTER TABLE [Codes].[Format]
    ADD CONSTRAINT [DF_Format_UpdatedOn] DEFAULT (getdate()) FOR [UpdatedOn];


GO
PRINT N'Update complete.';


GO