CREATE TABLE [Codes].[Set]
(
	[SetId] INT NOT NULL IDENTITY(1,1),
	[Code]            VARCHAR (20)  NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Description]     VARCHAR (50)  NOT NULL,
    [ReleaseDate]     Date  NOT NULL,
    [BorderId]        INT  NOT NULL,
    [MkmName]		  VARCHAR (160)  NOT NULL,
    [MkmId]			  INT  NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_Set_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_Set_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_Set_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_Set_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,	
	CONSTRAINT [UQ_Set_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [PK_SetId] PRIMARY KEY CLUSTERED ([SetId] ASC) ON [PRIMARY],	
    CONSTRAINT [FK_Set_Border] FOREIGN KEY ([BorderId]) REFERENCES [Codes].Border ([BorderId])
)
