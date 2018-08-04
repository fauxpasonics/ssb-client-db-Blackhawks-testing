CREATE TABLE [ods].[SubscriberMail_MessageById]
(
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL,
[DateModified] [datetime] NULL,
[Label] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedByFirstName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedByLastName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageStatus] [int] NULL,
[ParentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduleTime] [datetime] NULL,
[Subject] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TextContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_ListIds] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_SuppressListIds] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__2E479022] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_C__2F3BB45B] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__302FD894] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Subscribe__ETL_U__3123FCCD] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_SubscriberMail_MessageByIdUpdate] ON [ods].[SubscriberMail_MessageById]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[SubscriberMail_MessageById] t
	JOIN inserted i ON  t.[MessageID] = i.[MessageID]

INSERT INTO [ods].[Snapshot_SubscriberMail_MessageById] ([MessageID],[DateCreated],[DateModified],[Label],[LastModifiedByFirstName],[LastModifiedByLastName],[MessageStatus],[ParentId],[ScheduleTime],[Subject],[TextContent],[L2_ListIds],[L2_SuppressListIds],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[SubscriberMail_MessageById] ADD CONSTRAINT [PK__Subscrib__C87C037C5A3AD306] PRIMARY KEY CLUSTERED  ([MessageID])
GO
