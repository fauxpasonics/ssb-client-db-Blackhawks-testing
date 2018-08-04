CREATE TABLE [ods].[SubscriberMail_News_Lists]
(
[List_Description] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[List_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[List_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeFlag] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeGroupName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__3CD808A0] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__3DCC2CD9] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__3EC05112] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__3FB4754B] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_News_ListsUpdate] ON [ods].[SubscriberMail_News_Lists]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_News_Lists] t
	JOIN inserted i ON  t.[List_ID] = i.[List_ID]

INSERT INTO [ods].[Snapshot_SubscriberMail_News_Lists] ([List_Description],[List_ID],[List_Name],[UnsubscribeFlag],[UnsubscribeGroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_News_Lists] ADD CONSTRAINT [PK__Subscrib__267E8EE36E37B243] PRIMARY KEY CLUSTERED  ([List_ID])
GO
