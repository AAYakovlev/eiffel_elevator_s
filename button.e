note
	description: "Summary description for {BUTTON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BUTTON

create
	make

feature -- Attributes
	elevator: ELEVATOR
	floor_number: INTEGER

feature -- Initialization
	make (elevator_init: ELEVATOR; floor_init: INTEGER)

		do
			elevator := elevator_init
			floor_number := floor_init
		end

feature
	press
	require
		elevator /= VOID
		floor_number > 0
		floor_number < 7
		elevator.cabin /= VOID
		elevator.cabin.is_wrapped
		elevator.is_wrapped
	do
		elevator.summon(floor_number)
	end

feature
	get_floor: INTEGER
	do
		Result := floor_number
	end

end
