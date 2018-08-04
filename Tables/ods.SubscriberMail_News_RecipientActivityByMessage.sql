CREATE TABLE [ods].[SubscriberMail_News_RecipientActivityByMessage]
(
[Recipient_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NumBounces] [int] NULL,
[NumClicks] [int] NULL,
[NumOpens] [int] NULL,
[NumSent] [int] NULL,
[SoftBounceCount] [int] NULL,
[TotalUnsubCount] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__55B432C3] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__56A856FC] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__579C7B35] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__58909F6E] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_News_RecipientActivityByMessageUpdate] ON [ods].[SubscriberMail_News_RecipientActivityByMessage]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_News_RecipientActivityByMessage] t
	JOIN inserted i ON  t.[Recipient_ID] = i.[Recipient_ID] AND t.[MessageID] = i.[MessageID]

INSERT INTO [ods].[Snapshot_SubscriberMail_News_RecipientActivityByMessage] ([Recipient_ID],[MessageID],[NumBounces],[NumClicks],[NumOpens],[NumSent],[SoftBounceCount],[TotalUnsubCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_News_RecipientActivityByMessage] ADD CONSTRAINT [PK__Subscrib__5A1BA5F0A2B49E2F] PRIMARY KEY CLUSTERED  ([Recipient_ID], [MessageID])
GO
