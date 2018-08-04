SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_MessageActivity]
AS

SELECT DISTINCT
	Convert(nvarchar(50),[ETL__multi_query_value_for_audit]) [MessageID_K]
	,CONVERT(int,[Bounces]) [Bounces]
	,CONVERT(int,[Clicks]) [Clicks]
	,CONVERT(int,[Opens]) [Opens]
	,CONVERT(int,[Sent]) [Sent]
	,CONVERT(int,[Softbounces]) [Softbounces]
	,CONVERT(int,[Unsubscribes]) [Unsubscribes]
FROM [src].[SubscriberMail_News_MessageActivity] WITH (NOLOCK)
GO
