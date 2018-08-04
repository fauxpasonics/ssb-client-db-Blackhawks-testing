SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_Clicks]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(75),[MessageId]) [MessageId_K]
	,CONVERT(NVARCHAR(75),[RecipientId]) [RecipientId_K]
	,CONVERT(DATETIME,CONCAT(RIGHT(time,4),+'',+SUBSTRING(time,4,16)))[Click_Time_K]
	,CONVERT(NVARCHAR(2000),[Url]) [Click_Url]
	,CONVERT(NVARCHAR(300),RIGHT([Url],300)) [Click_Url_Index_K]
FROM [src].[SubscriberMail_News_Clicks] WITH (NOLOCK)
WHERE recipientid IS NOT NULL and recipientid <>''
GO
