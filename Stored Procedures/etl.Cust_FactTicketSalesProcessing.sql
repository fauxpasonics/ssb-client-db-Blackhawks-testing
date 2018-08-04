SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









---- run this after making updates to ticket tagging.
--EXEC etl.TM_LoadFacts @BatchId = NULL, -- uniqueidentifier
--                      @Options = N'<options><LoadDate>1900-01-01</LoadDate></options>'   -- nvarchar(max)


-- DECLARE @BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000'
  

-- EXEC etl.TM_Stage_FactTicketSales @BatchId = @BatchId, @Options = '<options><LoadDate>1900-01-01</LoadDate></options>'




-- IF EXISTS (SELECT * FROM sys.procedures WHERE [object_id] = OBJECT_ID('etl.Cust_FactTicketSalesProcessing'))
-- BEGIN    
 
--     EXEC etl.Cust_FactTicketSalesProcessing @BatchId = @BatchId

-- END




-- EXEC [etl].[SSB_StandardModelLoad] @BatchId = @BatchId , @Target = 'etl.vw_FactTicketSales', @Source = 'etl.vw_Load_TM_FactTicketSales', 
-- @BusinessKey = 'ETL__SSID_TM_event_id, ETL__SSID_TM_section_id, ETL__SSID_TM_row_id, ETL__SSID_TM_seat_num', @SourceSystem = 'TM'

  

