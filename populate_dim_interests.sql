USE [sd_airport_datamart]
GO
/****** Object:  StoredProcedure [dbo].[populate_dim_interest]    Script Date: 28-07-2017 21:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[populate_dim_interest]
as
begin
	dbcc checkident('dimInterests', reseed, 0)

	delete from dimInterests

	insert dimInterests
	(
		interest_name
	)

	select
		distinct hobby
	from
		sd_report_database.dbo.Customer
end