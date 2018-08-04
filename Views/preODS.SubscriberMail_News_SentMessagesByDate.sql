SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_SentMessagesByDate]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(50),[Messageid]) [Messageid_K]
	,CONVERT(DATETIME,CONCAT(RIGHT(Message_Date,4),+'',+SUBSTRING(Message_Date,4,16)))[Message_Date_K]
	,CONVERT(DATETIME,CONCAT(RIGHT(DateScheduled,4),+'',+SUBSTRING(DateScheduled,4,16)))[DateScheduled]
	,CONVERT(NVARCHAR(500),[Label]) [Label]
	,CONVERT(NVARCHAR(50),[ParentId]) [ParentId]
	,CONVERT(NVARCHAR(250),[Subject]) [Subject]
FROM [src].[SubscriberMail_News_SentMessagesByDate] WITH (NOLOCK)
GO
