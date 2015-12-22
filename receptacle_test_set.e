note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	RECEPTACLE_TEST_SET

inherit
	EQA_TEST_SET

	EQA_COMMONLY_USED_ASSERTIONS
		rename
			assert as common_assert
		undefine
			default_create
		end

feature -- Test routines

	test_RECEPTACLE_creation
			-- New test routine
		note
					testing: "covers/{RECEPTACLE}.make_with_dimensions",
							"covers/{RECEPTACLE}.default_create"
		local
			l_receptacle: RECEPTACLE
		do
			create l_receptacle
			l_receptacle.make_with_dimensions ("Car trunk", l_receptacle.random_integer_in_range (30 |..| 40),
			 										l_receptacle.random_integer_in_range (40 |..| 70), l_receptacle.random_integer_in_range (40 |..| 70))
		end

	test_add_content (a_max_number_box: INTEGER)
		note
					testing: "covers/{RECEPTACLE}.add_content",
							"covers/{RECEPTACLE}.remaining_cubic_units",
							"covers/{RECEPTACLE}.remaining_square_units"

		local
			l_receptacle: RECEPTACLE
			l_nested_receptacle_1: RECEPTACLE
			l_nested_receptacle_2: RECEPTACLE
		do
			create l_receptacle
			create l_receptacle.make_with_dimensions ("Car trunk", l_receptacle.random_integer_in_range (40 |..| 50),
													  l_receptacle.random_integer_in_range (50 |..| 60),
			 										  l_receptacle.random_integer_in_range (60 |..| 70))
			create l_nested_receptacle_1.make_with_dimensions ("Box 1", 20, 30, 35)
			create l_nested_receptacle_2.make_with_dimensions ("Box 2", 15, 15, 15)
			l_receptacle.add_content (l_nested_receptacle_1, a_max_number_box)
			l_receptacle.add_content (l_nested_receptacle_2, a_max_number_box)
		end

	test_random_content

		local
			l_receptacle: RECEPTACLE
		do
			create l_receptacle
			create l_receptacle.make_with_dimensions("Box", l_receptacle.random_integer_in_range (5 |..| 10),
			 										l_receptacle.random_integer_in_range (15 |..| 20),
			 										l_receptacle.random_integer_in_range (20 |..| 25))
			l_receptacle.random_content (10)
		end

end


