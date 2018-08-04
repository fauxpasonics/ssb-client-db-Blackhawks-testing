CREATE TABLE [ods].[Snapshot_SubscriberMail_MessageById]
(
[SubscriberMail_MessageByIdSK] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_SubscriberMail_MessageById] ADD CONSTRAINT [PK__Snapshot__A20A3BFB6F158CD3] PRIMARY KEY CLUSTERED  ([SubscriberMail_MessageByIdSK])
GO
