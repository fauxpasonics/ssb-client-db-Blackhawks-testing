SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_MessageClicksByUrl] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_MessageClicksByUrl] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MessageId] [nvarchar](50) NULL,
[TotalClicks] [int] NULL,
[UniqueClicks] [int] NULL,
[LinkURL] [nvarchar](500) NULL,
[LinkURL_Index] [nvarchar](50) NULL,
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
SELECT [MessageId],[TotalClicks],[UniqueClicks],[LinkURL],[LinkURL_Index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MessageId],[TotalClicks],[UniqueClicks],[LinkURL],[LinkURL_Index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_MessageClicksByUrl] t
	UNION ALL
	SELECT [MessageId],[TotalClicks],[UniqueClicks],[LinkURL],[LinkURL_Index],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_MessageClicksByUrl]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
