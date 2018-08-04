SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







/*****	Revision History

SJS on 2018-04-12:	added Formstack

DCH 2018-04-28	-	commented out executions of Customer_Pivot sprocs.

*****/


CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]
AS
BEGIN


EXEC [etl].[SubscriberMail_Tickets_Customer_Pivot_News]
EXEC [etl].[SubscriberMail_Tickets_Customer_Pivot]

-- TM
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[etl].[vw_Load_DimCustomer_TM]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- Turnkey
EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[etl].[vw_Load_DimCustomer_Turnkey]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- Data Uploader
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = 'api.UploadDimCustomerStaging', @LogLevel = '2', @DropTemp = '1', @IsDataUploaderSource = '1'

-- FormStack
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[etl].[vw_Load_DimCustomer_FormStack]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

-- FormStack Seasonticket Wait List Historical
--EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[[etl].[vw_Load_DimCustomer_FormStack_SeasonTicketWaitList]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

-- FormStack Last Minute Ticket Historical
--EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[etl].[vw_Load_DimCustomer_FormStack_LastMinuteTicketNotification]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

-- SubscriberMail Tickets feed
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[etl].[vw_Load_DimCustomer_Subscribermail_Tickets]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


-- SubscriberMail News feed
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = '[etl].[vw_Load_DimCustomer_Subscribermail_News]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


-- Fanatics
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Blackhawks', @LoadView = 'etl.vw_Load_DimCustomer_Fanatics', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


END;





















GO
