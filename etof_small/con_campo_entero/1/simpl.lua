simion.workbench_program()

adjustable bx = _G.bx   -- gauss
adjustable by = _G.by     -- gauss
adjustable bz = _G.bz     -- gauss


local electrode1=0
local electrode2=0
local electrode13=0
local electrode14=0

local electrode3=_G.electrode3
local electrode4=_G.electrode4
local electrode5=_G.electrode5


local electrode6=electrode5
local electrode7=2.1
local electrode8=3
local electrode9=2.1
local electrode10=7
local electrode11=electrode10
local electrode15=-5 -- sample

--main_folder=_G.frun.."\\"
--FIL=main_folder.."test.dat"

--FIL="test.dat"
--FileHnd, ErrStr = io.open(FIL, "w")
--FileHnd:write("ion_time_of_flight","\t",
--	"ion_px_mm ","\t","ion_py_mm ","\t","ion_pz_mm ","\t","bx","\t","by","\t","bz","\t","el3","\t","el4","\t","el5","\n")

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
	--if ion_px_mm<16 then
		ion_bfieldx_gu = bx
		ion_bfieldy_gu = by
		ion_bfieldz_gu = bz
	--else
		
		--ion_bfieldx_gu = 0
		--ion_bfieldy_gu = 0
		--ion_bfieldz_gu = 0
	--end
end

function segment.other_actions()
	if  ((math.abs(ion_py_mm)>5) or (math.abs(ion_pz_mm)>5)) and (ion_px_mm<35)  then
		_G.Hnd:write(ion_time_of_flight,"\t",
		ion_px_mm ,"\t",ion_py_mm ,"\t",ion_pz_mm ,"\t",bx,"\t",by,"\t",bz,"\t",electrode3,"\t",electrode4,"\t",electrode5,
			"\t",ion_number,"\t",ion_color,"\n")
		ion_splat=-2
		print('i am here 1st')
		
	end
	
	if  (ion_px_mm>=93)  then
		
		_G.Hnd:write(ion_time_of_flight,"\t",
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

