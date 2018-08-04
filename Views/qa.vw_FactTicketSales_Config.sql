SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--796287

--SELECT *
--FROM ro.vw_DimEvent
--WHERE EventDate BETWEEN GETDATE() - 7 AND GETDATE() + 7
--ORDER BY EventDateTime


CREATE VIEW [qa].[vw_FactTicketSales_Config] AS (


SELECT 
f.OrderDate
, f.ETL__SSID_TM_acct_id ArchticsAccountId
, da.ArenaName
--, dsh.SeasonName SeasonHeaderName, dsh.SeasonClass SeasonHeaderClass, dsh.SeasonYear SeasonHeaderYear, dsh.IsActive SeasonHeaderIsActive, dsh.
, ds.SeasonName, ds.SeasonYear, ds.SeasonClass
--, deh.EventName EventHeaderName, deh.EventDesc EventHeaderDesc, deh.EventDateTime EventHeaderDateTime, deh.EventDate EventHeaderDate, deh.EventTime EventHeaderTime, deh.EventHierarchyL1, deh.EventHierarchyL2, deh.EventHierarchyL3
--, de.EventCode, de.EventName, de.EventClass, de.EventDateTime, de.EventDate, de.EventTime, de.TM_major_category, de.TM_minor_category
, di.ItemCode, di.ItemName
, dpl.PlanCode, dpl.PlanName, dpl.PlanClass, dpl.PlanFse, dpl.PlanEventCnt
, dst.SectionName, dst.RowName, dst.Seat, dst.Config_Location SeatLocationMapping
, dpc.PriceCode, dpc.pc1, dpc.PC2, dpc.PC3, dpc.PC4, dpc.PriceCodeDesc, dpc.PriceCodeGroup

, dtcl.TicketClassCode, dtcl.TicketClassName
, dtt.TicketTypeCode, dtt.TicketTypeName
, dpt.PlanTypeCode, dpt.PlanTypeName
, dstp.SeatTypeCode, dstp.SeatTypeName
, dss.SeatStatusCode, dss.SeatStatusName, dss.TM_dist_status
, dsc.SalesCode, dsc.SalesCodeName
, dpm.PromoCode, dpm.PromoName

, f.TM_order_num, f.TM_order_line_item, f.TM_order_line_item_seq
, f.QtySeat, f.QtySeatFSE, f.QtySeatRenewable
, f.RevenueTotal, f.RevenueTicket

--, f.BlockFullPrice, f.BlockPurchasePrice, f.PcTicket BlockPcTicket, f.PcTax BlockPcTax, f.PcLicenseFee BlockPcLicenseFee, f.PcOther1 BlockPcOther1, f.PcOther2 BlockPcOther2, f.BlockSurcharge
, f.PaidAmount, f.OwedAmount, f.PaidStatus
--, f.IsPremium, f.IsComp, f.IsHost, f.IsPlan, f.IsPartial, f.IsSingleEvent, f.IsGroup, f.IsBroker, f.IsRenewal, f.IsExpanded, f.IsAutoRenewalNextSeason

--, f.DiscountCode, f.SurchargeCode, f.PricingMethod, f.CompCode, f.CompName, f.GroupSalesName, f.GroupFlag, f.TicketType, f.TranType, f.SalesSource, f.RetailTicketType, f.RetailQualifiers
--, f.OtherInfo1, f.OtherInfo2, f.OtherInfo3, f.OtherInfo4, f.OtherInfo5, f.OtherInfo6, f.OtherInfo7, f.OtherInfo8, f.OtherInfo9, f.OtherInfo10

, f.FactTicketSalesId, f.DimDateId, f.DimTimeId, f.DimTicketCustomerId, f.DimArenaId, f.DimSeasonId, f.DimItemId, f.DimEventId, f.DimPlanId
, f.DimPriceCodeId, f.DimSeatId_Start, f.DimLedgerId, f.DimSeatStatusId, f.DimSalesCodeId, f.DimPromoId
, f.DimTicketTypeId, f.DimPlanTypeId, f.DimSeatTypeId, f.DimTicketClassId
--, f.DimCustomerIdSalesRep, f.DimCustomerId_TransSalesRep
--, f.TicketSeqId, f.SSID_event_id, f.SSID_section_id, f.SSID_row_id, f.SSID_seat_num, f.SSID_acct_id, f.SSID_price_code

--SELECT count(*)
FROM ro.vw_FactTicketSales f
INNER JOIN ro.vw_DimArena da ON f.DimArenaId = da.DimArenaId
INNER JOIN ro.vw_DimSeason ds ON f.DimSeasonId = ds.DimSeasonId
INNER JOIN ro.vw_DimItem di ON f.DimItemId = di.DimItemId
INNER JOIN ro.vw_DimEvent de ON f.DimEventId = de.DimEventId
INNER JOIN ro.vw_DimEventHeader deh ON de.DimEventHeaderId = deh.DimEventHeaderId
INNER JOIN ro.vw_DimSeasonHeader dsh ON deh.DimSeasonHeaderId = dsh.DimSeasonHeaderId
INNER JOIN ro.vw_DimPlan dpl ON f.DimPlanId = dpl.DimPlanId
INNER JOIN ro.vw_DimPriceCode dpc ON f.DimPriceCodeId = dpc.DimPriceCodeId
INNER JOIN ro.vw_DimTicketClass dtcl ON f.DimTicketClassId = dtcl.DimTicketClassId
INNER JOIN ro.vw_DimTicketType dtt ON f.DimTicketTypeId = dtt.DimTicketTypeId
INNER JOIN ro.vw_DimPlanType dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
INNER JOIN ro.vw_DimSeatType dstp ON f.DimSeatTypeId = dstp.DimSeatTypeId
INNER JOIN ro.vw_DimSeatStatus dss ON f.DimSeatStatusId = dss.DimSeatStatusId
INNER JOIN ro.vw_DimSalesCode dsc ON f.DimSalesCodeId = dsc.DimSalesCodeId
INNER JOIN ro.vw_DimPromo dpm ON f.DimPromoId = dpm.DimPromoID
INNER JOIN ro.vw_DimSeat dst ON f.DimSeatId_Start = dst.DimSeatId 
INNER JOIN ro.vw_DimTicketCustomer dtc ON f.DimTicketCustomerId = dtc.DimTicketCustomerId

--WHERE f.DimEventId = 171


)
GO
