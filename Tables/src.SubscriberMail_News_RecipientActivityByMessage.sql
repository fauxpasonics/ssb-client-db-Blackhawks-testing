CREATE TABLE [src].[SubscriberMail_News_RecipientActivityByMessage]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumBounces] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumClicks] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumOpens] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumSent] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SoftBounceCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalUnsubCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
