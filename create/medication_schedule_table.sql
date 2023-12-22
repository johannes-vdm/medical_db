SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication_schedule_table](
	[id] [int] NOT NULL,
	[patient_id] [int] NULL,
	[medication_id] [int] NULL,
	[dosage] [varchar](255) NULL,
	[instructions] [varchar](255) NULL,
	[ends_at] [date] NULL,
	[indefinite] [bit] NULL,
	[alternative] [nvarchar](max) NULL,
	[starts_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[medication_schedule_table] ADD  DEFAULT ((0)) FOR [indefinite]
GO
ALTER TABLE [dbo].[medication_schedule_table]  WITH CHECK ADD FOREIGN KEY([medication_id])
REFERENCES [dbo].[medication_table] ([id])
GO
ALTER TABLE [dbo].[medication_schedule_table]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient_table] ([id])
GO



--create table [#tempmedication_schedule_table] (
--[id] [int],
--[patient_id] [int] NULL,
--[medication_id] [int] NULL,
--[dosage] [varchar] (255) NULL,
--[instructions] [varchar] (255) NULL,
--[ends_at] [date] NULL,
--[indefinite] [bit] NULL,
--[alternative] [nvarchar] (max) NULL,
--[starts_at] [date] NULL);


insert [#tempmedication_schedule_table] ([id],[patient_id],[medication_id],[dosage],[instructions],[ends_at],[indefinite],[alternative],[starts_at])
select 1,1,1,'10mg','Take with water','2024-11-10',0,NULL,'2023-01-01' UNION ALL
select 2,2,2,'5mg','Take before meals','2024-12-15',1,N'{"alternative_info": "Some alternative information"}','2023-01-01';