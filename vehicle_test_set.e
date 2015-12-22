note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	VEHICLE_TEST_SET

inherit
	EQA_TEST_SET

	EQA_COMMONLY_USED_ASSERTIONS
		rename
			assert as common_assert
		undefine
			default_create
		end

feature -- Test routines

	test_vehicle_creation
			-- Test creation of {VEHICLE}.
		note
			testing: "covers/{VEHICLE}.make"

		local
			l_space_vehicle: SPACE_VEHICLE
			l_air_vehicle: AIR_VEHICLE
			l_land_vehicle: LAND_VEHICLE
			l_water_vehicle: WATER_VEHICLE

		do
			create l_space_vehicle.make_shuttle

			create l_air_vehicle.make_airplane

			create l_land_vehicle.default_create

			create l_water_vehicle.default_create

		end

	test_vehicle_fuel_features
			-- Test of {VEHICLE} fuel features.
		note
			testing:"covers/{VEHICLE}.add_fuel",
					"covers/{VEHICLE}.drain_fuel",
					"covers/{VEHICLE}.consume_fuel",
					"covers/{VEHICLE}.fuel_capacity",
					"covers/{VEHICLE}.fuel_level"
		local
			l_space_vehicle: SPACE_VEHICLE
			l_air_vehicle:AIR_VEHICLE
			l_land_vehicle: LAND_VEHICLE
			l_water_vehicle: WATER_VEHICLE
		do
			create l_space_vehicle.make_shuttle
			assert_integers_equal ("fuel_capacity_2000000", 2000000, l_space_vehicle.fuel_capacity)
			assert_integers_equal ("fuel_zero", 0, l_space_vehicle.fuel_level)
			l_space_vehicle.add_fuel (1500000)
			l_space_vehicle.consume_fuel (1000000)
			l_space_vehicle.add_fuel (900000)
			assert_integers_equal ("sanity_check_fuel_level", 1400000, l_space_vehicle.fuel_level)
			l_space_vehicle.drain_fuel

			create l_air_vehicle.make_airplane
			assert_integers_equal ("fuel_capacity_300000", 300000, l_air_vehicle.fuel_capacity)
			assert_integers_equal ("fuel_zero", 0, l_air_vehicle.fuel_level)
			l_air_vehicle.add_fuel (250000)
			l_air_vehicle.consume_fuel (50000)
			l_air_vehicle.add_fuel (30000)
			assert_integers_equal ("sanity_check_fuel_level", 230000, l_air_vehicle.fuel_level)
			l_air_vehicle.drain_fuel

			create l_land_vehicle.default_create
			assert_integers_equal ("fuel_capacity_20", 20, l_land_vehicle.fuel_capacity)
			assert_integers_equal ("fuel_zero", 0, l_land_vehicle.fuel_level)
			l_land_vehicle.add_fuel (16)
			l_land_vehicle.consume_fuel (10)
			l_land_vehicle.add_fuel (2)
			assert_integers_equal ("sanity_check_fuel_level", 8, l_land_vehicle.fuel_level)
			l_land_vehicle.drain_fuel

			create l_water_vehicle.default_create
			assert_integers_equal ("fuel_capacity_20000", 20000, l_water_vehicle.fuel_capacity)
			assert_integers_equal ("fuel_zero", 0, l_water_vehicle.fuel_level)
			l_water_vehicle.add_fuel (10000)
			l_water_vehicle.consume_fuel (5000)
			l_water_vehicle.add_fuel (12000)
			assert_integers_equal ("sanity_check_fuel_level", 17000, l_water_vehicle.fuel_level)
			l_water_vehicle.drain_fuel
		end

end





