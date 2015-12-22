note
	description: "Summary description for {LAND_VEHICLE}."
	date: "$Date$"
	revision: "$Revision$"

class
	SPACE_VEHICLE

inherit
	VEHICLE

create
	make, make_shuttle

feature {NONE} -- Initialization

   make_shuttle
		-- Create Current.
   		do
   			make (200, 2000000, "GALLON")
   		end

invariant
	min_level_elevation: elevation >= 200

end




