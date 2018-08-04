CREATE TABLE [mdm].[ToBeDeleted]
(
[dimcustomerid] [int] NULL,
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sourcesystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ssb_crmsystem_contact_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contactguid] [uniqueidentifier] NULL,
[fullname] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailprimary] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[data_deletion_request_TS] [datetime] NULL
)
GO
CREATE CLUSTERED INDEX [ix_delete] ON [mdm].[ToBeDeleted] ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_delete2] ON [mdm].[ToBeDeleted] ([ssb_crmsystem_contact_id])
GO
