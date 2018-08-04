CREATE TABLE [ods].[Snapshot_SubscriberMail_SentMessagesByDate]
(
[SubscriberMail_SentMessagesByDateSK] [int] NOT NULL IDENTITY(1, 1),
[Messageid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Message_Date] [datetime] NULL,
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
ALTER TABLE [ods].[Snapshot_SubscriberMail_SentMessagesByDate] ADD CONSTRAINT [PK__Snapshot__6B18BD0558F93AD2] PRIMARY KEY CLUSTERED  ([SubscriberMail_SentMessagesByDateSK])
GO
