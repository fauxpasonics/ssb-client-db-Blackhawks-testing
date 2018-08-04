CREATE TABLE [ods].[Snapshot_SubscriberMail_News_MessageById]
(
[SubscriberMail_News_MessageByIdSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_News_MessageById] ADD CONSTRAINT [PK__Snapshot__1020A5B8AF82E30D] PRIMARY KEY CLUSTERED  ([SubscriberMail_News_MessageByIdSK])
GO
