CREATE TABLE [ods].[Snapshot_SubscriberMail_News_Clicks]
(
[SubscriberMail_News_ClicksSK] [int] NOT NULL IDENTITY(1, 1),
[MessageId] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientId] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Time] [datetime] NULL,
[Click_Url] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Url_Index] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_Clicks] ADD CONSTRAINT [PK__Snapshot__CDCFEB9815F4884D] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_ClicksSK])
GO
