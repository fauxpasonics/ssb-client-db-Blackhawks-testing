CREATE TABLE [ods].[Snapshot_SubscriberMail_News_RecipientActivityByMessage]
(
[SubscriberMail_News_RecipientActivityByMessageSK] [int] NOT NULL IDENTITY(1, 1),
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
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_RecipientActivityByMessage] ADD CONSTRAINT [PK__Snapshot__D8952B2D89DDAD83] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_RecipientActivityByMessageSK])
GO
