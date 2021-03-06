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
The column [Codes].[Set].[MkmId] is being dropped, data loss could occur.

The column [Codes].[Set].[MkmName] is being dropped, data loss could occur.

The column [Codes].[Set].[SetType] on table [Codes].[Set] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [Codes].[Set])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Dropping [Codes].[DF_Set_CreatedBy]...';


GO
ALTER TABLE [Codes].[Set] DROP CONSTRAINT [DF_Set_CreatedBy];


GO
PRINT N'Dropping [Codes].[DF_Set_CreatedOn]...';


GO
ALTER TABLE [Codes].[Set] DROP CONSTRAINT [DF_Set_CreatedOn];


GO
PRINT N'Dropping [Codes].[DF_Set_UpdatedBy]...';


GO
ALTER TABLE [Codes].[Set] DROP CONSTRAINT [DF_Set_UpdatedBy];


GO
PRINT N'Dropping [Codes].[DF_Set_UpdatedOn]...';


GO
ALTER TABLE [Codes].[Set] DROP CONSTRAINT [DF_Set_UpdatedOn];


GO
PRINT N'Dropping unnamed constraint on [Codes].[Set]...';


GO
ALTER TABLE [Codes].[Set] DROP CONSTRAINT [DF__tmp_ms_xx__IsAct__45BE5BA9];


GO
PRINT N'Dropping [dbo].[FK_MtgCard_Set]...';


GO
ALTER TABLE [dbo].[MtgCard] DROP CONSTRAINT [FK_MtgCard_Set];


GO
PRINT N'Dropping [Codes].[FK_Set_Border]...';


GO
ALTER TABLE [Codes].[Set] DROP CONSTRAINT [FK_Set_Border];


GO
PRINT N'Dropping [dbo].[FK_MtgCardSets_Type]...';


GO
ALTER TABLE [dbo].[MtgCardSets] DROP CONSTRAINT [FK_MtgCardSets_Type];


GO
PRINT N'Starting rebuilding table [Codes].[Set]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Codes].[tmp_ms_xx_Set] (
    [SetId]        INT          IDENTITY (1, 1) NOT NULL,
    [Code]         VARCHAR (20) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [Description]  VARCHAR (50) NOT NULL,
    [ReleaseDate]  DATE         NOT NULL,
    [BorderId]     INT          NOT NULL,
    [SetType]      VARCHAR (50) NOT NULL,
    [GathererCode] VARCHAR (20) NULL,
    [CreatedBy]    VARCHAR (50) CONSTRAINT [DF_Set_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]    DATETIME     CONSTRAINT [DF_Set_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]    VARCHAR (50) CONSTRAINT [DF_Set_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]    DATETIME     CONSTRAINT [DF_Set_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]     BIT          DEFAULT ((1)) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_UQ_Set_Code1] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [tmp_ms_xx_constraint_PK_SetId1] PRIMARY KEY CLUSTERED ([SetId] ASC) ON [PRIMARY]
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Codes].[Set])
    BEGIN
        SET IDENTITY_INSERT [Codes].[tmp_ms_xx_Set] ON;
        INSERT INTO [Codes].[tmp_ms_xx_Set] ([SetId], [Code], [Name], [Description], [ReleaseDate], [BorderId], [GathererCode], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsActive])
        SELECT   [SetId],
                 [Code],
                 [Name],
                 [Description],
                 [ReleaseDate],
                 [BorderId],
                 [GathererCode],
                 [CreatedBy],
                 [CreatedOn],
                 [UpdatedBy],
                 [UpdatedOn],
                 [IsActive]
        FROM     [Codes].[Set]
        ORDER BY [SetId] ASC;
        SET IDENTITY_INSERT [Codes].[tmp_ms_xx_Set] OFF;
    END

DROP TABLE [Codes].[Set];

EXECUTE sp_rename N'[Codes].[tmp_ms_xx_Set]', N'Set';

EXECUTE sp_rename N'[Codes].[tmp_ms_xx_constraint_UQ_Set_Code1]', N'UQ_Set_Code', N'OBJECT';

EXECUTE sp_rename N'[Codes].[tmp_ms_xx_constraint_PK_SetId1]', N'PK_SetId', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[FK_MtgCard_Set]...';


GO
ALTER TABLE [dbo].[MtgCard] WITH NOCHECK
    ADD CONSTRAINT [FK_MtgCard_Set] FOREIGN KEY ([SetId]) REFERENCES [Codes].[Set] ([SetId]);


GO
PRINT N'Creating [Codes].[FK_Set_Border]...';


GO
ALTER TABLE [Codes].[Set] WITH NOCHECK
    ADD CONSTRAINT [FK_Set_Border] FOREIGN KEY ([BorderId]) REFERENCES [Codes].[Border] ([BorderId]);


GO
PRINT N'Creating [dbo].[FK_MtgCardSets_Type]...';


GO
ALTER TABLE [dbo].[MtgCardSets] WITH NOCHECK
    ADD CONSTRAINT [FK_MtgCardSets_Type] FOREIGN KEY ([SetId]) REFERENCES [Codes].[Set] ([SetId]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[MtgCard] WITH CHECK CHECK CONSTRAINT [FK_MtgCard_Set];

ALTER TABLE [Codes].[Set] WITH CHECK CHECK CONSTRAINT [FK_Set_Border];

ALTER TABLE [dbo].[MtgCardSets] WITH CHECK CHECK CONSTRAINT [FK_MtgCardSets_Type];


GO
PRINT N'Update complete.';


GO
