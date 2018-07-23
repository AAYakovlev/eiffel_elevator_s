note
	description: "Summary description for {FLOOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FLOOR

create
	make

feature -- Initialization
	make(level_param: INTEGER)
		do
			level := level_param
		end

feature -- Attributes

	level: INTEGER
		-- ID of a floor.

	button_up: BUTTON

	button_down: BUTTON

end
