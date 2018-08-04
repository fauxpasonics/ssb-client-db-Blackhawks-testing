SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_Unsubscribes]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(100),[Email]) [Email]
	,CONVERT(NVARCHAR(50),[MessageId]) [MessageId_K]
	,CONVERT(bit,[ReasonId]) [ReasonId_K]
	,CONVERT(NVARCHAR(50),[RecipientId]) [RecipientId_K]
	,CONVERT(NVARCHAR(MAX),[UnsubscribeTime]) [UnsubscribeTime]
FROM [src].[SubscriberMail_News_Unsubscribes] WITH (NOLOCK)
where email is not null and email <>''
GO
