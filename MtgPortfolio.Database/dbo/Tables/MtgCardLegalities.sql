CREATE TABLE [dbo].[MtgCardLegalities]
(
	[MtgCardLegalitiesId] INT NOT NULL IDENTITY(1,1),
	MtgCardId INT NOT NULL,
	FormatId INT NOT NULL,
	LegalityId INT NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardLegalities_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCardLegalities_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardLegalities_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCardLegalities_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MtgCardLegalitiesId] PRIMARY KEY CLUSTERED ([MtgCardLegalitiesId] ASC) ON [PRIMARY],
    CONSTRAINT [FK_MtgCardLegalities_MtgCard] FOREIGN KEY (MtgCardId) REFERENCES dbo.MtgCard (MtgCardId),
    CONSTRAINT [FK_MtgCardLegalities_Format] FOREIGN KEY (FormatId) REFERENCES Codes.[Format] (FormatId),
    CONSTRAINT [FK_MtgCardLegalities_Legality] FOREIGN KEY (LegalityId) REFERENCES Codes.Legality (LegalityId),
    CONSTRAINT [UQ_MtgCardLegalities_MtgCardId_FormatId_LegalityId] UNIQUE NONCLUSTERED (MtgCardId ASC, FormatId ASC, LegalityId ASC) ON [PRIMARY]
)
