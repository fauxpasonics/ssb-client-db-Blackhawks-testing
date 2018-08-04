SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_MessageClicksByUrl]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(50),[MessageId]) [MessageId_K]
	--,CONVERT(NVARCHAR(MAX),[LinkLabel]) [LinkLabel]
	,CONVERT(int,[TotalClicks]) [TotalClicks]
	,CONVERT(int,[UniqueClicks]) [UniqueClicks]
	,CONVERT(NVARCHAR(500),[LinkURL]) [LinkURL]
	,CONVERT(NVARCHAR(50),right([LinkURL],50)) [LinkURL_Index_K]
FROM [src].[SubscriberMail_MessageClicksByUrl] WITH (NOLOCK)
GO
