CREATE TABLE [tmarc].[RAW_PaySchedulePayment]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[due_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percent_due] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc_RAW_PaySchedulePayment] ON [tmarc].[RAW_PaySchedulePayment]
GO
CREATE NONCLUSTERED INDEX [IX_ETL__Source] ON [tmarc].[RAW_PaySchedulePayment] ([ETL__Source])
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [tmarc].[RAW_PaySchedulePayment] ([payment_schedule_id], [payment_number])
GO
