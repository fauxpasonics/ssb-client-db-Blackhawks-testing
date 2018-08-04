SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_Bounces]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(150),[email]) [email_K]
	,CONVERT(NVARCHAR(100),[messageId]) [messageId_K]
	,CONVERT(NVARCHAR(MAX),[reason]) [reason]
	,CONVERT(NVARCHAR(100),[recipientId]) [recipientId_K]
	,CONVERT(DATETIME,CONCAT(RIGHT(time,4),+'',+SUBSTRING(time,4,16)))[Bounce_Time_K]
	,CONVERT(NVARCHAR(MAX),[type]) [type]
FROM [src].[SubscriberMail_Bounces] WITH (NOLOCK)
WHERE email IS NOT NULL and recipientid is not null
GO
