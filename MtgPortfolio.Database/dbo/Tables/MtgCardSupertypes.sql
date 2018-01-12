CREATE TABLE [dbo].[MtgCardSupertypes]
(
	[MtgCardSupertypesId] INT NOT NULL IDENTITY(1,1),
	MtgCardId INT NOT NULL,
	SupertypeId INT NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardSupertypes_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCardSupertypes_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardSupertypes_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCardSupertypes_UpdatedOn] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT FK_MtgCardSupertypes_Type FOREIGN KEY (SupertypeId) REFERENCES Codes.Supertype (SupertypeId),
	CONSTRAINT FK_MtgCardSupertypes_MtgCard FOREIGN KEY (MtgCardId) REFERENCES dbo.MtgCard (MtgCardId)
)
