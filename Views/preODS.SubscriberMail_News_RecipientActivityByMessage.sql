SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_News_RecipientActivityByMessage]
AS

SELECT DISTINCT
	convert(nvarchar(50),left([ETL__multi_query_value_for_audit],32))Recipient_ID_K
	,convert(nvarchar(50),right([ETL__multi_query_value_for_audit],32))MessageID_K
	,CONVERT(int,[NumBounces]) [NumBounces]
	,CONVERT(int,[NumClicks]) [NumClicks]
	,CONVERT(int,[NumOpens]) [NumOpens]
	,CONVERT(int,[NumSent]) [NumSent]
	,CONVERT(int,[SoftBounceCount]) [SoftBounceCount]
	,CONVERT(int,[TotalUnsubCount]) [TotalUnsubCount]
FROM [src].[SubscriberMail_News_RecipientActivityByMessage] WITH (NOLOCK)
GO
