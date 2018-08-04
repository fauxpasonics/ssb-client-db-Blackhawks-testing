CREATE TABLE [ods].[SubscriberMail_News_Bounces]
(
[email] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[messageId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[reason] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Bounce_Time] [datetime] NOT NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason_index] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__01CB8614] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__02BFAA4D] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__03B3CE86] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__04A7F2BF] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_News_BouncesUpdate] ON [ods].[SubscriberMail_News_Bounces]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_News_Bounces] t
	JOIN inserted i ON  t.[email] = i.[email] AND t.[messageId] = i.[messageId] AND t.[recipientId] = i.[recipientId] AND t.[Bounce_Time] = i.[Bounce_Time] AND t.[reason_index] = i.[reason_index]

INSERT INTO [ods].[Snapshot_SubscriberMail_News_Bounces] ([email],[messageId],[reason],[recipientId],[Bounce_Time],[type],[reason_index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_News_Bounces] ADD CONSTRAINT [PK__Subscrib__4C6E7BE446FD482F] PRIMARY KEY CLUSTERED  ([email], [messageId], [recipientId], [Bounce_Time], [reason_index])
GO
