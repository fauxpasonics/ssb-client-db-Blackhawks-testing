SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[SubscriberMail_MessageById]
AS

SELECT DISTINCT
	CONVERT(NVARCHAR(50),[MessageID]) [MessageID_K]
	,CONVERT(daTETIME,[DateCreated]) [DateCreated]
	,CONVERT(datetime,[DateModified]) [DateModified]
	--,CONVERT(NVARCHAR(MAX),[FromDisplayAddress]) [FromDisplayAddress]
    --,CONVERT(NVARCHAR(MAX),[htmlContent]) [htmlContent]
	,CONVERT(NVARCHAR(200),[Label]) [Label]
	,CONVERT(NVARCHAR(25),[LastModifiedByFirstName]) [LastModifiedByFirstName]
	,CONVERT(NVARCHAR(25),[LastModifiedByLastName]) [LastModifiedByLastName]
	,CONVERT(int,[MessageStatus]) [MessageStatus]
	,CONVERT(NVARCHAR(50),[ParentId]) [ParentId]
	--,CONVERT(NVARCHAR(MAX),[ReplyAddress]) [ReplyAddress]
	,CONVERT(Datetime,[ScheduleTime]) [ScheduleTime]
	,CONVERT(NVARCHAR(200),[Subject]) [Subject]
	,CONVERT(NVARCHAR(MAX),[TextContent]) [TextContent]
	,CONVERT(NVARCHAR(MAX),[L2_ListIds]) [L2_ListIds]
	,CONVERT(NVARCHAR(MAX),[L2_SuppressListIds]) [L2_SuppressListIds]
FROM [src].[SubscriberMail_MessageById] WITH (NOLOCK)
GO
