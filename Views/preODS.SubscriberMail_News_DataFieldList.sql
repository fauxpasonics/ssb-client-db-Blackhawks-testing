SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_DataFieldList]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(50),[Datafield_id]) [Datafield_id_K]
	,CONVERT(NVARCHAR(100),[Datafield_name]) [Datafield_name]
FROM [src].[SubscriberMail_News_DataFieldList] WITH (NOLOCK)
GO
