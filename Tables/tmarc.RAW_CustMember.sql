CREATE TABLE [tmarc].[RAW_CustMember]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[membership_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[membership_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[membership_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[trans_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc_RAW_CustMember] ON [tmarc].[RAW_CustMember]
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [tmarc].[RAW_CustMember] ([acct_id], [membership_id], [trans_type])
GO
CREATE NONCLUSTERED INDEX [IX_ETL__Source] ON [tmarc].[RAW_CustMember] ([ETL__Source])
GO
