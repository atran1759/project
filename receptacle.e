note
	description: "Summary description for {RECEPTACLE}."
	date: "$Date$"
	revision: "$Revision$"

class
	RECEPTACLE

inherit
	RANDOM_HELPER
		redefine
			default_create
		end
create
	default_create,
	make_with_dimensions

feature --{EQA_TEST_SET} -- Initialization

	default_create
			-- <Precursor> --What is this?
		do
			Precursor
			create identifier.make_empty
			create random_sequence.make
		end

	make_with_dimensions (a_identifier: STRING; a_height: like measurement_anchor; a_width: like measurement_anchor; a_depth: like measurement_anchor  )
			-- Make Current with `a_identifier', `a_height', `a_width', and `a_depth'
	do
		create random_sequence.make
		--default_create
		identifier := a_identifier
		height := a_height
		width := a_width
		depth := a_depth
	ensure
		identifier_set: identifier.same_string (a_identifier)
		height_set: height = a_height
		width_set: width = a_width
		depth_set: depth = a_depth
	end

feature -- Access


	identifier: STRING
		-- What is `identifier' of Current {RECEPTACLE}

	height, width, depth: like measurement_anchor
		-- What is the `height', `width', and `depth' of Current {RECEPTACLE}

	cubic_units: like measurement_anchor
		-- How many `cubic_units' is Current {RECEPTACLE}
  		do
   			Result := height * width * depth
  		ensure
   			cubic_units_correct: Result = height * width * depth
  		end

  	square_units: like measurement_anchor
  		-- How many `square_unit' is Current {RECEPTACLE}  		
  		do
   			Result := width * depth
  		ensure
   			square_units_correct: Result = width * depth
  		end

  	content: ARRAYED_LIST [RECEPTACLE]
  			-- `content' of Current {RECEPTACLE}.
  		attribute
  			create Result.make (0)
  		end

  	manifest: STRING
  		do
  			create Result.make_empty
  		end

feature -- Basic Operations

	add_content (a_content: RECEPTACLE; a_max_number_box: INTEGER)
			-- `add_content' `a_content' to `content' of Current {RECEPTACLE}.
		require
			has_room: a_content.cubic_units <= remaining_cubic_units (a_max_number_box) and
						a_content.square_units <= remaining_square_units(a_max_number_box)
		do
			content.force (a_content)
		ensure
			not_overfilled: remaining_cubic_units (a_max_number_box) >= 0 and remaining_square_units(a_max_number_box) >= 0
		end

	remaining_cubic_units (max_number_box: INTEGER): like measurement_anchor
		-- Given `content', what is the remaining `cubic_units' of Current {RECEPTACLE}
		local
			l_content_units: like measurement_anchor
		do
			across
				content as ic_content
			invariant
				l_content_units >= 0
			--variant -- no need because we are not manipulating the pointer.	
			loop
				l_content_units := l_content_units + ic_content.item.cubic_units
			end
			Result := cubic_units - l_content_units
		end

	remaining_square_units (max_number_box: INTEGER): like measurement_anchor
		-- Given `content', what is the `remaining_square_units' of Current {RECEPTACLE}
		local
			l_content_units: like measurement_anchor
			i, v : INTEGER
		do
			v := max_number_box
			from i := 1;
			invariant l_content_units <= square_units
			until i > content.count
			loop
				l_content_units := l_content_units + content [i].square_units
				i := i + 1
				v := v - 1
			variant v
			end
			Result := square_units - l_content_units
		ensure
			non_negative: Result >= 0
		end

	random_content (a_max_number_box: INTEGER)
		-- Random `content' of Current {RECEPTACLE}
		local
			l_content_receptacle: RECEPTACLE
			i: INTEGER
		do
			initialize
			create l_content_receptacle
			print ("Current Receptacle cubic unit: " + cubic_units.out + "%N")
			print ("Current Receptacle square unit: " + square_units.out + "%N")
			print ("Random content of Current Receptacle: ")
			l_content_receptacle.make_with_dimensions("Box",random_integer_in_range (10 |..| 20),
									   random_integer_in_range (5 |..| 15),
								       random_integer_in_range (1 |..| 10))
			from i := 1;
			invariant l_content_receptacle.cubic_units <= Current.remaining_cubic_units (a_max_number_box) and
						l_content_receptacle.square_units <= Current.remaining_square_units (a_max_number_box)
			until i > a_max_number_box
				-- Fill Current {RECEPTACLE} with max n receptacles
			loop
				add_content (l_content_receptacle,a_max_number_box )
				print ("%N")
				print ("Box " + i.out + " height: " + l_content_receptacle.height.out + ", width: "
						+ l_content_receptacle.width.out
						+ ", depth: " + l_content_receptacle.depth.out + "%N")
				print ("l_content_receptacle.cubic_units " + l_content_receptacle.cubic_units.out + "%N")
				print ("remaining_cubic_units " + Current.remaining_cubic_units(a_max_number_box).out + "%N")
				print ("l_content_receptacle.square_units " + l_content_receptacle.remaining_square_units(a_max_number_box).out + "%N")
                l_content_receptacle.make_with_dimensions("Box",random_integer_in_range (11 |..| 20),
									   random_integer_in_range (6 |..| 15),
								       random_integer_in_range (2 |..| 10))
				i := i + 1
			end

		end

feature {NONE} -- Implementation: Anchors

	measurement_anchor: INTEGER_64
		-- Type anchor for all `measurement_anchor'

invariant
	acceptable_cubic: (height * width * depth) >= 0
	acceptable_area: (width * depth) >= 0

end



