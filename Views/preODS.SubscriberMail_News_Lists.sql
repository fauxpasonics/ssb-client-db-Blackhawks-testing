SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_Lists]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(300),[List_Description]) [List_Description]
	,CONVERT(NVARCHAR(100),[List_ID]) [List_ID_K]
	,CONVERT(NVARCHAR(100),[List_Name]) [List_Name]
	,CONVERT(NVARCHAR(20),[UnsubscribeFlag]) [UnsubscribeFlag]
	,CONVERT(NVARCHAR(100),[UnsubscribeGroupName]) [UnsubscribeGroupName]
FROM [src].[SubscriberMail_News_Lists] WITH (NOLOCK)
WHERE list_id IS NOT NULL
GO
