SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_Unsubscribes]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(150),[Email]) [Email_K]
	,CONVERT(NVARCHAR(50),[MessageId]) [MessageId_K]
	,CONVERT(bit,[ReasonId]) [ReasonId_K]
	,CONVERT(NVARCHAR(50),[RecipientId]) [RecipientId]
	,CONVERT(NVARCHAR(50),[UnsubscribeTime]) [UnsubscribeTime]
FROM [src].[SubscriberMail_Unsubscribes] WITH (NOLOCK)
where email is not null
GO
