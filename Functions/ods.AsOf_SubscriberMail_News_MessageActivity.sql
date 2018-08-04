SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_News_MessageActivity] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_News_MessageActivity] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MessageID] [nvarchar](50) NULL,
[Bounces] [int] NULL,
[Clicks] [int] NULL,
[Opens] [int] NULL,
[Sent] [int] NULL,
[Softbounces] [int] NULL,
[Unsubscribes] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)

AS
BEGIN

DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))

INSERT INTO @Results
SELECT [MessageID],[Bounces],[Clicks],[Opens],[Sent],[Softbounces],[Unsubscribes],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MessageID],[Bounces],[Clicks],[Opens],[Sent],[Softbounces],[Unsubscribes],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_News_MessageActivity] t
	UNION ALL
	SELECT [MessageID],[Bounces],[Clicks],[Opens],[Sent],[Softbounces],[Unsubscribes],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_News_MessageActivity]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
