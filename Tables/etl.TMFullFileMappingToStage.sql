CREATE TABLE [etl].[TMFullFileMappingToStage]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[File] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StageTable] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [etl].[TMFullFileMappingToStage] ADD CONSTRAINT [PK__TMFullFi__C4EA24454E4B77D9] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
