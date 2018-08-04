CREATE TABLE [etl].[Subscribermail_Customer_Pivot]
(
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientData_id] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountID] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LakeShake] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LakeShake2017] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
