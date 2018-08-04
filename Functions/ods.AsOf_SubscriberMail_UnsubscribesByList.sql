SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_UnsubscribesByList] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_UnsubscribesByList] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[Email] [nvarchar](100) NULL,
[ListId] [nvarchar](50) NULL,
[MessageId] [nvarchar](50) NULL,
[RecipientId] [nvarchar](50) NULL,
[Unsubscribe_Time] [datetime] NULL,
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
SELECT [Email],[ListId],[MessageId],[RecipientId],[Unsubscribe_Time],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [Email],[ListId],[MessageId],[RecipientId],[Unsubscribe_Time],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_UnsubscribesByList] t
	UNION ALL
	SELECT [Email],[ListId],[MessageId],[RecipientId],[Unsubscribe_Time],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_UnsubscribesByList]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