CREATE	 PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId NVARCHAR (50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS



BEGIN

/*****************************************************************************************************************
												Ticket Type
******************************************************************************************************************/

----FULL SEASON----

UPDATE fts
SET fts.DimTicketTypeId = 2
FROM    stg.TM_FactTicketSales  fts
        INNER JOIN dbo.DimPriceCode_V2 p ON p.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 s ON s.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
WHERE  (fts.dimseasonid in (15)
		AND (pl.plancode LIKE '%FS%')
		AND (p.pricecode like '%1'or p.pricecode like  '%R' or p.pricecode like  '%SD' or  p.pricecode LIKE  '%SP' or p.pricecode like  '%SPR' or p.pricecode like  '%1C'))
OR

(fts.dimseasonid in (9)
		AND (pl.plancode LIKE '%FS%')
		AND (p.pricecode like '%1'or p.pricecode like  '_R%' or p.pricecode like  '%SD' or  p.pricecode LIKE  '%SP' or p.pricecode like  '%SPR' or p.pricecode like  '%1C' or p.pricecode like  '%MX' or p.pricecode like  '%1U'))





----Partial Plan----

UPDATE fts
SET fts.DimTicketTypeId = 3
FROM    stg.TM_FactTicketSales  fts
   INNER JOIN dbo.DimPriceCode_V2 p ON p.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 s ON s.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON fts.DimEventId = e.DimEventId
WHERE  (fts.dimseasonid in (15)
		AND (pl.plancode like 'MIKIT%' OR pl.plancode LIKE 'HULL%' OR pl.plancode LIKE 'EARLY%') 
		AND (p.pricecode LIKE '%1'OR p.pricecode LIKE  '%R'OR p.pricecode LIKE  '%MP' OR p.pricecode LIKE  '%U') )


		OR
        
		(fts.dimseasonid in (9)
		AND (pl.plancode like 'MIKIT%' OR pl.plancode LIKE 'HULL%' OR pl.plancode LIKE 'EARLY%')  )





----Single Game---

UPDATE fts
SET fts.DimTicketTypeId = 4
FROM    stg.TM_FactTicketSales  fts
	    INNER JOIN dbo.DimPriceCode_V2 p ON p.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 s ON s.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
WHERE  (fts.dimseasonid in (15)
		AND (p.pricecode IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J','K','L')
		OR p.pricecode like '%GV' OR p.pricecode like '%BNC' OR p.pricecode like '%SPS' OR p.pricecode like '%GPR'  or  p.pricecode like '%GC' OR p.pricecode LIKE '%BUY'))

		OR 
		
		(fts.dimseasonid in (9)
		AND pl.PlanCode = 'none'
		AND (p.pricecode LIKE '_' OR p.pricecode like '%GV' OR p.pricecode like '%BNC' OR p.pricecode like '%SPS' OR p.pricecode like '%GPR'  or  p.pricecode like '%GC'))



----Group----

UPDATE fts
SET fts.DimTicketTypeId = 5
FROM    stg.TM_FactTicketSales  fts
		 INNER JOIN dbo.DimPriceCode_V2 p ON p.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 s ON s.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON fts.DimEventId = e.DimEventId
WHERE  (fts.dimseasonid in (15)
		AND (p.pricecode LIKE '%G'
		OR p.pricecode LIKE '%GM%' 
		OR p.pricecode LIKE '%INT'
		OR p.pricecode LIKE '%_JR'
		OR p.pricecode LIKE '%PRE'
		OR p.pricecode LIKE '%HC'
		OR p.pricecode LIKE '%GST'))


		OR

        
		(fts.dimseasonid in (9)
		AND pl.PlanCode = 'none'
		AND (p.pricecode LIKE '%_G'
		OR p.pricecode LIKE '%GM%' 
		OR p.pricecode LIKE '%INT'
		OR p.pricecode LIKE '%_JR'
		OR p.pricecode LIKE '%PRE'
		OR p.pricecode LIKE '%HC'
		OR p.pricecode LIKE '%GST'
		OR p.pricecode LIKE '%BUY'))




----Comp----

UPDATE fts
SET fts.DimTicketTypeId = 6
FROM    stg.TM_FactTicketSales  fts
		INNER JOIN dbo.DimPriceCode_V2 p ON p.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 s ON s.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
WHERE  fts.dimseasonid in (15,9)
		AND  (p.pricecode LIKE '_' OR p.pricecode like '%SC' OR p.pricecode like '%ICE'OR p.pricecode like '_C')
		AND fts.RevenueTotal = '0.000000'
		


---Other Catch-All----

UPDATE fts
SET fts.DimTicketTypeId = 8
FROM    stg.TM_FactTicketSales  fts
		INNER JOIN dbo.DimPriceCode_V2 p ON p.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 s ON s.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
WHERE  (fts.dimseasonid in (15)
		AND  (p.pricecode IN ('KR','GR') OR p.pricecode LIKE '_R' OR p.pricecode LIKE '%1' or p.pricecode LIKE '%SPR' )
		AND pl.PlanCode = 'NONE')
		--AND p.pricecode <> 'JR'


		OR
		
		(fts.dimseasonid in (9)
		AND p.PriceCode IN ('DR2','DSPR','FR10','FSP','HSPR','J1','JMX','JR') AND pl.PlanCode = 'none')




--SELECT p.pricecode,pl.PlanCode,f.DimTicketTypeId,f.DimPlanTypeId,f.DimTicketClassId,* FROM dbo.FactTicketSales_V2 f
--JOIN dbo.DimPriceCode_V2 p
--ON p.DimPriceCodeId = f.DimPriceCodeId
--JOIN dbo.DimPlan_V2 pl
--ON pl.DimPlanId = f.DimPlanId
--JOIN dbo.DimEvent_V2 e
--ON e.DimEventId = f.DimEventId
--WHERE p.PriceCode LIKE '_1'
--AND pl.PlanCode = 'none'

/*****************************************************************************************************************
													PLAN TYPE
******************************************************************************************************************/

----NEW Plan----

UPDATE fts
SET fts.DimPlanTypeId = 2
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 pl ON pl.DimPlanId = fts.DimPlanId
WHERE  (fts.dimseasonid in (15)
		AND (pricecode.PriceCode LIKE '%1%'
		OR pricecode.PriceCode LIKE '%U'
		OR pricecode.PriceCode LIKE '%SD')
		AND (pl.plancode like 'MIKIT%' OR pl.plancode LIKE 'HULL%' OR pl.plancode LIKE 'EARLY%' OR pl.plancode LIKE '%FS%')) 

		OR
        

		 (fts.dimseasonid in (9)
		AND (pricecode.PriceCode LIKE '%1%'
		OR pricecode.PriceCode LIKE '%U'
		OR pricecode.PriceCode LIKE '%SD')
		AND (pl.plancode like 'MIKIT%' OR pl.plancode LIKE 'HULL%' OR pl.plancode LIKE 'EARLY%' OR pl.plancode LIKE '%FS%') 
		AND pricecode.PriceCode NOT LIKE '%11'
		AND pricecode.pricecode NOT LIKE '%21'
		AND pricecode.pricecode NOT LIKE '%31')




----Plan Renewal----

UPDATE fts
SET fts.DimPlanTypeId = 3
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 pl ON pl.DimPlanId = fts.DimPlanId
WHERE  (fts.dimseasonid in (15)
		AND (pricecode.pricecode LIKE '%R' OR pricecode.pricecode LIKE '%MP') 
		AND (Pricecode.pricecode NOT like'%JR' OR PriceCode.PriceCode NOT LIKE '%SPR')
		AND (pl.plancode like 'MIKIT%' OR pl.plancode LIKE 'HULL%' OR pl.plancode LIKE 'EARLY%' OR pl.plancode LIKE '%FS%') )


		OR
        
		(fts.dimseasonid in (9)
		AND (pricecode.pricecode LIKE '_R%' OR pricecode.pricecode LIKE '%MP'  OR pricecode.pricecode LIKE '%MX') 
		AND (Pricecode.pricecode NOT like'_JR' OR PriceCode.PriceCode NOT LIKE 'SPR')
		AND (pl.plancode like 'MIKIT%' OR pl.plancode LIKE 'HULL%' OR pl.plancode LIKE 'EARLY%' OR pl.plancode LIKE '%FS%') )




----Single Game----

UPDATE fts
SET fts.DimPlanTypeId = 4
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 pl ON pl.DimPlanId = fts.DimPlanId
WHERE  (fts.dimseasonid in (15)
		AND (pricecode.pricecode LIKE '_' 
		OR PriceCode.PriceCode LIKE '%GV'
		OR PriceCode.PriceCode LIKE '%BNC'
		OR PriceCode.PriceCode LIKE '%PRE'
		OR PriceCode.PriceCode LIKE '%HC'
		OR PriceCode.PriceCode LIKE '%GST'
		OR PriceCode.PriceCode LIKE '_G'
		OR PriceCode.PriceCode LIKE '%GM%'
		OR PriceCode.PriceCode LIKE '%BUY'
		OR PriceCode.PriceCode LIKE '%INT'
		OR PriceCode.PriceCode LIKE '%GC'
		OR PriceCode.PriceCode LIKE '%GPR'
		OR PriceCode.PriceCode LIKE '%_JR'))

		or

		 (fts.dimseasonid in (9)
		AND (pricecode.pricecode LIKE '_' 
		OR PriceCode.PriceCode LIKE '%GV'
		OR PriceCode.PriceCode LIKE '%BNC'
		OR PriceCode.PriceCode LIKE '%PRE'
		OR PriceCode.PriceCode LIKE '%HC'
		OR PriceCode.PriceCode LIKE '%GST'
		OR PriceCode.PriceCode LIKE '_G'
		OR PriceCode.PriceCode LIKE '%GM%'
		OR PriceCode.PriceCode LIKE '%BUY'
		OR PriceCode.PriceCode LIKE '%INT'
		OR PriceCode.PriceCode LIKE '%GC'
		OR PriceCode.PriceCode LIKE '%GPR'
		OR PriceCode.PriceCode LIKE '%_JR')
		AND pl.plancode =  'None')
		

----Sponsor----

UPDATE fts
SET fts.DimPlanTypeId = 5
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
WHERE  (fts.dimseasonid in (15)
		AND pricecode.PriceCode LIKE '_SP_')

		OR
        
		(fts.dimseasonid in (9)
		AND pricecode.PriceCode LIKE '_SP%')
		--SUBSTRING(pricecode.pricecode,2,2)='SP' 

----Comp----

UPDATE fts
SET fts.DimPlanTypeId = 7
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
WHERE  fts.dimseasonid in (15,9)
		AND  (pricecode.pricecode LIKE '_' OR pricecode.pricecode like '%SC' OR pricecode.pricecode like '%ICE' OR pricecode.pricecode like '_C')
		AND fts.RevenueTotal = '0.000000'
		

----Catch All----

UPDATE fts
SET fts.DimPlanTypeId = 2
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 pl ON pl.DimPlanId = fts.DimPlanId
WHERE (fts.dimseasonid in (15)
		AND  (PriceCode.pricecode IN ('KR','GR') OR PriceCode.pricecode LIKE '_R' OR PriceCode.pricecode LIKE '_1')
		AND pl.PlanCode = 'NONE')


		OR
		(fts.dimseasonid in (9)
		AND  ((PriceCode.pricecode IN ('KR','GR') OR PriceCode.pricecode LIKE '_R' OR PriceCode.pricecode LIKE '_1')
		AND pl.PlanCode = 'NONE')

		OR ( pricecode.pricecode IN ( 'JMX','FR10','DR2') AND pl.PlanCode = 'none')
		OR (pricecode.pricecode IN ('J','H') AND pl.plancode LIKE 'Hull%'))
		


/*****************************************************************************************************************
													TICKET CLASS
******************************************************************************************************************/

----ST1----

UPDATE fts
SET fts.DimTicketClassId =1 
FROM     stg.TM_FactTicketSales   fts

        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
		AND (pl.plancode LIKE '%FS%' or  pl.plancode IS NULL OR pl.plancode = 'None')
		AND (pricecode.pricecode LIKE '_1'or pricecode.pricecode LIKE '%1C'))

		OR
        

		(fts.dimseasonid in (9)
		AND (pl.plancode LIKE '%FS%' or  pl.plancode IS NULL OR pl.plancode = 'None')
		AND (pricecode.pricecode LIKE '_1'or pricecode.pricecode LIKE '%1C')
		AND (pricecode.pricecode NOT LIKE '%11'  OR pricecode.pricecode NOT LIKE '%21' OR pricecode.pricecode NOT LIKE '%31'))




