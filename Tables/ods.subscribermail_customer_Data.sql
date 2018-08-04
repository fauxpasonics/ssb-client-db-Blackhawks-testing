CREATE TABLE [ods].[subscribermail_customer_Data]
(
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[accountid] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientData_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[firstname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fullname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lakeshake] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lakeshake2017] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lastname_parsed] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
