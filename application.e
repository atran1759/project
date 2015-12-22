note
	description : "project application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			l_receptacle: RECEPTACLE
		do
			create l_receptacle
			create l_receptacle.make_with_dimensions("Box", l_receptacle.random_integer_in_range (5 |..| 10),
					 										l_receptacle.random_integer_in_range (15 |..| 20),
					 										l_receptacle.random_integer_in_range (20 |..| 25))
			l_receptacle.random_content (30)
		end

end