--------STSD

UPDATE fts
SET fts.DimTicketClassId =2 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
		AND pl.plancode LIKE '%FS%'  
		AND pricecode.pricecode LIKE '_SD'


--------STR

UPDATE fts
SET fts.DimTicketClassId =3 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
		AND (pl.plancode LIKE '%FS%'  OR pl.plancode IS NULL OR pl.plancode= 'None')
		AND pricecode.pricecode LIKE '_R')

		OR
        
		(fts.dimseasonid in (9)
		AND (pl.plancode LIKE '%FS%'  OR pl.plancode IS NULL OR pl.plancode= 'None')
		AND (pricecode.pricecode LIKE '_R%' OR pricecode.pricecode LIKE '%MX'))




--------PPM

UPDATE fts
SET fts.DimTicketClassId =4 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
		AND pl.plancode LIKE 'MIKIT%' 
		AND pricecode.pricecode LIKE '%1'


--------PPH

UPDATE fts
SET fts.DimTicketClassId =5 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
		AND pl.plancode LIKE 'HULL_%' 
		AND pricecode.pricecode LIKE '%1'


--------PP7

UPDATE fts
SET fts.DimTicketClassId =6 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode LIKE 'EARLY%' 
AND pricecode.pricecode LIKE '%1'

--------PPRM

