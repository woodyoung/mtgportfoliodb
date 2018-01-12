CREATE TABLE [dbo].[MtgCardTypes]
(
	[MtgCardTypesId] INT NOT NULL IDENTITY(1,1),
	MtgCardId INT NOT NULL,
	TypeId INT NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardTypes_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCardTypes_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardTypes_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCardTypes_UpdatedOn] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT FK_MtgCardTypes_Type FOREIGN KEY (TypeId) REFERENCES Codes.Type (TypeId),
	CONSTRAINT FK_MtgCardTypes_MtgCard FOREIGN KEY (MtgCardId) REFERENCES dbo.MtgCard (MtgCardId)
)
