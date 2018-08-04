SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_SubscriberMail_News_MessageById] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_SubscriberMail_News_MessageById] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MessageID] [nvarchar](50) NULL,
[DateCreated] [datetime] NULL,
[DateModified] [datetime] NULL,
[FromDisplayAddress] [nvarchar](250) NULL,
[htmlContent] [nvarchar](max) NULL,
[Label] [nvarchar](200) NULL,
[LastModifiedByFirstName] [nvarchar](25) NULL,
[LastModifiedByLastName] [nvarchar](25) NULL,
[MessageStatus] [int] NULL,
[ParentId] [nvarchar](50) NULL,
[ReplyAddress] [nvarchar](150) NULL,
[ScheduleTime] [datetime] NULL,
[Subject] [nvarchar](200) NULL,
[TextContent] [nvarchar](max) NULL,
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
SELECT [MessageID],[DateCreated],[DateModified],[FromDisplayAddress],[htmlContent],[Label],[LastModifiedByFirstName],[LastModifiedByLastName],[MessageStatus],[ParentId],[ReplyAddress],[ScheduleTime],[Subject],[TextContent],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MessageID],[DateCreated],[DateModified],[FromDisplayAddress],[htmlContent],[Label],[LastModifiedByFirstName],[LastModifiedByLastName],[MessageStatus],[ParentId],[ReplyAddress],[ScheduleTime],[Subject],[TextContent],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[SubscriberMail_News_MessageById] t
	UNION ALL
	SELECT [MessageID],[DateCreated],[DateModified],[FromDisplayAddress],[htmlContent],[Label],[LastModifiedByFirstName],[LastModifiedByLastName],[MessageStatus],[ParentId],[ReplyAddress],[ScheduleTime],[Subject],[TextContent],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_SubscriberMail_News_MessageById]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
