SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_news_RecipientListByMessage_DataFields]
AS

SELECT DISTINCT
	convert(nvarchar(50),left([ETL__multi_query_value_for_audit],32)) [MessageID_K]
	,CONVERT(NVARCHAR(100),[email]) [email]
	,CONVERT(NVARCHAR(50),[recipientData_id]) [recipientData_id_K]
	,CONVERT(NVARCHAR(50),[dataFields_id]) [dataFields_id_K]
	,CONVERT(NVARCHAR(100),[dataFields_value]) [dataFields_value]
FROM [src].[SubscriberMail_news_RecipientListByMessage] WITH (NOLOCK)
where email is not null and recipientdata_id is not null and datafields_id is not null
GO
