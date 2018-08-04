CREATE TABLE [ods].[SubscriberMail_Opens]
(
[MessageId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RecipientId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Open_Time] [datetime] NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__2F50C2F4] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__3044E72D] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__31390B66] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__322D2F9F] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_OpensUpdate] ON [ods].[SubscriberMail_Opens]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_Opens] t
	JOIN inserted i ON  t.[MessageId] = i.[MessageId] AND t.[RecipientId] = i.[RecipientId] AND t.[Open_Time] = i.[Open_Time]

INSERT INTO [ods].[Snapshot_SubscriberMail_Opens] ([MessageId],[RecipientId],[Open_Time],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_Opens] ADD CONSTRAINT [PK__Subscrib__A359D4A745DB3F79] PRIMARY KEY CLUSTERED  ([MessageId], [RecipientId], [Open_Time])
GO
