SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







-- =============================================
-- Created By: Scott Sales
-- Create Date: 2018-04-30
-- Reviewed By: 
-- Reviewed Date: 
-- Description: Subscribermail customer data pivot process
-- =============================================


/*****	Revision History

DCH 2018-04-28	-	a variety of changes/comments all made with my initials and the same date
SAS 2018-04-30  - Updated temp table build to included 1 ID to ensure all field_names will be present in pivot table so the downstream merge does not break

*****/


CREATE PROCEDURE [etl].[SubscriberMail_Tickets_Customer_Pivot]
AS



DECLARE @cols AS NVARCHAR(MAX)
	, @query AS NVARCHAR(MAX);


--	consider the possibility that the table may not already exist.		DCH 2018-04-28
IF EXISTS (select * from information_schema.tables where table_schema = 'etl' and table_name = 'Subscribermail_Customer_Pivot')
BEGIN
	DROP TABLE [etl].[Subscribermail_Customer_Pivot]
END;

-- hard coded in ID that has all field names values present to build out complete pivot table with out any missing column names     SAS 2018-04-30
SELECT r.Email,r.RecipientData_id,r.DataField_ID,d.field_name,r.DataField_Value,r.ETL_CreatedOn,r.ETL_UpdatedOn,r.ETL_CreatedBy,r.ETL_UpdatedBy
INTO #pivotnames
FROM ods.SubscriberMail_RecipientsModifiedByDate r
LEFT JOIN ods.SubscriberMail_datafieldlist d	
--	JOIN ods.SubscriberMail_datafieldlist d						--	DCH 2018-06-22
	ON r.DataField_ID = d.datafield_id
--WHERE r.ETL_CreatedOn>= GETDATE()-3							-- uncomment after this has been alter then ran
--OR r.RecipientData_id = 'ff556f1a1fc74b21ab47f1a8d1df0917';	-- uncomment after this has been alter then ran



SELECT @cols = STUFF((   SELECT   ',' + QUOTENAME(field_name)
                         FROM    #pivotnames
						 WHERE DataField_ID IS NOT NULL AND DataField_ID <>''
						GROUP BY field_name
						ORDER BY field_name
                         FOR XML PATH(''), TYPE
                     ).value('.', 'NVARCHAR(MAX)')
                   , 1
                   , 1
                   , ''
                    );


--	are these results used in another procedure/process?  If not, why not dump into a temp table?		DCH 2018-04-28
SET @query = 'SELECT    ETL_CreatedOn
						,ETL_UpdatedOn
						,ETL_CreatedBy
						,ETL_UpdatedBy
						,email
						, RecipientData_id
						,' + @cols + ' 
			  INTO [etl].[Subscribermail_Customer_Pivot]
			  FROM 
			 (
				SELECT   ETL_CreatedOn
						,ETL_UpdatedOn
						,ETL_CreatedBy
						,ETL_UpdatedBy
						,email
						,RecipientData_id
						,field_name
						,DataField_Value
				FROM #Pivotnames
			) x
			PIVOT 
			(
				Min(DataField_Value)
				FOR field_name IN (' + @cols + ')
			) p';


EXECUTE ( @query );



INSERT INTO  [etl].[Subscribermail_Customer_Pivot] (etl_createdon,etl_updatedon,etl_createdby,etl_updatedby,email,recipientdata_id)
select GETDATE(),getdate(),'ssbcloud\ssales','ssbcloud\ssales',email,RecipientData_id
FROM #pivotnames
WHERE DataField_ID = ''







--	consider the possibility that no records may have met the previous criteria. In that case, skip over the remaining processing.	DCH 2018-04-28
-- This will not happen anymore now with hard coded ID in the first temp table build												SAS 2018-04-30
--IF NOT EXISTS (select * from information_schema.tables where table_schema = 'etl' and table_name = 'Subscribermail_Customer_Pivot')
--GOTO ExitSproc;



	--	will not alter unless this is commented out.  fullname and lakeshake columns dont exist		DCH 2018-04-28
	-- this is due to the key value pair and when the payload does not consist of those feilds in the datafeild column, we will have missing column names every so often		SAS 2018-04-30
SELECT *
	,ROW_NUMBER() OVER(PARTITION BY r.RecipientData_id ORDER BY	r.AccountID desc)rnk
INTO  #tmpmergedata
--		select top  *
FROM [etl].[Subscribermail_Customer_Pivot] r



--incase there are multiple IDs with different key value pairs in same payload
SELECT Email 
	   ,accountid
	   ,recipientdata_ID
	   ,firstname
	   ,fullname
	   ,lakeshake
	   ,lakeshake2017
	   ,etl_createdon
	   ,etl_updatedon
	   ,etl_createdby
	   ,etl_updatedby
INTO  #tmpmergedataranked
FROM #tmpmergedata
WHERE rnk = 1

--CREATE NONCLUSTERED INDEX idx_temp ON #tmpmergedataranked (RecipientData_id);		--	DCH 2018-04-28




--TRUNCATE TABLE   ods.subscribermail_customer_Data
MERGE ods.subscribermail_customer_Data AS mytarget
USING (SELECT * FROM #tmpmergedataranked) AS mysource
ON mysource.RecipientData_id = mytarget.recipientdata_id

WHEN MATCHED
THEN UPDATE SET
 mytarget.Email = CASE WHEN mysource.email IS NULL THEN mytarget.email ELSE mysource.email END
,mytarget.accountid = CASE WHEN mysource.AccountID IS NULL THEN mytarget.accountid ELSE mysource.AccountID END
,mytarget.recipientdata_id = CASE WHEN mysource.RecipientData_id IS NULL THEN mytarget.RecipientData_id ELSE mysource.RecipientData_id  END
,mytarget.firstname =CASE WHEN mysource.FirstName IS NULL THEN mytarget.firstname ELSE mysource.FirstName END
,mytarget.fullname =CASE WHEN mysource.FullName IS NULL THEN mytarget.fullname ELSE mysource.FullName END
,mytarget.lakeshake =CASE WHEN mysource.LakeShake IS NULL THEN mytarget.lakeshake ELSE mysource.LakeShake END
,mytarget.lakeshake2017 =CASE WHEN mysource.LakeShake2017 IS NULL THEN mytarget.lakeshake2017 ELSE mysource.LakeShake2017 END
--,mytarget.Lastname_parsed = mysource.Lastname_parsed
,mytarget.etl_createdon = mysource.etl_createdon
,mytarget.etl_updatedon = mysource.etl_updatedon
,mytarget.etl_createdby = mysource.etl_createdby
,mytarget.etl_updatedby = mysource.etl_updatedby

WHEN NOT MATCHED THEN
INSERT (Email,
		accountid,
		recipientdata_id,
		firstname,
		fullname,
		lakeshake,
		lakeshake2017,
--		Lastname_parsed,
		etl_createdon,
		etl_updatedon,
		etl_createdby,
		etl_updatedby
		
		
		
		
		)
VALUES (mysource.Email,
		mysource.accountid,
		mysource.recipientdata_id,
		mysource.firstname,
		mysource.fullname,
		mysource.lakeshake,
		mysource.lakeshake2017,
--		mysource.Lastname_parsed,
		mysource.etl_createdon,
		mysource.etl_updatedon,
		mysource.etl_createdby,
		mysource.etl_updatedby
		);


--ExitSproc:




GO
