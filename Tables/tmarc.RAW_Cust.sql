CREATE TABLE [tmarc].[RAW_Cust]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[relationship_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primary_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rec_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_type_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[salutation] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[company_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_first] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_mi] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_title] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_day] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_eve] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_fax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_rep_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[priority] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[points] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[points_ytd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[points_itd] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[birth_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[since_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[old_acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[household_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fan_loyalty_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ext_system1_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ext_system2_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_9] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_10] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pin] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gender] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_phone_day] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_phone_eve] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_phone_fax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[marital_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sic_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sic_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[industry] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_cell] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_phone_cell] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_addr2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source_list_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[maiden_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_11] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_12] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_13] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_14] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_15] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_16] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_17] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_18] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_19] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_20] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pk_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[account_manager_access] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[admin_invoice] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[admin_event_info] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[admin_rofr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[admin_donation] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[admin_other] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[account_nick_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[main_acct_id_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_codes] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_tmarc_RAW_Cust] ON [tmarc].[RAW_Cust]
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [tmarc].[RAW_Cust] ([acct_id], [cust_name_id])
GO
CREATE NONCLUSTERED INDEX [IX_ETL__Source] ON [tmarc].[RAW_Cust] ([ETL__Source])
GO