CREATE TABLE [Codes].[Border]
(
	[BorderId] INT NOT NULL IDENTITY(1,1),
	[Code]            VARCHAR (20)  NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Description]     VARCHAR (50)  NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_Border_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_Border_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_Border_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_Border_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_BorderId] PRIMARY KEY CLUSTERED ([BorderId] ASC) ON [PRIMARY],
	CONSTRAINT [UQ_Border_Code] UNIQUE NONCLUSTERED ([Code] ASC)
)
