CREATE TABLE [ods].[Snapshot_SubscriberMail_News_Bounces]
(
[SubscriberMail_News_BouncesSK] [int] NOT NULL IDENTITY(1, 1),
[email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[messageId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bounce_Time] [datetime] NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason_index] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_Bounces] ADD CONSTRAINT [PK__Snapshot__EE576636BFD5E7F8] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_BouncesSK])
GO
