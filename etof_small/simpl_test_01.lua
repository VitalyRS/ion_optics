simion.workbench_program()

adjustable bx = -0.9--gauss
adjustable by = 0.3   -- gauss
adjustable bz = -0.5 -- gauss

adjustable step_size = 0.0001 



local e1=0
local e2=0
local e13=0
local e14=0

adjustable e3=3.5
adjustable e4=-2
adjustable e5=5


local e6=-1
local e7=20
local e8=2
local e9=2.1
local e10=7
local e11=e10
adjustable e15=-5--sample


function segment.init_p_values()
	adj_elect01=e1
	adj_elect02=e2
	adj_elect03=e3
	adj_elect04=e4
	adj_elect05=e5
	adj_elect06=e6
	adj_elect07=e7
	adj_elect08=e8
	adj_elect09=e9
	adj_elect10=e10
	adj_elect11=e11
	adj_elect13=e13
	adj_elect14=e14
	adj_elect15=e15

		
end		

function segment.fast_adjust()

	adj_elect01=e1
	adj_elect02=e2
	adj_elect03=e3
	adj_elect04=e4
	adj_elect05=e5
	adj_elect06=e6
	adj_elect07=e7
	adj_elect08=e8
	adj_elect09=e9
	adj_elect10=e10
	adj_elect11=e11
	adj_elect13=e13
	adj_elect14=e14
	adj_elect15=e15
		
end



function segment.mfield_adjust()
	
		ion_bfieldx_gu = bx
		ion_bfieldy_gu = by
		ion_bfieldz_gu = bz
	
end

function segment.other_actions()
	
	
end

-- Called by SIMION on Fly'm.



function segment.tstep_adjust()
   ion_time_step = math.min(ion_time_step, step_size)

end
