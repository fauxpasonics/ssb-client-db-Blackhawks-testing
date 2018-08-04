CREATE TABLE [ods].[Snapshot_SubscriberMail_Clicks]
(
[SubscriberMail_ClicksSK] [int] NOT NULL IDENTITY(1, 1),
[MessageId] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientId] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Time] [datetime] NULL,
[Click_Url] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Url_Index] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_Clicks] ADD CONSTRAINT [PK__Snapshot__C880A77FAD4D9009] PRIMARY KEY CLUSTERED  ([SubscriberMail_ClicksSK])
GO
