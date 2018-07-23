note
	description: "Summary description for {ELEVATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEVATOR


	create
		make

	feature -- Attributes
		cabin: CABIN
		floor_count: INTEGER
		floor_buttons: ARRAY[BUTTON]

	feature -- Initialization
		make(floor_init: INTEGER)
			local
				b: BUTTON
				i: INTEGER
			do
				floor_count := floor_init
				create floor_buttons.make_empty
				create cabin.make ()

				from
					i := 0
    			until
     				i >= floor_count
    			loop
     				create b.make(Current, i)
     				floor_buttons.force(b, i)
     				i := i + 1

    			end

			end

	feature
		get_buttons: ARRAY[BUTTON]
			do
			  Result := floor_buttons
			end

	feature
		summon(floor_number: INTEGER)
			do
				cabin.move(floor_number)
			end
end
