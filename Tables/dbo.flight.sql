SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flight] (
		[flight_num_]         [numeric](18, 0) NOT NULL,
		[pilot_id]            [numeric](18, 0) NULL,
		[airline_carrier]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[year]                [numeric](18, 0) NULL,
		CONSTRAINT [PK_flight]
		PRIMARY KEY
		CLUSTERED
		([flight_num_])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flight]
	WITH CHECK
	ADD CONSTRAINT [FK_flight_Airline]
	FOREIGN KEY ([airline_carrier], [flight_num_]) REFERENCES [dbo].[Airline] ([airline_carrier], [flight_num])
ALTER TABLE [dbo].[Flight]
	CHECK CONSTRAINT [FK_flight_Airline]

GO
ALTER TABLE [dbo].[Flight] SET (LOCK_ESCALATION = TABLE)
GO