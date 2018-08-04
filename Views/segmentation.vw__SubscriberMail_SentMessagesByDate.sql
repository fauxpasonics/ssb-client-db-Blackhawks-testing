SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [segmentation].[vw__SubscriberMail_SentMessagesByDate]
AS
SELECT
	  MessageID
	, DateScheduled
	, Label
	, ParentID
	, Subject
FROM	[ods].[SubscriberMail_News_SentMessagesByDate]
UNION ALL
SELECT
	  MessageID
	, DateScheduled
	, Label
	, ParentID
	, Subject
FROM [ods].[SubscriberMail_SentMessagesByDate]

GO
