CREATE TABLE [ods].[SubscriberMail_MessageClicksByUrl]
(
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TotalClicks] [int] NULL,
[UniqueClicks] [int] NULL,
[LinkURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkURL_Index] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__1DDC1E2F] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__1ED04268] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__1FC466A1] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__20B88ADA] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_MessageClicksByUrlUpdate] ON [ods].[SubscriberMail_MessageClicksByUrl]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_MessageClicksByUrl] t
	JOIN inserted i ON  t.[MessageId] = i.[MessageId] AND t.[LinkURL_Index] = i.[LinkURL_Index]

INSERT INTO [ods].[Snapshot_SubscriberMail_MessageClicksByUrl] ([MessageId],[TotalClicks],[UniqueClicks],[LinkURL],[LinkURL_Index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_MessageClicksByUrl] ADD CONSTRAINT [PK__Subscrib__5F49B2C3057E7648] PRIMARY KEY CLUSTERED  ([MessageId], [LinkURL_Index])
GO
