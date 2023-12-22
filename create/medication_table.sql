SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication_table](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--create table [#tempmedication_table] (
--[id] [int],
--[name] [varchar] (255) NULL);


insert [#tempmedication_table] ([id],[name])
select 1,'Medication A' UNION ALL
select 2,'Medication B';