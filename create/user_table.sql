SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_table](
	[id] [int] NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[role] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--create table [#tempuser_table] (
--[id] [int],
--[first_name] [varchar] (255) NULL,
--[last_name] [varchar] (255) NULL,
--[role] [varchar] (255) NULL);


insert [#tempuser_table] ([id],[first_name],[last_name],[role])
select 1,'Admin','Admin','Administrator' UNION ALL
select 2,'Annelie','Smith','Nurse';