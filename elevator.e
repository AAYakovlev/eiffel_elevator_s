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
		floors: ARRAY[FLOOR]

	feature -- Initialization
		make(floor_count: INTEGER)
			local
				i: INTEGER
				f:FLOOR
			do
				create floors.make_empty
				from
					i := 0
				until
					i >= floor_count
				loop
					create f.make(i)
				 	floors.force(f, i)
				 	i:=i+1
				end
				create cabin.make (floors[0], Current)
			end

	feature
		get_cabin: CABIN
			require
	        	cabin_present: cabin/=VOID
			do
				Result := cabin
					-- for now we have one-cabine implementation
			end

end
