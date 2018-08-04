CREATE TABLE [ods].[Snapshot_SubscriberMail_News_RecipientsModifiedByDate]
(
[SubscriberMail_News_RecipientsModifiedByDateSK] [int] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientData_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataField_id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataField_value] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_RecipientsModifiedByDate] ADD CONSTRAINT [PK__Snapshot__41D3454DB22FB512] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_RecipientsModifiedByDateSK])
GO
