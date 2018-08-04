CREATE TABLE [ods].[Snapshot_SubscriberMail_News_Lists]
(
[SubscriberMail_News_ListsSK] [int] NOT NULL IDENTITY(1, 1),
[List_Description] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[List_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[List_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeFlag] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeGroupName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_Lists] ADD CONSTRAINT [PK__Snapshot__A5027677B6BF7F35] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_ListsSK])
GO
