CREATE TABLE [ods].[Snapshot_SubscriberMail_RecipientsModifiedByDate]
(
[SubscriberMail_RecipientsModifiedByDateSK] [int] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientData_id] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataField_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataField_Value] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_RecipientsModifiedByDate] ADD CONSTRAINT [PK__Snapshot__298BBC30998198A8] PRIMARY KEY CLUSTERED  ([SubscriberMail_RecipientsModifiedByDateSK])
GO
