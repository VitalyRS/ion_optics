simion.workbench_program()

adjustable bx = -0.9--gauss
adjustable by = 0    -- gauss
adjustable bz = -0.3 -- gauss


local electrode1=0
local electrode2=0
local electrode13=0
local electrode14=0

local electrode3=0
local electrode4=0
local electrode5=0


local electrode6=electrode5
local electrode7=2.1
local electrode8=3
local electrode9=2.1
local electrode10=7
local electrode11=electrode10
local electrode15=-5--sample


function segment.init_p_values()
	adj_elect01=electrode1
	adj_elect02=electrode2
	adj_elect03=electrode3
	adj_elect04=electrode4
	adj_elect05=electrode5
	adj_elect06=electrode6
	adj_elect07=electrode7
	adj_elect08=electrode8
	adj_elect09=electrode9
	adj_elect10=electrode10
	adj_elect11=electrode11
	adj_elect13=electrode13
	adj_elect14=electrode14
	adj_elect15=electrode15

		
end		

function segment.fast_adjust()

	adj_elect01=electrode1
	adj_elect02=electrode2
	adj_elect03=electrode3
	adj_elect04=electrode4
	adj_elect05=electrode5
	adj_elect06=electrode6
	adj_elect07=electrode7
	adj_elect08=electrode8
	adj_elect09=electrode9
	adj_elect10=electrode10
	adj_elect11=electrode11
	adj_elect13=electrode13
	adj_elect14=electrode14
	adj_elect15=electrode15
		
end



function segment.mfield_adjust()
	
		ion_bfieldx_gu = bx
		ion_bfieldy_gu = by
		ion_bfieldz_gu = bz
	
end

function segment.other_actions()
	
end


function segment.terminate_run()
    
end
-- Called by SIMION on Fly'm.
function segment.flym()
simion.run("--nogui --quiet ")

end

