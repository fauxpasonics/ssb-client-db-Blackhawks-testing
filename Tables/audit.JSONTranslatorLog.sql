CREATE TABLE [audit].[JSONTranslatorLog]
(
[AsOf] [datetime] NOT NULL CONSTRAINT [DF__JSONTransl__AsOf__2711A93B] DEFAULT (dateadd(hour,(-7),getdate())),
[SourceTable] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [audit].[JSONTranslatorLog] ADD CONSTRAINT [PK__JSONTran__02FDDA6DC6B2F3F2] PRIMARY KEY CLUSTERED  ([AsOf])
GO
