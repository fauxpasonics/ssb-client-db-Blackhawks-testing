CREATE TABLE [segmentation].[SegmentationFlatDatab138a2f3-ce6a-46c1-877d-669782ed1a55]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FAN_ID] [bigint] NOT NULL,
[NAME_FIRST] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME_LAST] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REGION_FT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POSTCODE1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IN_MARKET_IND] [bit] NULL,
[DIRECT_MAIL_ELIGIBLE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEX_FT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TELNR_MOBILE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TELNR_LONG] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LANGUAGE_FT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IN_MARKET] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATA_SOURCE_NM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATE_SEASON] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FAVORITE_TEAM_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FAVORITE_TEAM_CODE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NHL_COUNTRY_ISO] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHOP_LAST_PURCHASE_DATE] [date] NULL,
[SHOP_TOTAL_REVENUE] [decimal] (14, 2) NULL,
[SHOP_TOTAL_ORDERS] [int] NULL,
[LAST_EMAIL_OPEN_DATE] [date] NULL,
[LAST_EMAIL_CLICK_DATE] [date] NULL,
[LAST_ACTIVITY_DATE] [date] NULL,
[GCL_TOTAL_REVENUE] [decimal] (14, 2) NULL,
[GCL_TOTAL_ORDERS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GCL_LAST_VIEW_DATE] [date] NULL,
[GCL_LAST_PURCHASE_DATE] [date] NULL,
[DEVICE_TYPE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLATFORM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_SOURCE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHOP_RECENCY_CODE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHOP_FREQUENCY_CODE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHOP_MONETARY_CODE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatDatab138a2f3-ce6a-46c1-877d-669782ed1a55] ADD CONSTRAINT [pk_SegmentationFlatDatab138a2f3-ce6a-46c1-877d-669782ed1a55] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatab138a2f3-ce6a-46c1-877d-669782ed1a55] ON [segmentation].[SegmentationFlatDatab138a2f3-ce6a-46c1-877d-669782ed1a55] ([_rn])
GO
