simion.workbench_program()


adjustable bx = 0.1--gauss
adjustable by = -0.1   -- gauss
adjustable bz = -0.3 -- gauss

adjustable step_size = 0.0001 



local e13=0
local e14=0

adjustable e5=1.4
adjustable e6=-2.2
adjustable e7=-4
adjustable e8=13



local e9=2.1
local e10=7
local e11=e10
adjustable e15=-5--sample


function segment.init_p_values()
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
	adj_elect05=e5
	adj_elect06=e6
	adj_elect07=e7
	adj_elect08=e8
	adj_elect09=e9
	adj_elect10=e10
	adj_elect11=e10
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


function segment.tstep_adjust()
   ion_time_step = math.min(ion_time_step, step_size)

end
