SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [segmentation].[vw__SubscriberMail_RecipientActivityByMessage]
AS
SELECT
	  m.SSB_CRMSYSTEM_CONTACT_ID
	, t.Recipient_Id
	, t.messageid
	, t.numbounces
	, t.numclicks
	, t.numopens
	, t.numsent
	, t.softbouncecount
	, t.totalunsubcount
FROM	[ods].[SubscriberMail_News_RecipientActivityByMessage] AS t
	INNER JOIN dbo.vwDimCustomer_ModAcctId AS m ON m.SSID = t.Recipient_Id
WHERE	m.SourceSystem = 'subscribermail'
UNION ALL
SELECT
	  m.SSB_CRMSYSTEM_CONTACT_ID
	, t.Recipient_Id
	, t.messageid
	, t.numbounces
	, t.numclicks
	, t.numopens
	, t.numsent
	, t.softbouncecount
	, t.totalunsubcount
FROM	[ods].[SubscriberMail_RecipientActivityByMessage] AS t
	INNER JOIN dbo.vwDimCustomer_ModAcctId AS m ON m.SSID = t.Recipient_Id
WHERE	m.SourceSystem = 'subscribermail'

GO
