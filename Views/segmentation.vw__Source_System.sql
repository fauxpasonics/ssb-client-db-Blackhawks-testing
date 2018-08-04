SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

------------------------------------------------------------------------------- 
-- Author name: Scott Sales
-- Created date: 2018-05-20
-- Purpose: Deploy standard source system segmentation view to Blackhawks portal
-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- 01/01/0000: developer full name 
-- Change notes: A comprehensive description of the changes. The description may use as 
-- many lines as needed. 
-- Peer reviewed by: Standard - no peer review necessary
-- Peer review notes: Standard - no peer review necessary
-- Peer review date: 2018-05-20
-- Deployed by: 
-- Deployment date: 
-- Deployment notes: 
------------------------------------------------------------------------------- 
------------------------------------------------------------------------------- 

CREATE VIEW  [segmentation].[vw__Source_System]
AS 

SELECT
	  dc.SSB_CRMSYSTEM_CONTACT_ID
	, dc.SourceSystem AS 'CustomerSourceSystem'
FROM	[dbo].[vwDimCustomer_ModAcctId] AS dc
WHERE	dc.SourceSystem NOT IN ('TM')

--excluding SourceSystems that they would not use for SourceSystem use cases to reduce count AMEITIN 11/16/2017

GO
