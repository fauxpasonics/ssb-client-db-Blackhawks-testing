SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROC [etl].[JSONTranslator_Queue]
AS




------------------------------------------------------------------------------- 
-- Author name: Scott Sales
-- Created date: 2018-05-29
-- Purpose: Commenting out the dynamic SQL and using the EXEs post load procs to run translator
-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- 01/01/0000: 
-- Change notes: 
-- Peer reviewed by: 
-- Peer review notes: 
-- Peer review date: 
-- Deployed by: 
-- Deployment date: 
-- Deployment notes: 
------------------------------------------------------------------------------- 
------------------------------------------------------------------------------- 



---- Select a stage table that is ready to process and queue up the translator proc (random in case one is failing repeatedly)
----DECLARE @SQL NVARCHAR(MAX) = '
----SELECT TOP 1 *
----SELECT *
----FROM
----	('

----SELECT @SQL += a
----FROM
----	(
----	SELECT DISTINCT NEWID() SortRandomly,'
----SELECT ''INSERT INTO audit.JSONTranslatorLog (SourceTable) VALUES (''''' + t.[Name] + ''''')
----EXEC [etl].[JSONTranslator] @Step = ''''Run ETL'''', @StageSchema = ''''' + t.[Schema] + ''''', @TableName = ''''' + t.[Name] + ''''', @SuppressPrint = 0,@RunFullSession = 1
----'' a FROM [' + t.[Schema] + '].[' + t.[Name] + '] WITH (NOLOCK) WHERE IsLoaded = 0 GROUP BY IsLoaded
----UNION ALL' a
----	FROM [etl].[JSON_Meta_Table_Configuration] tcon
----		JOIN [etl].[JSON_Meta_Table] t ON tcon.JSON_Meta_Table_ID = t.JSON_Meta_Table_ID
----	WHERE tcon.Active = 1
----	) a

----SET @SQL = LEFT(@SQL,LEN(@SQL)-11) + '
----	) a'

----PRINT @SQL
----DECLARE @ProcScript AS TABLE (Script NVARCHAR(MAX))
----INSERT INTO @ProcScript
----EXEC (@SQL)

----SET @SQL = ''

----SELECT @SQL += Script
----FROM @ProcScript
----PRINT @SQL

----EXEC(@SQL)


EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_Bounces',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_Bounces',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_Clicks',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_Clicks',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_Lists',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_Lists',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_Opens',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_Opens',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_RecipientsModifiedByDate',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_RecipientsModifiedByDate',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_Unsubscribes',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_Unsubscribes',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_Unsubscribesbylist',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_UnsubscribesByList',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_DataFieldlist',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_DataFieldlist',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_SentMessagesByDate',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_SentMessagesByDate',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_MessageActivity',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_MessageActivity',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_MessageById',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_MessageById',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_MessageClicksByUrl',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_MessageClicksByUrl',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_RecipientActivityByMessage',
                            @RunFullSession = 1;
EXEC [etl].[JSONTranslator] @Step = 'Run ETL',
                            @StageSchema = 'apietl',
                            @TableName = 'SubscriberMail_News_RecipientActivityByMessage',
                            @RunFullSession = 1;

GO
