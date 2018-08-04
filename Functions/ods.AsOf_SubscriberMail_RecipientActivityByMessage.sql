SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_RecipientActivityByMessage] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_RecipientActivityByMessage] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[Recipient_ID] [nvarchar](50) NULL,
[MessageID] [nvarchar](50) NULL,
[NumBounces] [int] NULL,
[NumClicks] [int] NULL,
[NumOpens] [int] NULL,
[NumSent] [int] NULL,
[SoftBounceCount] [int] NULL,
[TotalUnsubCount] [int] NULL,
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
SELECT [Recipient_ID],[MessageID],[NumBounces],[NumClicks],[NumOpens],[NumSent],[SoftBounceCount],[TotalUnsubCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [Recipient_ID],[MessageID],[NumBounces],[NumClicks],[NumOpens],[NumSent],[SoftBounceCount],[TotalUnsubCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_RecipientActivityByMessage] t
	UNION ALL
	SELECT [Recipient_ID],[MessageID],[NumBounces],[NumClicks],[NumOpens],[NumSent],[SoftBounceCount],[TotalUnsubCount],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_RecipientActivityByMessage]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
