note
	description: "Summary description for {VEHICLE}."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VEHICLE

inherit
	RECEPTACLE

feature -- Initialization

	make (a_elevation: like elevation; a_fuel_capacity: like fuel_value_anchor; a_fuel_unit_of_measure: like fuel_unit_of_measure)--how to put default value of "GALLON"
			-- Make Current with `a_elevation', `a_fuel_capacity', `a_fuel_unit_of_measure'
       do
       		create identifier.make_empty
       		elevation := a_elevation
       		--set_elevation (a_elevation)
       		fuel_capacity := a_fuel_capacity
       		--set_fuel_capacity (a_fuel_capacity)
       		fuel_unit_of_measure := a_fuel_unit_of_measure
       		--set_fuel_unit_of_measure (a_fuel_unit_of_measure)
       end

feature -- Access

	fuel_level: like fuel_value_anchor
			-- Fuel_level of Current

	fuel_capacity: like fuel_value_anchor
			-- Fuel_capacity of Current	

	fuel_unit_of_measure: STRING
			-- Fuel_unit_of_measure of Current

	elevation: like elevation_level_anchor
		    -- Elevation measured in feet from sea level, which is presumed to be zero.


feature -- Basic Operations

	add_fuel (a_amount: like fuel_value_anchor)
			-- Fill `fuel_level' with `a_amount'.	
		require
		    positive_amount_filled : a_amount > 0
		    not_over_filled : a_amount <= (fuel_capacity - fuel_level) --OR (fuel_level + a_amount) <= fuel_capacity
		do
			fuel_level := fuel_level + a_amount
		ensure
			fuel_added: fuel_level = (old fuel_level + a_amount)--.min(fuel_capacity)
		end

	consume_fuel (a_amount: like fuel_value_anchor)
    		-- Consume `a_amount' of `fuel_level' down to 0.
    	require
    		reasonable_consumed_amount :  a_amount > 0 and a_amount <=  fuel_level
		do
			fuel_level := fuel_level - a_amount
		ensure
			fuel_consumed: fuel_level = (old fuel_level - a_amount)
		end

	drain_fuel
   		 	-- Drain `fuel_level' to zero.
		do
			fuel_level := 0
		ensure
			zero: fuel_level = 0
		end


feature {NONE} -- Implementation: Anchors

	fuel_value_anchor: INTEGER
			-- Type anchor for all `fuel_value_anchor'

	elevation_level_anchor: INTEGER
			-- Type anchor for all `elevation_level'

invariant
	at_or_less_capacity: fuel_level <= fuel_capacity
	positive_level: fuel_level >= 0
	positive_capacity: fuel_capacity > 0

end




