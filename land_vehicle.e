note
	description: "Summary description for {LAND_VEHICLE}."
	date: "$Date$"
	revision: "$Revision$"

class
	LAND_VEHICLE

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
    		fuel_capacity := 20
    		fuel_unit_of_measure := "GALLON"
	    end

invariant
	assumed_level_elevation: elevation = 0

end
