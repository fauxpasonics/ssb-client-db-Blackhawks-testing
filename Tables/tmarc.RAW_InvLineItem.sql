CREATE TABLE [tmarc].[RAW_InvLineItem]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_line_item_seq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[purchase_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gross_invoice_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[invoice_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[required_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[opt_out] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[opt_out_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[opt_out_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc_RAW_InvLineItem] ON [tmarc].[RAW_InvLineItem]
GO
CREATE NONCLUSTERED INDEX [IX_ETL__Source] ON [tmarc].[RAW_InvLineItem] ([ETL__Source])
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [tmarc].[RAW_InvLineItem] ([invoice_id], [order_num], [order_line_item], [order_line_item_seq])
GO