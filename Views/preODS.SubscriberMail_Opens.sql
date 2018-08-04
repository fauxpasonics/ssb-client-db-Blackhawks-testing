SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_Opens]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(100),[MessageId]) [MessageId_K]
	,CONVERT(NVARCHAR(100),[RecipientId]) [RecipientId_K]
    ,convert(datetime,concat(right(time,4),+'',+substring(time,4,16)))[Open_Time_K]
FROM [src].[SubscriberMail_Opens] WITH (NOLOCK)
WHERE messageID is not null
and (recipientid is not null or recipientid <>'')
GO
