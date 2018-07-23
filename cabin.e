note
	description: "Summary description for {CABIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CABIN

create
	make

feature -- Initialization
	make (init_floor: FLOOR; init_elevator: ELEVATOR)
	require
		floor_not_null: init_floor/=VOID
		elevator_not_null: init_elevator/=VOID
	do
		current_floor := init_floor
		is_moving := false
		is_doors_open := true
		elevator := init_elevator
    ensure
	    floor_set: current_floor = init_floor
	    not_moving: is_moving = false
	    opened: is_doors_open = true
	    elevator_set: elevator = init_elevator
    end

feature -- Attributes

	elevator: ELEVATOR
			-- 	elevator which is seen since elevator created

	current_floor: FLOOR
			-- 	current floor of a cabin.

	is_moving: BOOLEAN
			-- 	state of a cabin.

	is_doors_open: BOOLEAN
			-- 	state of a doors.

	buttons: ARRAY[BUTTON]

feature
	move(target: FLOOR)
		require
			target_not_void: target /= VOID
			cur_floor_not_void: current_floor /= VOID
		local
			i: INTEGER
		do
			if target.level > current_floor.level then
				from
					i := current_floor.level
				until
					i < target.level
				loop
				 	move_up
				 	i:=i+1
				end
			else
				from
					i := current_floor.level
				until
					i >  target.level
				loop
				 	move_down
				 	i:=i-1
				end
			end
		end

	move_up
		require
			elevator.floors.count = 6
			current_floor.level > 1
			current_floor.level < 6
		do
			current_floor := elevator.floors[current_floor.level+1]
		end

	move_down
		require
			elevator.floors.count = 6
			current_floor.level > 2
			current_floor.level < 7
		do
			current_floor := elevator.floors[current_floor.level-1]
		end

	open_doors
		require
			not_moving: is_moving = false
			is_closed: is_doors_open = false
			modify_model ("is_doors_open", Current)
		do
			is_doors_open := true
		ensure
			opened: is_doors_open = true
		end

	close_doors
		require
			not_moving: is_moving = false
			is_closed: is_doors_open = true
			modify_model ("is_doors_open", Current)
		do
			is_doors_open := false
		ensure
			opened: is_doors_open = false
	    end

	get_position: INTEGER
		require
			C1: current_floor /= VOID
		do
			Result := current_floor.level
		end

	get_state: BOOLEAN
		do
			Result := is_moving
		end
end
