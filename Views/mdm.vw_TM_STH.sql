SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE VIEW [mdm].[vw_TM_STH] AS
(
SELECT dc.dimcustomerid, STH, sthmd.MaxSTHPurchaseDate, mud.MaxUpdatedDate, 
			  Grp, dc.accountid, grpmd.MaxGRPPurchaseDate, sgl.Single, sglmd.MaxSGLPurchaseDate
FROM dbo.dimcustomer dc
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'STH' FROM dbo.FactTicketSales_V2 a
			JOIN dbo.DimCustomer d ON a.ETL__SSID_TM_acct_id = d.AccountId AND d.SourceSystem = 'TM'
			LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
			WHERE a.DimTicketTypeId IN (2)
		   ) sth ON dc.dimcustomerid = sth.dimcustomerid
LEFT JOIN (
			SELECT dimcustomerid, MAX(dd.CalDate) AS 'MaxSTHPurchaseDate' FROM dbo.FactTicketSales_V2 a
			JOIN dbo.DimCustomer d ON a.ETL__SSID_TM_acct_id = d.AccountId AND d.SourceSystem = 'TM'
			LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
			WHERE a.DimTicketTypeId IN (2)
			GROUP BY d.DimCustomerId
		   ) sthmd ON dc.dimcustomerid = sthmd.dimcustomerid
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'Grp' FROM dbo.FactTicketSales_V2 a
			JOIN dbo.DimCustomer d ON a.ETL__SSID_TM_acct_id = d.AccountId AND d.SourceSystem = 'TM'
			LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
			WHERE a.DimTicketTypeId IN (3,5)) grp ON dc.dimcustomerid = grp.dimcustomerid
LEFT JOIN (
			SELECT dimcustomerid, MAX(dd.CalDate) AS 'MaxGRPPurchaseDate' FROM dbo.FactTicketSales_V2 a
			JOIN dbo.DimCustomer d ON a.ETL__SSID_TM_acct_id = d.AccountId AND d.SourceSystem = 'TM'
			LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
			WHERE a.DimTicketTypeId IN (3,5)
			GROUP BY d.DimCustomerId
		   ) grpmd ON dc.dimcustomerid = grpmd.dimcustomerid
LEFT JOIN (
			SELECT dimcustomerid, MAX(dd.CalDate) AS 'MaxSGLPurchaseDate' FROM dbo.FactTicketSales_V2 a
			JOIN dbo.DimCustomer d ON a.ETL__SSID_TM_acct_id = d.AccountId AND d.SourceSystem = 'TM'
			LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
			WHERE a.DimTicketTypeId IN (4)
			GROUP BY d.DimCustomerId
		   ) sglmd ON dc.dimcustomerid = sglmd.dimcustomerid

LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'Single' FROM dbo.FactTicketSales_V2 a
			JOIN dbo.DimCustomer d ON a.ETL__SSID_TM_acct_id = d.AccountId AND d.SourceSystem = 'TM'
			LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
			WHERE a.DimTicketTypeId = 4) sgl ON dc.dimcustomerid = sgl.dimcustomerid
LEFT JOIN (
			SELECT dimcustomerid, MAX(a.UpdatedDate) AS 'MaxUpdatedDate' 
			FROM dbo.DimCustomer a
			GROUP BY a.DimCustomerId
		   ) mud ON dc.dimcustomerid = mud.dimcustomerid





)







GO
