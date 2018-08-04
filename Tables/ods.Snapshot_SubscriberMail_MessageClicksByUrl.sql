CREATE TABLE [ods].[Snapshot_SubscriberMail_MessageClicksByUrl]
(
[SubscriberMail_MessageClicksByUrlSK] [int] NOT NULL IDENTITY(1, 1),
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalClicks] [int] NULL,
[UniqueClicks] [int] NULL,
[LinkURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkURL_Index] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_MessageClicksByUrl] ADD CONSTRAINT [PK__Snapshot__BCDFC0575398537A] PRIMARY KEY CLUSTERED  ([SubscriberMail_MessageClicksByUrlSK])
GO
