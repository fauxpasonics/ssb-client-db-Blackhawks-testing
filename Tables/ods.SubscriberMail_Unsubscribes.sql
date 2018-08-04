CREATE TABLE [ods].[SubscriberMail_Unsubscribes]
(
[Email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MessageId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReasonId] [bit] NOT NULL,
[RecipientId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeTime] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__7C2624A9] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__7D1A48E2] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__7E0E6D1B] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__7F029154] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_UnsubscribesUpdate] ON [ods].[SubscriberMail_Unsubscribes]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_Unsubscribes] t
	JOIN inserted i ON  t.[Email] = i.[Email] AND t.[MessageId] = i.[MessageId] AND t.[ReasonId] = i.[ReasonId]

INSERT INTO [ods].[Snapshot_SubscriberMail_Unsubscribes] ([Email],[MessageId],[ReasonId],[RecipientId],[UnsubscribeTime],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_Unsubscribes] ADD CONSTRAINT [PK__Subscrib__93F23D3CDFA57C75] PRIMARY KEY CLUSTERED  ([Email], [MessageId], [ReasonId])
GO
