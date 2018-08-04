CREATE TABLE [ods].[Snapshot_SubscriberMail_News_Unsubscribes]
(
[SubscriberMail_News_UnsubscribesSK] [int] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReasonId] [bit] NULL,
[RecipientId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeTime] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_Unsubscribes] ADD CONSTRAINT [PK__Snapshot__015CFFB3950E5657] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_UnsubscribesSK])
GO
