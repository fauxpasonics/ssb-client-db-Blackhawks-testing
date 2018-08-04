CREATE TABLE [ods].[Snapshot_SubscriberMail_news_RecipientListByMessage_DataFields]
(
[SubscriberMail_news_RecipientListByMessage_DataFieldsSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientData_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dataFields_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dataFields_value] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_news_RecipientListByMessage_DataFields] ADD CONSTRAINT [PK__Snapshot__0EC4F080546368CD] PRIMARY KEY CLUSTERED  ([SubscriberMail_news_RecipientListByMessage_DataFieldsSK])
GO
