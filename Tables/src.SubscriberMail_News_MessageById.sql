CREATE TABLE [src].[SubscriberMail_News_MessageById]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateModified] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromDisplayAddress] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[htmlContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Messageid] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedByFirstName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedByLastName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageStatus] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReplyAddress] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduleTime] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TextContent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2ListIds_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2SuppressListIds_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
