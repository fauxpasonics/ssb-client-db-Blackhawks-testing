CREATE TABLE [src].[SubscriberMail_News_Clicks]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_pageCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_pageNum] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_AllData_recipientClicks_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[messageId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[time] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
