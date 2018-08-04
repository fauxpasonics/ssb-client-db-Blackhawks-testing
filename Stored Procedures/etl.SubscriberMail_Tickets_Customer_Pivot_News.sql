SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





/*****	Revision History

DCH 2018-04-28	-	a variety of changes/comments all made with my initials and the same date

*****/


CREATE PROCEDURE [etl].[SubscriberMail_Tickets_Customer_Pivot_News]
AS


DECLARE @cols AS NVARCHAR(MAX)
	, @query AS NVARCHAR(MAX);


--	consider the possibility that the table may not already exist.		DCH 2018-04-28
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_schema = 'etl' AND table_name = 'Subscribermail_Customer_Pivot_News')
BEGIN
	DROP TABLE [etl].[Subscribermail_Customer_Pivot_News]
END;
		



SELECT r.Email,r.RecipientData_id,r.DataField_ID,d.Datafield_name,r.DataField_Value,r.ETL_CreatedOn,r.ETL_UpdatedOn,r.ETL_CreatedBy,r.ETL_UpdatedBy
INTO  #pivotnewsnames
FROM ods.SubscriberMail_news_RecipientsModifiedByDate r
LEFT JOIN ods.SubscriberMail_news_datafieldlist d	
--	JOIN ods.SubscriberMail_news_datafieldlist d				--	DCH 2018-06-22
	ON r.DataField_ID = d.datafield_id
--	WHERE r.ETL_CreatedOn>= GETDATE()-3					        -- uncomment after this has been alter then ran
--	OR r.RecipientData_id = 'ssb02396dfessbssb69fe5ce4695fssb'; -- uncomment after this has been alter then ran






SELECT @cols = STUFF((   SELECT   ',' + QUOTENAME(datafield_name)
                         FROM    #pivotnewsnames
						 WHERE DataField_ID IS NOT NULL AND DataField_ID <>''
						GROUP BY datafield_name
						ORDER BY datafield_name
                         FOR XML PATH(''), TYPE
                     ).value('.', 'NVARCHAR(MAX)')
                   , 1
                   , 1
                   , ''
                    );


--	are these results used in another procedure/process?  If not, why not dump into a temp table?		DCH 2018-04-28
SET @query = '			SELECT    ETL_CreatedOn
						,ETL_UpdatedOn
						,ETL_CreatedBy
						,ETL_UpdatedBy
						,email
						, RecipientData_id
						,' + @cols + ' 
			  INTO [etl].[Subscribermail_Customer_Pivot_news]
			  FROM 
			 (
				SELECT   ETL_CreatedOn
						,ETL_UpdatedOn
						,ETL_CreatedBy
						,ETL_UpdatedBy
						,email
						,RecipientData_id
						,Datafield_name
						,DataField_Value
				FROM #Pivotnewsnames
			) x
			PIVOT 
			(
				Min(DataField_Value)
				FOR datafield_name IN (' + @cols + ')
			) p';


EXECUTE ( @query );

INSERT INTO [etl].[Subscribermail_Customer_Pivot_news] (etl_createdon,etl_updatedon,etl_createdby,etl_updatedby,email,recipientdata_id)
select GETDATE(),getdate(),'ssbcloud\ssales','ssbcloud\ssales',email,RecipientData_id
FROM #pivotnewsnames
WHERE DataField_ID = ''


--	consider the possibility that no records may have met the previous criteria. In that case, skip over the remaining processing.	DCH 2018-04-28
IF NOT EXISTS (select * from information_schema.tables where table_schema = 'etl' and table_name = 'Subscribermail_Customer_Pivot_News')
GOTO ExitSproc;


/*	this is unnecessary		DCH 2018-04-28
SELECT *
INTO #tmpmergedatanews
FROM [etl].[Subscribermail_Customer_Pivot_News] r
*/

CREATE NONCLUSTERED INDEX idx_Pivot_News ON etl.Subscribermail_Customer_Pivot_News(RecipientData_id);		--	DCH 2018-04-28

MERGE ods.subscribermail_customer_Data_news AS mytarget
USING etl.Subscribermail_Customer_Pivot_News AS mysource
	ON mysource.RecipientData_id = mytarget.recipientdata_id

