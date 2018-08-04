SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_SentMessagesByDate]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(50),[Messageid]) [Messageid_K]
	,convert(datetime,concat(right(Date,4),+'',+substring(date,4,16)))[Message_Date_K]
	,convert(datetime,concat(right(DateScheduled,4),+'',+substring(DateScheduled,4,16)))[DateScheduled]
	,CONVERT(NVARCHAR(500),[Label]) [Label]
	,CONVERT(NVARCHAR(50),[ParentId]) [ParentId]
	,CONVERT(NVARCHAR(250),[Subject]) [Subject]
FROM [src].[SubscriberMail_SentMessagesByDate] WITH (NOLOCK)
GO
