SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

------------------------------------------------------------------------------- 
-- Author name: Scott Sales
-- Created date: 20180613
-- Purpose: materializing this engaged list to be used in segmentation and pushed to Azure
-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- 01/01/0000: developer full name 
-- Change notes: 
-- Peer reviewed by: Reviewed by Kaitlyn
-- Peer review notes: proc runs with out issue within 15 seconds
-- Peer review date: 2018-06-13
-- Deployed by: 
-- Deployment date: 
-- Deployment notes: 
------------------------------------------------------------------------------- 
------------------------------------------------------------------------------- 

CREATE PROCEDURE [etl].[Subscribermail_Total_Engaged]
AS
IF EXISTS
(
    SELECT *
    FROM sys.tables
    WHERE name = 'Subscribermail_Total_Engaged'
          AND type = 'U'
)
    DROP TABLE ods.Subscribermail_Total_Engaged;



--------------------------------------------------------
--            Tickets            --
--------------------------------------------------------
--49738 
SELECT DISTINCT
       o.RecipientId,
       s.Email
INTO #opens
FROM [ods].[subscribermail_customer_Data] s
    JOIN [ods].[SubscriberMail_Opens] o
        ON o.RecipientId = s.RecipientData_id
WHERE CAST(o.Open_Time AS DATE) > (GETDATE() - 730)
GROUP BY RecipientId,
         s.Email
HAVING COUNT(*) > 4
UNION
SELECT DISTINCT
       o.RecipientId,
       s.Email
FROM [ods].[subscribermail_customer_Data] s
    JOIN [ods].[SubscriberMail_Opens] o
        ON o.RecipientId = s.RecipientData_id
WHERE o.Open_Time > GETDATE() - 14;






--29750
SELECT DISTINCT
       c.RecipientId,
       s.Email
INTO #clicks
FROM [ods].[SubscriberMail_Clicks] c
    JOIN [ods].[subscribermail_customer_Data] s
        ON c.RecipientId = s.RecipientData_id
WHERE CAST(c.Click_Time AS DATE) > GETDATE() - 730
GROUP BY c.RecipientId,
         s.Email
HAVING COUNT(*) > 1
UNION
SELECT DISTINCT
       c.RecipientId,
       s.Email
FROM [ods].[SubscriberMail_Clicks] c
    JOIN [ods].[subscribermail_customer_Data] s
        ON c.RecipientId = s.RecipientData_id
WHERE c.Click_Time > GETDATE() - 14;

--50873
SELECT DISTINCT
       RecipientId,
       x.Email
INTO #TicketEngaged
FROM
(SELECT * FROM #clicks UNION SELECT * FROM #opens) x;


--------------------------------------------------------
--            News            --
--------------------------------------------------------
--43773 
SELECT DISTINCT
       o.RecipientId,
       s.email
INTO #newsopens
FROM [ods].[subscribermail_customer_Data_news] s
    JOIN [ods].[SubscriberMail_News_Opens] o
        ON o.RecipientId = s.RecipientData_id
WHERE CAST(o.Open_Time AS DATE) > GETDATE() - 730
GROUP BY o.RecipientId,
         s.email
HAVING COUNT(*) > 4
UNION
SELECT DISTINCT
       o.RecipientId,
       s.email
FROM [ods].[subscribermail_customer_Data_news] s
    JOIN [ods].[SubscriberMail_News_Opens] o
        ON o.RecipientId = s.RecipientData_id
WHERE o.Open_Time >= GETDATE() - 14;



--18278
SELECT DISTINCT
       c.RecipientId,
       s.email
INTO #newsclicks
FROM [ods].[SubscriberMail_News_Clicks] c
    JOIN [ods].[subscribermail_customer_Data_news] s
        ON c.RecipientId = s.RecipientData_id
WHERE CAST(c.Click_Time AS DATE) > GETDATE() - 730
GROUP BY c.RecipientId,
         s.email
HAVING COUNT(*) > 1
UNION
SELECT DISTINCT
       c.RecipientId,
       s.email
FROM [ods].[SubscriberMail_News_Clicks] c
    JOIN [ods].[subscribermail_customer_Data_news] s
        ON c.RecipientId = s.RecipientData_id
WHERE c.Click_Time >= GETDATE() - 14;



--45592
SELECT DISTINCT
       RecipientId,
       x.email
INTO #NewsEngaged
FROM
(SELECT * FROM #newsclicks UNION SELECT * FROM #newsopens) x;

--------------------------------------------------------
--            Total          --
--------------------------------------------------------


--Total Engaged 96465
SELECT DISTINCT
       RecipientId,
       Email
--INTO #tmp
INTO ods.Subscribermail_Total_Engaged
FROM
(SELECT * FROM #TicketEngaged UNION SELECT * FROM #NewsEngaged) x;

GO
