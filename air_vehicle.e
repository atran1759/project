note
	description: "Summary description for {LAND_VEHICLE}."
	date: "$Date$"
	revision: "$Revision$"

class
	AIR_VEHICLE

inherit
	VEHICLE

create
	make, make_airplane


feature {NONE} -- Initialization

   make_airplane
		-- Create Current.
   		do
   			make (0, 300000,"GALLON")
   		end

invariant
	min_level_elevation: elevation >= 0

end



