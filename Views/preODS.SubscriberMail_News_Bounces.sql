SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_Bounces]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(150),[email]) [email_K]
	,CONVERT(NVARCHAR(100),[messageId]) [messageId_K]
	,CONVERT(NVARCHAR(1000),[reason]) [reason]
	,CONVERT(NVARCHAR(100),[recipientId]) [recipientId_K]
	,CONVERT(DATETIME,CONCAT(RIGHT(time,4),+'',+SUBSTRING(time,4,16)))[Bounce_Time_K]
	,CONVERT(NVARCHAR(MAX),[type]) [type]
	,CONVERT(NVARCHAR(1000),left([reason],50)) [reason_index_K]
FROM [src].[SubscriberMail_News_Bounces] WITH (NOLOCK)
where email is not null and recipientid is not null
and messageid is not null
GO
