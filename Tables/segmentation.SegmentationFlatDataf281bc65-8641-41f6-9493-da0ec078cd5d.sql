CREATE TABLE [segmentation].[SegmentationFlatDataf281bc65-8641-41f6-9493-da0ec078cd5d]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerSourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatDataf281bc65-8641-41f6-9493-da0ec078cd5d] ADD CONSTRAINT [pk_SegmentationFlatDataf281bc65-8641-41f6-9493-da0ec078cd5d] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDataf281bc65-8641-41f6-9493-da0ec078cd5d] ON [segmentation].[SegmentationFlatDataf281bc65-8641-41f6-9493-da0ec078cd5d] ([_rn])
GO
