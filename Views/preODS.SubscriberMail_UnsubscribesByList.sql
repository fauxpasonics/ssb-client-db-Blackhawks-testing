SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_UnsubscribesByList]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(100),[Email]) [Email]
	,CONVERT(NVARCHAR(50),[ListId]) [ListId_K]
	,CONVERT(NVARCHAR(50),[MessageId]) [MessageId_K]
	,CONVERT(NVARCHAR(50),[RecipientId]) [RecipientId_k]
	,convert(datetime,concat(right(time,4),+'',+substring(time,4,16)))[Unsubscribe_Time_K]
FROM [src].[SubscriberMail_UnsubscribesByList] WITH (NOLOCK)
GO
