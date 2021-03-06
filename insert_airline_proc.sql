USE [sd_airport_db]
GO
/****** Object:  StoredProcedure [dbo].[insert_airline]    Script Date: 21-07-2017 19:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insert_airline]
	@flight_num numeric(18,0),
	@pilot_id numeric(18,0),
	@airline_carrier varchar(50),
	@carry_on_bag_fee numeric(18,0),
	@terminal int

as
begin

	begin try
		begin tran
		
		declare @id int		
		exec sp_get_next_id 'Airline', @id output
		
		if(@id > 0)
		begin
			insert Airline
			(
				flight_num,
				pilot_id,
				airline_carrier,
				carry_on_bag_fee,
				terminal,
				id
			)
			select
				@flight_num,
				@pilot_id,
				@airline_carrier,
				@carry_on_bag_fee,
				@terminal,
				@id
		end
		print @flight_num
		print @pilot_id
		print @airline_carrier
		print @terminal
		print @carry_on_bag_fee
		commit
	end try
	begin catch
		declare @ErrorMessage varchar(200)
		select @ErrorMessage = 'value not found in table'
		RAISERROR (@ErrorMessage, 16, 1);
	end catch
end
