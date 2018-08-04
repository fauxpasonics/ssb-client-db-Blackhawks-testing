CREATE TABLE [ods].[SubscriberMail_News_MessageById]
(
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL,
[DateModified] [datetime] NULL,
[FromDisplayAddress] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[htmlContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedByFirstName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedByLastName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageStatus] [int] NULL,
[ParentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReplyAddress] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduleTime] [datetime] NULL,
[Subject] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TextContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__3F6E553B] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__40627974] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__41569DAD] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__424AC1E6] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_News_MessageByIdUpdate] ON [ods].[SubscriberMail_News_MessageById]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_News_MessageById] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID]

INSERT INTO [ods].[Snapshot_SubscriberMail_News_MessageById] ([MessageID],[DateCreated],[DateModified],[FromDisplayAddress],[htmlContent],[Label],[LastModifiedByFirstName],[LastModifiedByLastName],[MessageStatus],[ParentId],[ReplyAddress],[ScheduleTime],[Subject],[TextContent],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_News_MessageById] ADD CONSTRAINT [PK__Subscrib__C87C037CAC5E89D8] PRIMARY KEY CLUSTERED  ([MessageID])
GO