UPDATE fts
SET fts.DimTicketClassId =8 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode LIKE 'MIKIT%' 
AND (pricecode.pricecode LIKE '%R' OR pricecode.pricecode LIKE '%MP')


--------PPRH

UPDATE fts
SET fts.DimTicketClassId =9 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode LIKE 'HULL%'
 AND (pricecode.pricecode LIKE '%R' OR pricecode.pricecode LIKE '%MP')

--------PPR7

UPDATE fts
SET fts.DimTicketClassId =10 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode LIKE 'EARLY%' 
AND (pricecode.pricecode LIKE '%R' OR pricecode.pricecode LIKE '%MP')


--------UPGRDS

UPDATE fts
SET fts.DimTicketClassId =26 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode LIKE '%FS%' 
AND pricecode.pricecode LIKE '%U'



--------UPGRDM

UPDATE fts
SET fts.DimTicketClassId =27
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode LIKE 'Mikit%' 
AND pricecode.pricecode LIKE '%U'



--------GRPT

UPDATE fts
SET fts.DimTicketClassId =11 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode LIKE 'EUCG%' 
AND pricecode.pricecode LIKE '%G')


	OR
    (fts.dimseasonid in (9)
AND pl.PlanCode = 'none'
AND pricecode.pricecode LIKE '%G')

