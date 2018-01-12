CREATE TABLE [Codes].[Type]
(	[TypeId] INT NOT NULL IDENTITY(1,1),
	[Code]            VARCHAR (20)  NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Description]     VARCHAR (50)  NOT NULL,
    [CreatedBy]       VARCHAR (50)  CONSTRAINT [DF_Type_CreatedBy] DEFAULT (suser_name()) NOT NULL,
    [CreatedOn]       DATETIME      CONSTRAINT [DF_Type_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]       VARCHAR (50)  CONSTRAINT [DF_Type_UpdatedBy] DEFAULT (suser_name()) NOT NULL,
    [UpdatedOn]       DATETIME      CONSTRAINT [DF_Type_UpdatedOn] DEFAULT (getdate()) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,
	CONSTRAINT [UQ_Type_Code] UNIQUE NONCLUSTERED ([Code] ASC),
	CONSTRAINT [PK_TypeId] PRIMARY KEY CLUSTERED ([TypeId] ASC) ON [PRIMARY]
)
