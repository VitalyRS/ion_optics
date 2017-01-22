simion.workbench_program()

FIL="test_bxbybze5e6.csv"	
FileHnd, ErrStr = io.open(FIL, "w")

adjustable bx = 0.3--gauss
adjustable by = 0.3   -- gauss
adjustable bz = -0.6 -- gauss

adjustable step_size = 0.0001 



local e13=0
local e14=0

adjustable e5=2
adjustable e6=2
adjustable e7=-4
adjustable e8=13



local e7=4
local e8=2
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
		
	if  ((math.abs(ion_py_mm)>15) or (math.abs(ion_pz_mm)>15)) and (ion_px_mm<35)  then
		--print (ion_time_of_flight,"\t",
		--ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
		--	"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		print('i am here 1st')
		
		
	end
	
	if  (ion_px_mm>=60)  then
		
		--print(ion_time_of_flight,"\t",
		--ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
		--	"\t",ion_number,"\t",ion_color,"\n")
		FileHnd:write(ion_time_of_flight,"\t",
		ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",e5,"\t",e6,
			"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		print('i am here 2d')
	end

end
-- Called by SIMION on Fly'm.
function segment.flym()


FileHnd:write("ion_time_of_flight","\t",
	"ion_px_mm ","\t","ion_py_mm ","\t","ion_pz_mm ","\t"
	,"bx","\t","by","\t","bz","\t","el5","\t","el6","\t"
	,"ion_number","\t","ion_color","\n")

	
	
	step1=0.2
	step2=1.0
	for bx1=-0.9,0.9,step1 do
		--by=bx
		for by1=-0.9,0.9,step1 do
			for bz1=-0.9,0.9,step1 do
				
				for e6a=-15,15,step2 do
					for e5a=-15,15,step2 do
						
				bx=bx1
				by=by1
				bz=bz1
				e5=e5a
				e6=e6a
				
							
						
						simion.run("--noprompt ")
					end
				end
			end
		end
	end
FileHnd:close()
	
end

function segment.terminate_run()
    sim_trajectory_image_control = 1
	print "erer"
end

function segment.tstep_adjust()
   ion_time_step = math.min(ion_time_step, step_size)

end
