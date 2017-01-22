simion.workbench_program()

adjustable bx = -0.9--gauss
adjustable by = 0.3   -- gauss
adjustable bz = -0.5 -- gauss

adjustable step_size = 0.0001 


FIL="test11_01.csv"	
FileHnd, ErrStr = io.open(FIL, "w")

local e1=0
local e2=0
local e13=0
local e14=0

adjustable e3=3.5
adjustable e4=-2
adjustable e5=5


local e6=0
local e7=4
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
function segment.flym()


FileHnd:write("ion_time_of_flight","\t",
	"ion_px_mm ","\t","ion_py_mm ","\t","ion_pz_mm ","\t","bx","\t","by","\t","bz","\t","el3","\t","el4","\t","el5",
	"\t","ion_number","\t","ion_color","\n")

local file_read = io.open("a02.csv" )	
		if file_read then
	
	
    		for line in file_read:lines() do
			              i=0
						  mass={}
		    				for num in string.gmatch(line, "%S+") do
   							--	print(num)
							mass[i]=num
							i=i+1
							end
							bx= tonumber(mass[0])
							by= tonumber(mass[1])
							bz= tonumber(mass[2])
							e3= tonumber(mass[3])
							e4= tonumber(mass[4])
							e5= tonumber(mass[5])
							simion.run("--noprompt ")
				
    		end
	
	

		end
	
					
				
FileHnd:close()
end

function segment.terminate()
   FileHnd:write(ion_time_of_flight,"\t",
		ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",e3,"\t",e4,"\t",e5,
			"\t",ion_number,"\n")

    --print(ion_px_mm,ion_py_mm,ion_pz_mm,bx,ion_time_of_flight,e3,e4,e5,ion_number)

end

function segment.terminate_run()
	sim_trajectory_image_control = 1

end



function segment.tstep_adjust()
   ion_time_step = math.min(ion_time_step, step_size)

end
