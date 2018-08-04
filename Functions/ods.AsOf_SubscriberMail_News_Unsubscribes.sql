SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_News_Unsubscribes] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_News_Unsubscribes] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[Email] [nvarchar](100) NULL,
[MessageId] [nvarchar](50) NULL,
[ReasonId] [bit] NULL,
[RecipientId] [nvarchar](50) NULL,
[UnsubscribeTime] [nvarchar](max) NULL,
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
SELECT [Email],[MessageId],[ReasonId],[RecipientId],[UnsubscribeTime],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [Email],[MessageId],[ReasonId],[RecipientId],[UnsubscribeTime],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_News_Unsubscribes] t
	UNION ALL
	SELECT [Email],[MessageId],[ReasonId],[RecipientId],[UnsubscribeTime],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_News_Unsubscribes]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
