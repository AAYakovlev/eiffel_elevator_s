note
	description : "Elevator application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	elevator: ELEVATOR
	make
		do

			print("%N_________Test completed___________%N");
		end

end
