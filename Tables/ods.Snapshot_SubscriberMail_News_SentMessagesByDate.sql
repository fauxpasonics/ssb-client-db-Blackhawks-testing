CREATE TABLE [ods].[Snapshot_SubscriberMail_News_SentMessagesByDate]
(
[SubscriberMail_News_SentMessagesByDateSK] [int] NOT NULL IDENTITY(1, 1),
[Messageid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateScheduled] [datetime] NULL,
[Label] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_SentMessagesByDate] ADD CONSTRAINT [PK__Snapshot__4149FCBD43AB4020] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_SentMessagesByDateSK])
GO
