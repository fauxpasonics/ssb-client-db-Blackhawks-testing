SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_UnsubscribesByList]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(100),[Email]) [Email]
	,CONVERT(NVARCHAR(50),[ListId]) [ListId_k]
	,CONVERT(NVARCHAR(50),[MessageId]) [MessageId_k]
	,CONVERT(NVARCHAR(50),[RecipientId]) [RecipientId_k]
	,CONVERT(DATETIME,CONCAT(RIGHT(Unsubscribe_Time,4),+'',+SUBSTRING(Unsubscribe_Time,4,16)))[Unsubscribe_Time_K]
FROM [src].[SubscriberMail_News_UnsubscribesByList] WITH (NOLOCK)
WHERE EMAIL is not null and email <>''
GO
