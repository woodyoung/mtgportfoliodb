CREATE TABLE [Codes].[Legality]
(	[LegalityId] INT NOT NULL IDENTITY(1,1),
	[Code]            VARCHAR (20)  NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Description]     VARCHAR (50)  NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_Legality_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_Legality_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_Legality_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_Legality_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,
	CONSTRAINT [UQ_Legality_Code] UNIQUE NONCLUSTERED ([Code] ASC),
	CONSTRAINT [PK_LegalityId] PRIMARY KEY CLUSTERED (LegalityId ASC) ON [PRIMARY]
)
