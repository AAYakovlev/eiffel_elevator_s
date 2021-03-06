note
	description: "Summary description for {CABIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: current_floor, is_doors_open

class
	CABIN

create
	make

feature -- Attributes
	current_floor: INTEGER
	is_doors_open : BOOLEAN

feature -- Initialization
	make
	do
		current_floor := 0
		is_doors_open := false
    end

feature
	move(floor_number: INTEGER)
		require
			modify_model("current_floor", Current)
		local
			i: INTEGER
		do
			current_floor := floor_number
		end
	get_current_floor: INTEGER
		require
			C1: current_floor > 0
		do
			Result := current_floor
		end

	open_doors
		require
			is_closed: is_doors_open = false
		do
			is_doors_open := true
		ensure
			opened: is_doors_open
		end

	close_doors
		require
			is_open: is_doors_open
		do
			is_doors_open := false
		ensure
			closed: is_doors_open = false
	    end


end
