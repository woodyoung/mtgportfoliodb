CREATE TABLE [dbo].[MtgCardSubtypes]
(
	[MtgCardSubtypesId] INT NOT NULL IDENTITY(1,1),
	MtgCardId INT NOT NULL,
	SubtypeId INT NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardSubtypes_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCardSubtypes_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardSubtypes_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCardSubtypes_UpdatedOn] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT FK_MtgCardSubtypes_Type FOREIGN KEY (SubtypeId) REFERENCES Codes.Subtype (SubtypeId),
	CONSTRAINT FK_MtgCardSubtypes_MtgCard FOREIGN KEY (MtgCardId) REFERENCES dbo.MtgCard (MtgCardId)
)
