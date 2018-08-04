SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_RecipientsModifiedByDate]
as
SELECT DISTINCT

	CONVERT(NVARCHAR(100),[Email]) [Email]
	,CONVERT(NVARCHAR(100),[RecipientData_id]) [RecipientData_id_K]
	,CONVERT(NVARCHAR(100),isnull([DataField_ID],'')) [DataField_ID_K]
	,CONVERT(NVARCHAR(200),[DataField_Value]) [DataField_Value]
FROM [src].[SubscriberMail_RecipientsModifiedByDate] WITH (NOLOCK)
where email is not null and email <>''
GO
