SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [etl].[vw_UnitedCenter_Attendance]
AS

SELECT	fi.FactInventoryId
	   ,ds.SeasonYear
	   ,ds.SeasonName
	   ,de.EventCode
	   ,de.EventName
	   ,CAST(de.EventDate AS DATE) EventDate
	   ,de.EventDateTime
	   ,dimseat.SectionName
	   ,dimseat.RowName
	   ,dimseat.Seat
	   ,DimPriceCode.PriceCode
	   ,DimPriceCode.PriceCodeDesc
	   ,CAST(CASE WHEN fts.RevenueTotal = 0 THEN 1 ELSE 0 END AS BIT) AS IsComp
	   ,CAST(CASE WHEN fi.FactTicketSalesId IS NULL THEN 0 ELSE 1 END AS BIT) AS IsDistributed
	   ,CASE WHEN fts.dimticketcustomerid IS NULL THEN NULL ELSE CONCAT('BH_',fts.DimTicketCustomerId) END AS SoldCustomerID
	   ,CAST(CASE WHEN fa.FactAttendanceId IS NULL THEN 0 ELSE 1 END AS BIT) AS IsAttended
	   ,dimScanGate.ScanGateName
	   ,dimScanType.ScanTypeName
	   ,fa.ScanDateTime
	   ,fa.IsMobile
FROM dbo.FactInventory_V2 fi
	JOIN dbo.DimEvent_V2 de ON de.DimEventId = fi.dimeventid
	JOIN dbo.DimSeason_V2 ds ON ds.dimseasonid = fi.dimseasonid
	JOIN dbo.DimSeat_V2 dimseat ON dimseat.DimSeatId = fi.DimSeatId
	LEFT JOIN dbo.FactAttendance_V2 fa ON fa.FactAttendanceId = fi.FactAttendanceId
	LEFT JOIN dbo.DimScanGate_V2 dimScanGate ON dimScanGate.DimScanGateId = fa.DimScanGateId
	LEFT JOIN dbo.DimScanType_V2 dimScanType ON dimScanType.DimScanTypeId = fa.DimScanTypeId
	LEFT JOIN dbo.FactTicketSales_V2 fts ON fts.FactTicketSalesId = fi.FactTicketSalesId
	LEFT JOIN dbo.DimPriceCode_V2 DimPriceCode ON fts.DimPriceCodeId = DimPriceCode.DimPriceCodeId
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
