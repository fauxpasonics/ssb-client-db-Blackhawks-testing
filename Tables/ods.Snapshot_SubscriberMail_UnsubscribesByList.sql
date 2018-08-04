CREATE TABLE [ods].[Snapshot_SubscriberMail_UnsubscribesByList]
(
[SubscriberMail_UnsubscribesByListSK] [int] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unsubscribe_Time] [datetime] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_UnsubscribesByList] ADD CONSTRAINT [PK__Snapshot__48955EE08B186799] PRIMARY KEY CLUSTERED  ([SubscriberMail_UnsubscribesByListSK])
GO
