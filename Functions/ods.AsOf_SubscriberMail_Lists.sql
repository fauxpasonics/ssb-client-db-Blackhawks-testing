SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_Lists] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_Lists] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[List_Description] [nvarchar](300) NULL,
[List_ID] [nvarchar](100) NULL,
[List_Name] [nvarchar](100) NULL,
[UnsubscribeFlag] [nvarchar](20) NULL,
[UnsubscribeGroupName] [nvarchar](100) NULL,
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
SELECT [List_Description],[List_ID],[List_Name],[UnsubscribeFlag],[UnsubscribeGroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [List_Description],[List_ID],[List_Name],[UnsubscribeFlag],[UnsubscribeGroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_Lists] t
	UNION ALL
	SELECT [List_Description],[List_ID],[List_Name],[UnsubscribeFlag],[UnsubscribeGroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_Lists]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
