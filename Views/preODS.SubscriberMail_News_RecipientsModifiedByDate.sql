SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_RecipientsModifiedByDate]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(150),[Email]) [Email]
	,CONVERT(NVARCHAR(50),[RecipientData_id]) [RecipientData_id_K]
	,CONVERT(NVARCHAR(50),[DataField_id]) [DataField_id_K]
	,CONVERT(NVARCHAR(100),[DataField_value]) [DataField_value]
FROM [src].[SubscriberMail_News_RecipientsModifiedByDate] WITH (NOLOCK)
where datafield_ID is not null and recipientdata_ID is not null
and email <>''
GO
