note
	description: "Summary description for {BUTTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BUTTON

create
	make

feature -- Initialization
	make (init_elevator: ELEVATOR)
		require
			init_elevator /= VOID
		do
			elevator := init_elevator
		ensure
			elevator /= VOID
		end

feature -- Attributes

	elevator: ELEVATOR

feature
	summon(floor: FLOOR)
	require
		floor_not_void: floor /= VOID
		elevator_not_void: elevator /= VOID
		cabin_not_void: elevator.cabin /= VOID
		doors_closed: elevator.closed
	local
		cab: CABIN
	do
		cab := elevator.get_cabin()
	end

end
