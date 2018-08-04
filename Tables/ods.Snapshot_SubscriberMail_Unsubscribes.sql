CREATE TABLE [ods].[Snapshot_SubscriberMail_Unsubscribes]
(
[SubscriberMail_UnsubscribesSK] [int] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReasonId] [bit] NULL,
[RecipientId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeTime] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_Unsubscribes] ADD CONSTRAINT [PK__Snapshot__C91291921F4F5E7C] PRIMARY KEY CLUSTERED  ([SubscriberMail_UnsubscribesSK])
GO
