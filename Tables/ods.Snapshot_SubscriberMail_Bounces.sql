CREATE TABLE [ods].[Snapshot_SubscriberMail_Bounces]
(
[SubscriberMail_BouncesSK] [int] NOT NULL IDENTITY(1, 1),
[email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[messageId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bounce_Time] [datetime] NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_Bounces] ADD CONSTRAINT [PK__Snapshot__C739A34B945F2438] PRIMARY KEY CLUSTERED  ([SubscriberMail_BouncesSK])
GO
