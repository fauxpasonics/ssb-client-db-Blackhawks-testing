CREATE TABLE [ods].[Snapshot_SubscriberMail_News_DataFieldList]
(
[SubscriberMail_News_DataFieldListSK] [int] NOT NULL IDENTITY(1, 1),
[Datafield_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Datafield_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_DataFieldList] ADD CONSTRAINT [PK__Snapshot__598CE7433FE8BAE7] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_DataFieldListSK])
GO