--------GRPI

UPDATE fts
SET fts.DimTicketClassId =12 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
and e.eventcode LIKE 'EUCG%' 
AND pricecode.pricecode LIKE '%INT')


OR

(fts.dimseasonid in (9) AND pricecode.pricecode LIKE '%INT')

--------GRPJ

UPDATE fts
SET fts.DimTicketClassId =13 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode LIKE 'EUCG%' 
AND pricecode.pricecode LIKE '%_JR')


OR

 (fts.dimseasonid in (9)AND pricecode.pricecode LIKE '%_JR' AND pl.plancode = 'none')


--------GRPM

UPDATE fts
SET fts.DimTicketClassId =14
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode LIKE 'EUCG%' 
AND (pricecode.pricecode LIKE '%GM%' OR pricecode.pricecode LIKE '%PRE' OR pricecode.pricecode like '%HC' OR pricecode.pricecode LIKE '%GST'))

OR

(fts.dimseasonid in (9)
AND pl.plancode = 'none'
AND (pricecode.pricecode LIKE '%GM%' OR pricecode.pricecode LIKE '%PRE' OR pricecode.pricecode like '%HC' OR pricecode.pricecode LIKE '%GST'))
--------SGMM

UPDATE fts
SET fts.DimTicketClassId =16 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode LIKE 'EUCG%' 
AND pricecode.pricecode LIKE '%GV')


OR

(fts.dimseasonid in (9)
AND pl.PlanCode = 'none'
AND pricecode.pricecode LIKE '%GV')




--------SGT

UPDATE fts
SET fts.DimTicketClassId =17 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode  LIKE 'EUCG%' 
AND pricecode.pricecode LIKE '_' 
AND pricecode.PriceCode <> 'L')


OR

(fts.dimseasonid in (9)
AND pl.plancode = 'none'
AND pricecode.pricecode LIKE '_' 
AND pricecode.PriceCode <> 'L')



--------SGRB

UPDATE fts
SET fts.DimTicketClassId =18 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode  LIKE 'EUCG%' 
AND pricecode.pricecode LIKE '%BUY')

OR

(fts.dimseasonid in (9)
AND pl.plancode = 'none'
AND pricecode.pricecode LIKE '%BUY')

--------SGBSA

UPDATE fts
SET fts.DimTicketClassId =19 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode  LIKE 'EUCG%' 
AND pricecode.pricecode LIKE 'ABNC')


OR

(fts.dimseasonid in (9)
AND pl.plancode = 'none'
AND pricecode.pricecode LIKE 'ABNC')

--------SGDS

UPDATE fts
SET fts.DimTicketClassId =28
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND e.eventcode  LIKE 'EUCG%' 
AND (pricecode.pricecode LIKE 'L%' or pricecode.pricecode LIKE '%GPR' OR pricecode.pricecode LIKE '%_GC'))


OR

 (fts.dimseasonid in (9)
AND pl.PlanCode = 'none'
AND (pricecode.pricecode LIKE 'L%' or pricecode.pricecode LIKE '%GPR' OR pricecode.pricecode LIKE '%_GC'))


--------COMPSN

UPDATE fts
SET fts.DimTicketClassId =20 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND pl.plancode  LIKE '%FS%'  
AND (pricecode.pricecode LIKE '%SC' OR pricecode.pricecode LIKE '_C')
AND fts.RevenueTotal = '0.000000'



--------COMPRP

UPDATE fts
SET fts.DimTicketClassId =21 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
 AND e.eventcode  LIKE 'EUCG%' 
 AND pricecode.pricecode LIKE '%ICE'
 AND fts.RevenueTotal = '0.000000')


 OR
 

 (fts.dimseasonid in (9)
 AND pl.PlanCode = 'none'
 AND pricecode.pricecode LIKE '%ICE'
 AND fts.RevenueTotal = '0.000000')





--------COMPSG

UPDATE fts
SET fts.DimTicketClassId =22 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND  pricecode.pricecode LIKE '_'
AND fts.RevenueTotal = '0.000000')

