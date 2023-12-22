SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication_administration_table](
	[id] [int] NOT NULL,
	[administered_date_time] [datetime] NULL,
	[medication_schedule_times_id] [int] NULL,
	[administered_by_user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[medication_administration_table]  WITH CHECK ADD FOREIGN KEY([administered_by_user_id])
REFERENCES [dbo].[user_table] ([id])
GO
ALTER TABLE [dbo].[medication_administration_table]  WITH CHECK ADD FOREIGN KEY([medication_schedule_times_id])
REFERENCES [dbo].[medication_schedule_times_table] ([id])
GO

--create table [#tempmedication_administration] (
--[id] [int],
--[administered_date_time] [datetime] NULL,
--[medication_schedule_times_id] [int] NULL,
--[administered_by_user_id] [int] NULL);


insert [#tempmedication_administration] ([id],[administered_date_time],[medication_schedule_times_id],[administered_by_user_id])
select 1,'2024-11-10 08:30:00.000',1,2 UNION ALL
select 2,'2024-12-15 10:00:00.000',3,1;