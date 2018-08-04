SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW  [segmentation].[vw__Subscribermail_Total_Engaged]
AS
SELECT
	  m.SSB_CRMSYSTEM_CONTACT_ID
	, t.*
FROM	[ods].[Subscribermail_Total_Engaged] AS t
	INNER JOIN dbo.vwDimCustomer_ModAcctId AS m ON m.SSID = t.RecipientId
WHERE	m.SourceSystem = 'subscribermail';

GO