OR

(fts.dimseasonid in (9)
AND pl.PlanCode = 'none'
AND  pricecode.pricecode LIKE '_'
AND fts.RevenueTotal = '0.000000')


--------SPNSRSN

UPDATE fts
SET fts.DimTicketClassId =23 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
AND (pl.plancode LIKE '%FS%'  OR pl.plancode  IS NULL OR pl.plancode  = 'None')
AND pricecode.pricecode LIKE '%SP1')


OR

(fts.dimseasonid in (9)
AND (pl.plancode LIKE '%FS%')
AND(pricecode.pricecode LIKE '%SP1' OR pricecode.pricecode LIKE '%SP'))




--------SPNSRSR

UPDATE fts
SET fts.DimTicketClassId =24 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE fts.dimseasonid in (15,9)
AND (pl.plancode  LIKE '%FS%'  OR pl.plancode  IS NULL OR pl.plancode  = 'None') 
AND pricecode.pricecode LIKE '%SPR'



--------SPNSRSG

UPDATE fts
SET fts.DimTicketClassId =25 
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
		AND e.eventcode LIKE 'EUCG%' 
		AND pricecode.pricecode LIKE '%SPS')

		OR
        
		(fts.dimseasonid in (9)
		AND pl.PlanCode = 'none'
		AND pricecode.pricecode LIKE '%SPS')


-------Catch All

UPDATE fts
SET fts.DimTicketClassId =29
FROM     stg.TM_FactTicketSales   fts
        INNER JOIN dbo.DimPriceCode_V2 PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPlan_V2 PL ON pl.dimplanid = fts.dimplanID
		JOIN dbo.DimEvent_V2 e ON e.DimEventId = fts.DimEventId
WHERE (fts.dimseasonid in (15)
		AND  (PriceCode.pricecode IN ('KR','GR') OR PriceCode.pricecode LIKE '_R')
		AND pl.PlanCode = 'NONE')

		OR
        
		(fts.dimseasonid = 9
		AND (pricecode IN ('JSC','GSC','FSP','FSC','DSC','DC','BSC','BC') AND pl.PlanCode = 'none')
		or (pricecode.pricecode IN ('J','H') AND pl.plancode LIKE 'Hull%'))



/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/

--UPDATE fts
--SET fts.DimSeatTypeID =2
--FROM     stg.TM_FactTicketSales   fts
--		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
--		JOIN dbo.DimSeat_V2 seat ON seat.DimSeatId = fts.DimSeatId_Start
--WHERE  fts.dimseasonID IN(27,10)
--AND SectionName IN ('201','202','203','204','205','206','207','208','209'
--,'210','211','212','213','214','215','216','217','218','219','220','221','222','223'
--,'224','225','226','227','228')




UPDATE fts
SET fts.DimSeatTypeID =1
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'A%'



UPDATE fts
SET fts.DimSeatTypeID =2
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'B%'



UPDATE fts
SET fts.DimSeatTypeID =3
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'C%'



UPDATE fts
SET fts.DimSeatTypeID =4
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'D%'



UPDATE fts
SET fts.DimSeatTypeID =5
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'E%'



UPDATE fts
SET fts.DimSeatTypeID =6
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'F%'



UPDATE fts
SET fts.DimSeatTypeID =7
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid in (15,9)
AND pricecode.PriceCode LIKE 'G%'



UPDATE fts
SET fts.DimSeatTypeID =8
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid IN (15,9)
AND pricecode.PriceCode LIKE 'H%'



UPDATE fts
SET fts.DimSeatTypeID =9
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid IN (15,9)
AND (pricecode.PriceCode LIKE 'J%' OR pricecode.PriceCode LIKE 'L%')



UPDATE fts
SET fts.DimSeatTypeID =10
FROM     stg.TM_FactTicketSales   fts
		JOIN dbo.DimSeason_V2 season ON season.DimSeasonId = fts.DimSeasonId
		JOIN dbo.DimPriceCode_V2 pricecode ON pricecode.DimPriceCodeId = fts.DimPriceCodeId
WHERE  fts.dimseasonid IN (15,9)
AND pricecode.PriceCode LIKE 'K%'


END


















GO
