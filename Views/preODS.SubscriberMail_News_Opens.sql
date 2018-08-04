SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_Opens]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(50),[MessageId]) [MessageId_K]
	,CONVERT(NVARCHAR(50),[RecipientId]) [RecipientId_K]
    ,CONVERT(DATETIME,CONCAT(RIGHT(open_time,4),+'',+SUBSTRING(open_time,4,16)))[Open_Time_K]
FROM [src].[SubscriberMail_News_Opens] WITH (NOLOCK)
WHERE messageID IS NOT NULL
AND (recipientid IS NOT NULL OR recipientid <>'')
GO
