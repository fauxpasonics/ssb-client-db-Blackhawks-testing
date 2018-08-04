SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_RecipientListByMessage]
AS

SELECT DISTINCT
	convert(nvarchar(50),left([ETL__multi_query_value_for_audit],32)) [MessageID_K]
	,CONVERT(NVARCHAR(100),[email]) [email]
	,CONVERT(NVARCHAR(50),[recipientData_id]) [recipientData_id_K]
FROM [src].[SubscriberMail_RecipientListByMessage] WITH (NOLOCK)
where email is not null and recipientdata_id is not null
GO
