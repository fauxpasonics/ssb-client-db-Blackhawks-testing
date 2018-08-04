CREATE TABLE [ods].[Snapshot_SubscriberMail_news_RecipientListByMessage]
(
[SubscriberMail_news_RecipientListByMessageSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientData_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_news_RecipientListByMessage] ADD CONSTRAINT [PK__Snapshot__A836CA7EA544A370] PRIMARY KEY CLUSTERED  ([SubscriberMail_news_RecipientListByMessageSK])
GO
