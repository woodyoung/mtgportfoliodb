﻿CREATE TABLE [dbo].[MtgCard]
(
	[MtgCardId] INT NOT NULL IDENTITY(1,1), 
	[MtgJsonId] VARCHAR(50) NULL, 
    [LayoutId] INT NOT NULL, 
    [Name] VARCHAR(160) NULL, 
    [ManaCost] VARCHAR(20) NOT NULL CONSTRAINT DF_MtgCard_ManaCost DEFAULT '' , 
    [ConvertedManaCost] DECIMAL(5, 2) NOT NULL CONSTRAINT DF_MtgCard_ConvertedManaCost DEFAULT 0,
    [Type] VARCHAR(100) NULL , 
    [RarityId] INT NOT NULL, 
    [Text] NVARCHAR(1000) NULL, 
	[Flavor] VARCHAR(1000) NULL,
    [Artist] VARCHAR(100) NULL, 
    [Number] VARCHAR(10) NULL , 
    [Power] DECIMAL(5, 2) NULL, 
    [Toughness] DECIMAL(5, 2) NULL, 
	[Loyalty] DECIMAL(5,2) NULL,
    [MultiverseId] BIGINT NULL ,
	[BorderId] INT NULL,
	[IsTimeShifted] BIT NOT NULL CONSTRAINT DF_MtgCard_IsTimeShifted DEFAULT 0 ,
	[IsReserved] BIT NOT NULL CONSTRAINT DF_MtgCard_IsReserved DEFAULT 0 ,
	[ReleaseDate] DATE NULL,
	[IsStarter] BIT NOT NULL CONSTRAINT DF_MtgCard_IsStarter DEFAULT 0 ,
	 
    [OriginalText] VARCHAR(1000) NULL, 
    [OriginalType] NVARCHAR(100) NULL, 
	[Source] VARCHAR(200) NULL,
    [SetId] INT NOT NULL, 
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCard_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCard_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCard_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCard_UpdatedOn] DEFAULT (getdate()) NOT NULL,
	--CONSTRAINT [UQ_Set_Code] UNIQUE NONCLUSTERED ([Code] ASC), Need to think about how to uniquely constrain this table
    CONSTRAINT PK_MtgCardId PRIMARY KEY CLUSTERED (MtgCardId ASC) ON [PRIMARY],
	CONSTRAINT FK_MtgCard_Border FOREIGN KEY (BorderId) REFERENCES Codes.Border (BorderId),
	CONSTRAINT FK_MtgCard_Layout FOREIGN KEY (LayoutId) REFERENCES Codes.Layout (LayoutId),
	CONSTRAINT FK_MtgCard_Rarity FOREIGN KEY (RarityId) REFERENCES Codes.Rarity (RarityId),
	CONSTRAINT FK_MtgCard_Set FOREIGN KEY (SetId) REFERENCES Codes.[Set] (SetId)
)
