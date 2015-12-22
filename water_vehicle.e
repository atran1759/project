note
	description: "Summary description for {LAND_VEHICLE}."
	date: "$Date$"
	revision: "$Revision$"

class
	WATER_VEHICLE

inherit
	VEHICLE
		redefine
  		    default_create
	    end

feature {NONE} -- Initialization

    default_create
      -- <Precursor>
   		do
   			Precursor
    		fuel_capacity := 20000
    		fuel_unit_of_measure := "GALLON"
    	ensure then
			elevation_zero: elevation = 0
   		end

invariant
	water_level_elevation: elevation <= 0

end



