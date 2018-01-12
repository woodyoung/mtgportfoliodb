CREATE TABLE [Codes].[Format]
(
	[FormatId] INT NOT NULL IDENTITY(1,1),
	[Code]            VARCHAR (50)  NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Description]     VARCHAR (50)  NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_Format_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_Format_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_Format_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_Format_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,	
	CONSTRAINT [UQ_Format_Code] UNIQUE NONCLUSTERED ([Code] ASC),
	CONSTRAINT [PK_FormatId] PRIMARY KEY CLUSTERED ([FormatId] ASC) ON [PRIMARY]
)
