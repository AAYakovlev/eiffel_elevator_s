note
	description : "Elevator application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature -- Fields

	tickrate: DOUBLE -- How many seconds between each simulation tick
	nanoseconds: INTEGER -- Nanoseconds in a second. 10^-9 seconds
	elevator: ELEVATOR -- the elevator object
	floors: INTEGER -- # of floors in the building
	tick_length: INTEGER


feature {NONE} -- Initialization

	make
			-- Run application.
		do
			nanoseconds := 1000000000
			io.put_string ("Preferred tick rate (seconds between execution steps)? ")
			tickrate := 1
			tick_length := tickrate.rounded
			io.put_string ("# of floors (minimum 6 for test purposes)? ")
			floors := 6
			create elevator.make (tickrate, floors)
			run
		end

feature -- procedures
	run
	local i: INTEGER
		do
			io.put_string ("The simulation will press the elevator's 6th floor destination button after 10 ticks of the elevator not being busy%N")
			io.put_string ("CTRL+C to stop!%N")
			i := 10
			from
			until false
			loop
				tick
				if not elevator.is_busy then
					i := i - 1
					if(i = 0) then
						i := 10
						elevator.press_destination (6)
					end
				end
			end
		end

	tick
		do
			elevator.tick
			sleep(tick_length * nanoseconds)
		end

feature -- functions

end
