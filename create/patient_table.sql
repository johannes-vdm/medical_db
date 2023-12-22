SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_table](
	[id] [int] NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[bed_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--create table [#temppatient_table] (
--[id] [int],
--[first_name] [varchar] (255) NULL,
--[last_name] [varchar] (255) NULL,
--[bed_number] [int] NULL);


insert [#temppatient_table] ([id],[first_name],[last_name],[bed_number])
select 1,'John','Doe',101 UNION ALL
select 2,'Jane','Smith',102;