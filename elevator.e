note
	description: "Summary description for {ELEVATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: cabin, floor_count, floor_buttons

class
	ELEVATOR


	create
		make

	feature -- Attributes
		cabin: CABIN
		floor_count: INTEGER
		floor_buttons: SIMPLE_ARRAY[BUTTON]

	feature -- Initialization
		make(floor_init: INTEGER)
			require
				floor_init >= 0
			local
				b: BUTTON
				i: INTEGER
			do
				floor_count := floor_init
				create floor_buttons.make(floor_init)
				create cabin.make ()

				from
					i := 1
				invariant
					in_bounds: i>0 and i<=floor_count
					floor_buttons.is_wrapped
    			until
     				i >= floor_count
    			loop
     				b := create {BUTTON}.make(Current, i)
     				floor_buttons.force(b, i)
     				i := i + 1

    			end

			end

	feature
		get_buttons: SIMPLE_ARRAY[BUTTON]
			do
			  Result := floor_buttons
			end

	feature
		summon(floor_number: INTEGER)
			note
				explicit: wrapping
			require
				cabin_not_void: cabin /= VOID
				cabin_is_wrapped: cabin.is_wrapped
				mod_f: modify_field("cabin", Current)
				mod_m: modify_model("current_floor", cabin)
			do
				cabin.move(floor_number)
			end

	invariant
		owns = [cabin, floor_buttons]
end
