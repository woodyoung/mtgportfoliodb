CREATE TABLE [Codes].[Color]
(
	[ColorId] INT NOT NULL IDENTITY(1,1),
	[Code]            VARCHAR (20)  NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Description]     VARCHAR (50)  NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_Color_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_Color_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_Color_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_Color_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,	
	CONSTRAINT [UQ_Color_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [PK_ColorId] PRIMARY KEY CLUSTERED ([ColorId] ASC) ON [PRIMARY]
)
