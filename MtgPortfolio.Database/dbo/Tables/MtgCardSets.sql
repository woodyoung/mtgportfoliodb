CREATE TABLE [dbo].[MtgCardSets]
(
	[MtgCardSetsId] INT NOT NULL IDENTITY(1,1),
	MtgCardId INT NOT NULL,
	SetId INT NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardSets_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_MtgCardSets_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_MtgCardSets_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_MtgCardSets_UpdatedOn] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT FK_MtgCardSets_Type FOREIGN KEY (SetId) REFERENCES Codes.[Set] (SetId),
	CONSTRAINT FK_MtgCardSets_MtgCard FOREIGN KEY (MtgCardId) REFERENCES dbo.MtgCard (MtgCardId),
    CONSTRAINT [UQ_MtgCardId_SetId] UNIQUE NONCLUSTERED (MtgCardId ASC, SetId ASC) ON [PRIMARY]
)
