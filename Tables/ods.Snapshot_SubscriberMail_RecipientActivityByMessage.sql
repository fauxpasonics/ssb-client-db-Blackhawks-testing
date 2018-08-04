CREATE TABLE [ods].[Snapshot_SubscriberMail_RecipientActivityByMessage]
(
[SubscriberMail_RecipientActivityByMessageSK] [int] NOT NULL IDENTITY(1, 1),
[Recipient_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumBounces] [int] NULL,
[NumClicks] [int] NULL,
[NumOpens] [int] NULL,
[NumSent] [int] NULL,
[SoftBounceCount] [int] NULL,
[TotalUnsubCount] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_RecipientActivityByMessage] ADD CONSTRAINT [PK__Snapshot__9C1D51AA543A72EE] PRIMARY KEY CLUSTERED  ([SubscriberMail_RecipientActivityByMessageSK])
GO
