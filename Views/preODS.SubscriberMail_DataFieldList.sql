SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_DataFieldList]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(50),[DataField_ID]) [DataField_ID]
	,CONVERT(NVARCHAR(20),[Field_Name]) [Field_Name]
FROM [src].[SubscriberMail_DataFieldList] WITH (NOLOCK)
GO
