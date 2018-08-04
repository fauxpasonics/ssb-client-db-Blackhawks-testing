CREATE TABLE [ods].[Snapshot_SubscriberMail_MessageActivity]
(
[SubscriberMail_MessageActivitySK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bounces] [int] NULL,
[Clicks] [int] NULL,
[Opens] [int] NULL,
[Sent] [int] NULL,
[Softbounces] [int] NULL,
[Unsubscribes] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_MessageActivity] ADD CONSTRAINT [PK__Snapshot__F8F86D90D25CA219] PRIMARY KEY CLUSTERED  ([SubscriberMail_MessageActivitySK])
GO
