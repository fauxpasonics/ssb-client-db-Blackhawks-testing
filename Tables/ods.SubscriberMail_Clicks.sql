CREATE TABLE [ods].[SubscriberMail_Clicks]
(
[MessageId] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RecipientId] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Click_Time] [datetime] NOT NULL,
[Click_Url] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Url_Index] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__5CE4E57F] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__5DD909B8] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__5ECD2DF1] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__5FC1522A] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_ClicksUpdate] ON [ods].[SubscriberMail_Clicks]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_Clicks] t
	JOIN inserted i ON  t.[MessageId] = i.[MessageId] AND t.[RecipientId] = i.[RecipientId] AND t.[Click_Time] = i.[Click_Time] AND t.[Click_Url_Index] = i.[Click_Url_Index]

INSERT INTO [ods].[Snapshot_SubscriberMail_Clicks] ([MessageId],[RecipientId],[Click_Time],[Click_Url],[Click_Url_Index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_Clicks] ADD CONSTRAINT [PK__Subscrib__786F776B7E1C0919] PRIMARY KEY CLUSTERED  ([MessageId], [RecipientId], [Click_Time], [Click_Url_Index])
GO
