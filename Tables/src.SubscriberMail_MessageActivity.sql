CREATE TABLE [src].[SubscriberMail_MessageActivity]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bounces] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Clicks] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opens] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sent] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Softbounces] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unsubscribes] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
