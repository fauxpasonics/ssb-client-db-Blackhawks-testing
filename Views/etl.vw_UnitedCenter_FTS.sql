SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [etl].[vw_UnitedCenter_FTS] 
AS

SELECT	fts.FactTicketSalesId
	   ,dimseason.SeasonYear
	   ,dimseason.SeasonName
	   ,dimevent.EventCode
	   ,dimevent.EventName
	   ,dimevent.EventDate
	   ,dimevent.EventDateTime
	   ,dimseat.SectionName
	   ,dimseat.RowName
	   ,dimseat.Seat
	   ,DimPriceCode.PriceCode
	   ,DimPriceCode.PriceCodeDesc
       ,fts.QtySeat
       ,fts.RevenueTotal	   
FROM dbo.FactTicketSales_V2 fts
	JOIN dbo.DimSeason_V2 dimseason ON dimseason.DimSeasonId = fts.DimSeasonId
	JOIN dbo.DimEvent_V2 dimEvent ON dimEvent.DimEventId = fts.DimEventId
	JOIN dbo.DimPriceCode_V2 dimPriceCode ON dimPriceCode.DimPriceCodeId = fts.DimPriceCodeId
	JOIN dbo.DimSeat_V2 dimSeat ON dimSeat.DimSeatId = fts.DimSeatId_Start
WHERE seasonname IN (  '2016 Blackhawks GA Events'
					  ,'2016-2017 Chicago Blackhawks Season'
					  ,'2016-2017 Season Parking'
					  ,'2017 Blackhawks GA Events'
					  ,'2017 Chicago Blackhawks Playoffs'
					  ,'2017 Playoff Parking'
					  ,'2017 Winter Classic'
					  ,'2017-18 Ketel One Club'
					  ,'2017-2018 Blackhawks Season'
					  ,'2017-2018 Season Parking'
					  ,'2018 Blackhawks GA Events'
					  )
	 AND fts.UpdatedDate >= DATEADD(DAY,-3,GETDATE())
GO
