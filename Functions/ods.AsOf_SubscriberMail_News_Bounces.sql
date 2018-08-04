SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_News_Bounces] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_News_Bounces] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[email] [nvarchar](150) NULL,
[messageId] [nvarchar](100) NULL,
[reason] [nvarchar](1000) NULL,
[recipientId] [nvarchar](100) NULL,
[Bounce_Time] [datetime] NULL,
[type] [nvarchar](max) NULL,
[reason_index] [nvarchar](1000) NULL,
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
SELECT [email],[messageId],[reason],[recipientId],[Bounce_Time],[type],[reason_index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [email],[messageId],[reason],[recipientId],[Bounce_Time],[type],[reason_index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_News_Bounces] t
	UNION ALL
	SELECT [email],[messageId],[reason],[recipientId],[Bounce_Time],[type],[reason_index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_News_Bounces]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
