simion.workbench_program()

adjustable bx = -0.9--gauss
adjustable by = 0    -- gauss
adjustable bz = -0.3 -- gauss

adjustable step_size = 0.000001 

local e1=0
local e2=0
local e13=0
local e14=0

adjustable e3=3
adjustable e4=4
adjustable e5=5


local e6=e5
local e7=2.1
local e8=3
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
	
	if  ((math.abs(ion_py_mm)>5) or (math.abs(ion_pz_mm)>5)) and (ion_px_mm<35)  then
		print (ion_time_of_flight,"\t",
		ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
			"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		print('i am here 1st')
		
	end
	
	if  (ion_px_mm>=93)  then
		
		print(ion_time_of_flight,"\t",
		ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
			"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		
		print('i am here 2d')
	end
end


function segment.terminate_run()
    
end
-- Called by SIMION on Fly'm.
function segment.flym()
simion.run("--nogui --quiet ")

end
function segment.tstep_adjust()
   ion_time_step = math.min(ion_time_step, step_size)

end
