CREATE TABLE [ods].[SubscriberMail_RecipientActivityByMessage]
(
[Recipient_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NumBounces] [int] NULL,
[NumClicks] [int] NULL,
[NumOpens] [int] NULL,
[NumSent] [int] NULL,
[SoftBounceCount] [int] NULL,
[TotalUnsubCount] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__1A98C22E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__1B8CE667] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__1C810AA0] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__1D752ED9] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_RecipientActivityByMessageUpdate] ON [ods].[SubscriberMail_RecipientActivityByMessage]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_RecipientActivityByMessage] t
	JOIN inserted i ON  t.[Recipient_ID] = i.[Recipient_ID] AND t.[MessageID] = i.[MessageID]

INSERT INTO [ods].[Snapshot_SubscriberMail_RecipientActivityByMessage] ([Recipient_ID],[MessageID],[NumBounces],[NumClicks],[NumOpens],[NumSent],[SoftBounceCount],[TotalUnsubCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_RecipientActivityByMessage] ADD CONSTRAINT [PK__Subscrib__5A1BA5F0491A4392] PRIMARY KEY CLUSTERED  ([Recipient_ID], [MessageID])
GO
