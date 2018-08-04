CREATE TABLE [src].[SubscriberMail_Unsubscribes]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_pageCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L1_AllData_pageNum] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L2_AllData_recipientUnsubscribes_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MessageId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReasonId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientId] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnsubscribeTime] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
