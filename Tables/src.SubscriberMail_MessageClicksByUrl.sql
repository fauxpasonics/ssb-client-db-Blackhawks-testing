CREATE TABLE [src].[SubscriberMail_MessageClicksByUrl]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkLabel] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalClicks] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UniqueClicks] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkURL] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
