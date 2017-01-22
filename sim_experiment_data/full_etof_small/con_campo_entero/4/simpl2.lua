simion.workbench_program()

adjustable bx = -0.9--gauss
adjustable by = 0.3   -- gauss
adjustable bz = -0.5 -- gauss

adjustable step_size = 0.0001 


FIL="test09.csv"	
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
	
	if  ((math.abs(ion_py_mm)>5) or (math.abs(ion_pz_mm)>5)) and (ion_px_mm<35)  then
		--print (ion_time_of_flight,"\t",
		--ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
		--	"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		print('i am here 1st')
		
		
	end
	
	if  (ion_px_mm>=70)  then
		
		--print(ion_time_of_flight,"\t",
		--ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
		--	"\t",ion_number,"\t",ion_color,"\n")
		FileHnd:write(ion_time_of_flight,"\t",
		ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",e3,"\t",e4,"\t",e5,
			"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		print('i am here 2d')
	end
end


function segment.terminate_run()
    sim_trajectory_image_control = 1
	print "erer"
end
-- Called by SIMION on Fly'm.
function segment.flym()


FileHnd:write("ion_time_of_flight","\t",
	"ion_px_mm ","\t","ion_py_mm ","\t","ion_pz_mm ","\t","bx","\t","by","\t","bz","\t","el3","\t","el4","\t","el5",
	"\t","ion_number","\t","ion_color","\n")

	
	
	step1=0.2
	step2=1
	for bx1=-0.2,0.2,step1 do
		--by=bx
		for by1=-0.2,0.2,step1 do
			for bz1=-0.2,0.2,step1 do
				
				for e3a=-5,5,step2 do
					for e4a=-5,5,step2 do
						for e5a=-5,5,step2 do
						
						
						--simion.command("fly --restore-potentials=0   simpl.iob")
							--simion.redraw_screen()
							--	simion.run("--noprompt ")
				bx=bx1
				by=by1
				bz=bz1
				e3=e3a
				e4=e4a
				e5=e5a
							
						--simion.run("--nogui --quiet ")
						simion.run("--noprompt ")
                        --sleep(1)
			
						end
					end
				end
			end
		end
	end
	--for a=1,3,1 do
	--	bx=a*10
	--	simion.redraw_screen()
	--	simion.run("--noprompt ")
		--simion.run("--nogui --quiet ")
	--end
FileHnd:close()
end

function segment.tstep_adjust()
   ion_time_step = math.min(ion_time_step, step_size)

end
