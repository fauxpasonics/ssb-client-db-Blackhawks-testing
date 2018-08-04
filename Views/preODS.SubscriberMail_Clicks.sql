SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_Clicks]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(75),[MessageId]) [MessageId_K]
	,CONVERT(NVARCHAR(75),[RecipientId]) [RecipientId_K]
	,CONVERT(DATETIME,CONCAT(RIGHT(click_time,4),+'',+SUBSTRING(click_time,4,16)))[Click_Time_K]
	,CONVERT(NVARCHAR(2000),[Click_Url]) [Click_Url]
	,CONVERT(NVARCHAR(100),RIGHT([Click_Url],100)) [Click_Url_Index_K]
FROM [src].[SubscriberMail_Clicks] WITH (NOLOCK)
WHERE recipientid IS NOT NULL
GO
