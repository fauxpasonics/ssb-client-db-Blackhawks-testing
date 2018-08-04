CREATE TABLE [ods].[Snapshot_SubscriberMail_News_Opens]
(
[SubscriberMail_News_OpensSK] [int] NOT NULL IDENTITY(1, 1),
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open_Time] [datetime] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_Opens] ADD CONSTRAINT [PK__Snapshot__CF25CA975E37BBB8] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_OpensSK])
GO
