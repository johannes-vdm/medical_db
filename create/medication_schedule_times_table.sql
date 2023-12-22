SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication_schedule_times_table](
	[id] [int] NOT NULL,
	[medication_schedule_id] [int] NULL,
	[time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[medication_schedule_times_table]  WITH CHECK ADD FOREIGN KEY([medication_schedule_id])
REFERENCES [dbo].[medication_schedule_table] ([id])
GO

--create table [#tempmedication_schedule_times_table] (
--[id] [int],
--[medication_schedule_id] [int] NULL,
--[time] [time] NULL);


insert [#tempmedication_schedule_times_table] ([id],[medication_schedule_id],[time])
select 1,1,'08:00:00' UNION ALL
select 2,1,'12:00:00' UNION ALL
select 3,2,'09:30:00';