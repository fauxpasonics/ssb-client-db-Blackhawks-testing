CREATE TABLE [ods].[Snapshot_SubscriberMail_Opens]
(
[SubscriberMail_OpensSK] [int] NOT NULL IDENTITY(1, 1),
[MessageId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open_Time] [datetime] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_Opens] ADD CONSTRAINT [PK__Snapshot__AEBE2F6728724B17] PRIMARY KEY CLUSTERED  ([SubscriberMail_OpensSK])
GO
