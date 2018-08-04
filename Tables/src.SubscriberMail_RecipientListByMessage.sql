CREATE TABLE [src].[SubscriberMail_RecipientListByMessage]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_pageCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_pageNum] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_AllData_recipientData_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L3_AllData_recipientData_contentPreference] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientData_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipientData_dataFields_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dataFields_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dataFields_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