WHEN MATCHED
THEN UPDATE SET
mytarget.[ETL_CreatedOn]                       = CASE WHEN mysource.[ETL_CreatedOn]					IS NULL THEN mytarget.[ETL_CreatedOn]					ELSE mysource.[ETL_CreatedOn]				           	END
,mytarget.[ETL_UpdatedOn]                      = CASE WHEN mysource.[ETL_UpdatedOn]					IS NULL THEN mytarget.[ETL_UpdatedOn]                 	ELSE mysource.[ETL_UpdatedOn]							END
,mytarget.[ETL_CreatedBy]                      = CASE WHEN mysource.[ETL_CreatedBy]					IS NULL THEN mytarget.[ETL_CreatedBy]                 	ELSE mysource.[ETL_CreatedBy]							END
,mytarget.[ETL_UpdatedBy]                      = CASE WHEN mysource.[ETL_UpdatedBy]					IS NULL THEN mytarget.[ETL_UpdatedBy]                 	ELSE mysource.[ETL_UpdatedBy]							END
,mytarget.[email]							   = CASE WHEN mysource.[email]							IS NULL THEN mytarget.[email]							ELSE mysource.[email]									END
,mytarget.[RecipientData_id]                   = CASE WHEN mysource.[RecipientData_id]				IS NULL THEN mytarget.[RecipientData_id]              	ELSE mysource.[RecipientData_id]						END
,mytarget.[Account Credit]                     = CASE WHEN mysource.[Account Credit]				IS NULL THEN mytarget.[Account Credit]                	ELSE mysource.[Account Credit]							END
,mytarget.[Account Number]                     = CASE WHEN mysource.[Account Number]				IS NULL THEN mytarget.[Account Number]                	ELSE mysource.[Account Number]							END
,mytarget.[Account Number #2]                  = CASE WHEN mysource.[Account Number #2]				IS NULL THEN mytarget.[Account Number #2]             	ELSE mysource.[Account Number #2]						END
,mytarget.[Account Number #3]                  = CASE WHEN mysource.[Account Number #3]				IS NULL THEN mytarget.[Account Number #3]             	ELSE mysource.[Account Number #3]						END
,mytarget.[Account Number #4]                  = CASE WHEN mysource.[Account Number #4]				IS NULL THEN mytarget.[Account Number #4]             	ELSE mysource.[Account Number #4]						END
,mytarget.[Account Rep]                        = CASE WHEN mysource.[Account Rep]					IS NULL THEN mytarget.[Account Rep]                   	ELSE mysource.[Account Rep]								END
,mytarget.[Account Rep email]                  = CASE WHEN mysource.[Account Rep email]				IS NULL THEN mytarget.[Account Rep email]             	ELSE mysource.[Account Rep email]						END
,mytarget.[Account Rep phone]                  = CASE WHEN mysource.[Account Rep phone]				IS NULL THEN mytarget.[Account Rep phone]             	ELSE mysource.[Account Rep phone]						END
,mytarget.[AccountID]                          = CASE WHEN mysource.[AccountID]						IS NULL THEN mytarget.[AccountID]                     	ELSE mysource.[AccountID]								END
,mytarget.[Address]                            = CASE WHEN mysource.[Address]						IS NULL THEN mytarget.[Address]                       	ELSE mysource.[Address]									END
,mytarget.[Blackhawks Bar]                     = CASE WHEN mysource.[Blackhawks Bar]				IS NULL THEN mytarget.[Blackhawks Bar]                	ELSE mysource.[Blackhawks Bar]							END
,mytarget.[City]                               = CASE WHEN mysource.[City]							IS NULL THEN mytarget.[City]                          	ELSE mysource.[City]									END
,mytarget.[DOB]                                = CASE WHEN mysource.[DOB]							IS NULL THEN mytarget.[DOB]                           	ELSE mysource.[DOB]										END
,mytarget.[Fantasy Team Name]                  = CASE WHEN mysource.[Fantasy Team Name]				IS NULL THEN mytarget.[Fantasy Team Name]             	ELSE mysource.[Fantasy Team Name]						END
,mytarget.[Favorite Player (#1)]               = CASE WHEN mysource.[Favorite Player (#1)]			IS NULL THEN mytarget.[Favorite Player (#1)]          	ELSE mysource.[Favorite Player (#1)]					END
,mytarget.[Favorite Player (#2)]               = CASE WHEN mysource.[Favorite Player (#2)]			IS NULL THEN mytarget.[Favorite Player (#2)]          	ELSE mysource.[Favorite Player (#2)]					END
,mytarget.[Favorite Player (#3)]               = CASE WHEN mysource.[Favorite Player (#3)]			IS NULL THEN mytarget.[Favorite Player (#3)]          	ELSE mysource.[Favorite Player (#3)]					END
,mytarget.[Favorite Team]                      = CASE WHEN mysource.[Favorite Team]					IS NULL THEN mytarget.[Favorite Team]                 	ELSE mysource.[Favorite Team]							END
,mytarget.[First Name]                         = CASE WHEN mysource.[First Name]					IS NULL THEN mytarget.[First Name]                    	ELSE mysource.[First Name]								END
,mytarget.[Full Name]                          = CASE WHEN mysource.[Full Name]						IS NULL THEN mytarget.[Full Name]                     	ELSE mysource.[Full Name]								END
,mytarget.[Game Night Code]                    = CASE WHEN mysource.[Game Night Code]				IS NULL THEN mytarget.[Game Night Code]               	ELSE mysource.[Game Night Code]							END
,mytarget.[Game Night Code 010318]             = CASE WHEN mysource.[Game Night Code 010318]		IS NULL THEN mytarget.[Game Night Code 010318]        	ELSE mysource.[Game Night Code 010318]					END
,mytarget.[Game Night Code 010518]             = CASE WHEN mysource.[Game Night Code 010518]		IS NULL THEN mytarget.[Game Night Code 010518]        	ELSE mysource.[Game Night Code 010518]					END
,mytarget.[Game Night Code 010718]             = CASE WHEN mysource.[Game Night Code 010718]		IS NULL THEN mytarget.[Game Night Code 010718]        	ELSE mysource.[Game Night Code 010718]					END
,mytarget.[Game Night Code 010918]             = CASE WHEN mysource.[Game Night Code 010918]		IS NULL THEN mytarget.[Game Night Code 010918]        	ELSE mysource.[Game Night Code 010918]					END
,mytarget.[Game Night Code 011018]             = CASE WHEN mysource.[Game Night Code 011018]		IS NULL THEN mytarget.[Game Night Code 011018]        	ELSE mysource.[Game Night Code 011018]					END
,mytarget.[Game Night Code 011218]             = CASE WHEN mysource.[Game Night Code 011218]		IS NULL THEN mytarget.[Game Night Code 011218]        	ELSE mysource.[Game Night Code 011218]					END
,mytarget.[Game Night Code 011418]             = CASE WHEN mysource.[Game Night Code 011418]		IS NULL THEN mytarget.[Game Night Code 011418]        	ELSE mysource.[Game Night Code 011418]					END
,mytarget.[Game Night Code 032218]             = CASE WHEN mysource.[Game Night Code 032218]		IS NULL THEN mytarget.[Game Night Code 032218]        	ELSE mysource.[Game Night Code 032218]					END
,mytarget.[Game Night Code 032418]             = CASE WHEN mysource.[Game Night Code 032418]		IS NULL THEN mytarget.[Game Night Code 032418]        	ELSE mysource.[Game Night Code 032418]					END
,mytarget.[Game Night Code 032618]             = CASE WHEN mysource.[Game Night Code 032618]		IS NULL THEN mytarget.[Game Night Code 032618]        	ELSE mysource.[Game Night Code 032618]					END
,mytarget.[Game Night Code 032918]             = CASE WHEN mysource.[Game Night Code 032918]		IS NULL THEN mytarget.[Game Night Code 032918]        	ELSE mysource.[Game Night Code 032918]					END
,mytarget.[Game Night Code 033018]             = CASE WHEN mysource.[Game Night Code 033018]		IS NULL THEN mytarget.[Game Night Code 033018]        	ELSE mysource.[Game Night Code 033018]					END
,mytarget.[Game Night Code 040418]             = CASE WHEN mysource.[Game Night Code 040418]		IS NULL THEN mytarget.[Game Night Code 040418]        	ELSE mysource.[Game Night Code 040418]					END
,mytarget.[Game Night Code 040618]             = CASE WHEN mysource.[Game Night Code 040618]		IS NULL THEN mytarget.[Game Night Code 040618]        	ELSE mysource.[Game Night Code 040618]					END
,mytarget.[Game Night Code 040718]             = CASE WHEN mysource.[Game Night Code 040718]		IS NULL THEN mytarget.[Game Night Code 040718]        	ELSE mysource.[Game Night Code 040718]					END
,mytarget.[Game Night Code 122917]             = CASE WHEN mysource.[Game Night Code 122917]		IS NULL THEN mytarget.[Game Night Code 122917]        	ELSE mysource.[Game Night Code 122917]					END
,mytarget.[Game Night Code 123117]             = CASE WHEN mysource.[Game Night Code 123117]		IS NULL THEN mytarget.[Game Night Code 123117]        	ELSE mysource.[Game Night Code 123117]					END
,mytarget.[Gender]                             = CASE WHEN mysource.[Gender]						IS NULL THEN mytarget.[Gender]                        	ELSE mysource.[Gender]									END
,mytarget.[Hull Plan 2015]                     = CASE WHEN mysource.[Hull Plan 2015]				IS NULL THEN mytarget.[Hull Plan 2015]                	ELSE mysource.[Hull Plan 2015]							END
,mytarget.[In Market]                          = CASE WHEN mysource.[In Market]						IS NULL THEN mytarget.[In Market]                     	ELSE mysource.[In Market]								END
,mytarget.[Last Name]                          = CASE WHEN mysource.[Last Name]						IS NULL THEN mytarget.[Last Name]                     	ELSE mysource.[Last Name]								END
,mytarget.[Password]							=CASE WHEN  mysource.[Password]						IS NULL THEN mytarget.[Password]						ELSE mysource.[Password]								END
,mytarget.[Phone]							    =CASE WHEN  mysource.[Phone]						IS NULL THEN mytarget.[Phone]							ELSE mysource.[Phone]									END
,mytarget.[State]                              = CASE WHEN mysource.[State]							IS NULL THEN mytarget.[State]                         	ELSE mysource.[State]									END
,mytarget.[Team Manager]                       = CASE WHEN mysource.[Team Manager]					IS NULL THEN mytarget.[Team Manager]                  	ELSE mysource.[Team Manager]							END
,mytarget.[Team Name]                          = CASE WHEN mysource.[Team Name]						IS NULL THEN mytarget.[Team Name]                     	ELSE mysource.[Team Name]								END
,mytarget.[TixExchange Credit]                 = CASE WHEN mysource.[TixExchange Credit]			IS NULL THEN mytarget.[TixExchange Credit]            	ELSE mysource.[TixExchange Credit]						END
,mytarget.[Winter Classic]                     = CASE WHEN mysource.[Winter Classic]				IS NULL THEN mytarget.[Winter Classic]                	ELSE mysource.[Winter Classic]							END
,mytarget.[Winter Classic First Seat]          = CASE WHEN mysource.[Winter Classic First Seat]		IS NULL THEN mytarget.[Winter Classic First Seat]     	ELSE mysource.[Winter Classic First Seat]				END
,mytarget.[Winter Classic Last Seat]           = CASE WHEN mysource.[Winter Classic Last Seat]		IS NULL THEN mytarget.[Winter Classic Last Seat]      	ELSE mysource.[Winter Classic Last Seat]				END
,mytarget.[Winter Classic Purchase Price]      = CASE WHEN mysource.[Winter Classic Purchase Price]	IS NULL THEN mytarget.[Winter Classic Purchase Price] 	ELSE mysource.[Winter Classic Purchase Price]			END
,mytarget.[Winter Classic Row]                 = CASE WHEN mysource.[Winter Classic Row]			IS NULL THEN mytarget.[Winter Classic Row]            	ELSE mysource.[Winter Classic Row]						END
,mytarget.[Winter Classic Section]             = CASE WHEN mysource.[Winter Classic Section]		IS NULL THEN mytarget.[Winter Classic Section]        	ELSE mysource.[Winter Classic Section]					END
,mytarget.[YH Team Password]                   = CASE WHEN mysource.[YH Team Password]				IS NULL THEN mytarget.[YH Team Password]              	ELSE mysource.[YH Team Password]						END
,mytarget.[ZIP]                                = CASE WHEN mysource.[ZIP]							IS NULL THEN mytarget.[ZIP]                           	ELSE mysource.[ZIP]										END


WHEN NOT MATCHED THEN
INSERT ([ETL_CreatedOn]
		,[ETL_UpdatedOn]
		,[ETL_CreatedBy]
		,[ETL_UpdatedBy]
		,[email]
		,[RecipientData_id]
		,[Account Credit]
		,[Account Number]
		,[Account Number #2]
		,[Account Number #3]
		,[Account Number #4]
		,[Account Rep]
		,[Account Rep email]
		,[Account Rep phone]
		,[AccountID]
		,[Address]
		,[Blackhawks Bar]
		,[City]
		,[DOB]
		,[Fantasy Team Name]
		,[Favorite Player (#1)]
		,[Favorite Player (#2)]
		,[Favorite Player (#3)]
		,[Favorite Team]
		,[First Name]
		,[Full Name]
		,[Game Night Code]
		,[Game Night Code 010318]
		,[Game Night Code 010518]
		,[Game Night Code 010718]
		,[Game Night Code 010918]
		,[Game Night Code 011018]
		,[Game Night Code 011218]
		,[Game Night Code 011418]
		,[Game Night Code 032218]
		,[Game Night Code 032418]
		,[Game Night Code 032618]
		,[Game Night Code 032918]
		,[Game Night Code 033018]
		,[Game Night Code 040418]
		,[Game Night Code 040618]
		,[Game Night Code 040718]
		,[Game Night Code 122917]
		,[Game Night Code 123117]
		,[Gender]
		,[Hull Plan 2015]
		,[In Market]
		,[Last Name]
		,[Password]
		,[Phone]
		,[State]
		,[Team Manager]
		,[Team Name]
		,[TixExchange Credit]
		,[Winter Classic]
		,[Winter Classic First Seat]
		,[Winter Classic Last Seat]
		,[Winter Classic Purchase Price]
		,[Winter Classic Row]
		,[Winter Classic Section]
		,[YH Team Password]
		,[ZIP]

		)

VALUES (mysource.[ETL_CreatedOn]
		  ,mysource.[ETL_UpdatedOn]
		  ,mysource.[ETL_CreatedBy]
		  ,mysource.[ETL_UpdatedBy]
		  ,mysource.[email]
		  ,mysource.[RecipientData_id]
		  ,mysource.[Account Credit]
		  ,mysource.[Account Number]
		  ,mysource.[Account Number #2]
		  ,mysource.[Account Number #3]
		  ,mysource.[Account Number #4]
		  ,mysource.[Account Rep]
		  ,mysource.[Account Rep email]
		  ,mysource.[Account Rep phone]
		  ,mysource.[AccountID]
		  ,mysource.[Address]
		  ,mysource.[Blackhawks Bar]
		  ,mysource.[City]
		  ,mysource.[DOB]
		  ,mysource.[Fantasy Team Name]
		  ,mysource.[Favorite Player (#1)]
		  ,mysource.[Favorite Player (#2)]
		  ,mysource.[Favorite Player (#3)]
		  ,mysource.[Favorite Team]
		  ,mysource.[First Name]
		  ,mysource.[Full Name]
		  ,mysource.[Game Night Code]
		  ,mysource.[Game Night Code 010318]
		  ,mysource.[Game Night Code 010518]
		  ,mysource.[Game Night Code 010718]
		  ,mysource.[Game Night Code 010918]
		  ,mysource.[Game Night Code 011018]
		  ,mysource.[Game Night Code 011218]
		  ,mysource.[Game Night Code 011418]
		  ,mysource.[Game Night Code 032218]
		  ,mysource.[Game Night Code 032418]
		  ,mysource.[Game Night Code 032618]
		  ,mysource.[Game Night Code 032918]
		  ,mysource.[Game Night Code 033018]
		  ,mysource.[Game Night Code 040418]
		  ,mysource.[Game Night Code 040618]
		  ,mysource.[Game Night Code 040718]
		  ,mysource.[Game Night Code 122917]
		  ,mysource.[Game Night Code 123117]
		  ,mysource.[Gender]
		  ,mysource.[Hull Plan 2015]
		  ,mysource.[In Market]
		  ,mysource.[Last Name]
		  ,mysource.[Password]
		  ,mysource.[Phone]
		  ,mysource.[State]
		  ,mysource.[Team Manager]
		  ,mysource.[Team Name]
		  ,mysource.[TixExchange Credit]
		  ,mysource.[Winter Classic]
		  ,mysource.[Winter Classic First Seat]
		  ,mysource.[Winter Classic Last Seat]
		  ,mysource.[Winter Classic Purchase Price]
		  ,mysource.[Winter Classic Row]
		  ,mysource.[Winter Classic Section]
		  ,mysource.[YH Team Password]
		  ,mysource.[ZIP]
		  );



ExitSproc:



GO
