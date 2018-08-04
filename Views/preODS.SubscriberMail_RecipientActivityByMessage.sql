SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_RecipientActivityByMessage]
AS
SELECT DISTINCT
	CONVERT(NVARCHAR(50),LEFT([ETL__multi_query_value_for_audit],32))Recipient_ID_K
	,CONVERT(NVARCHAR(50),RIGHT([ETL__multi_query_value_for_audit],32))MessageID_K
	,CONVERT(INT,[NumBounces]) [NumBounces]
	,CONVERT(INT,[NumClicks]) [NumClicks]
	,CONVERT(INT,[NumOpens]) [NumOpens]
	,CONVERT(INT,[NumSent]) [NumSent]
	,CONVERT(INT,[SoftBounceCount]) [SoftBounceCount]
	,CONVERT(INT,[TotalUnsubCount]) [TotalUnsubCount]
FROM [src].[SubscriberMail_RecipientActivityByMessage] WITH (NOLOCK)
GO
