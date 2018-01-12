CREATE TABLE [dbo].[MtgCardColors]
(
	[MtgCardColorsId] INT NOT NULL IDENTITY(1,1),
	MtgCardId INT NOT NULL,
	ColorId INT NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardColors_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCardColors_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardColors_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCardColors_UpdatedOn] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT FK_MtgCardColors_Color FOREIGN KEY (ColorId) REFERENCES Codes.Color (ColorId),
	CONSTRAINT FK_MtgCardColors_MtgCard FOREIGN KEY (MtgCardId) REFERENCES dbo.MtgCard (MtgCardId)
)
