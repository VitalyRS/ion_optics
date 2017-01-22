
local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end




_G.frun="test04.csv"
_G.electrode3=0 --   - electrode 3 voltge
_G.electrode4=0 --   - electrode 4 voltge
_G.electrode5=0 --   - electrode 5 voltge
_G.bx=0 --   - magnetic field bx in gauss
_G.by=0 --   - magnetic field by in gauss
_G.bz=0 --   - magnetic field bz in gauss
FIL=_G.frun
FileHnd, ErrStr = io.open(FIL, "w")
FileHnd:write("ion_time_of_flight","\t",
	"ion_px_mm ","\t","ion_py_mm ","\t","ion_pz_mm ","\t","bx","\t","by","\t","bz","\t","el3","\t","el4","\t","el5","\n")

--main_dir="mkdir ".._G.frun
--os.execute( main_dir)

--cop1="copy pr3.fly2 ".._G.frun.."\\pr3.fly2"
--cop2="copy pr3.lua ".._G.frun.."\\pr3.lua"
--cop3="copy tune.lua ".._G.frun.."\\tune.lua"
--os.execute(cop1)
--os.execute(cop2)
--os.execute(cop3)
_G.Hnd=FileHnd

step1=0.3
step2=1
for bx=-0.9,0.9,step1 do
	for by=-0.9	,0.9,step1 do
		for bz=-0.9,0.9,step1 do
			for el3=0,4,step2 do
				for el4=0,4,step2 do
					for el5=0,5,step2 do
						
						_G.electrode3=el3 --   - electrode 3 voltge
						_G.electrode4=el4 --   - electrode 4 voltge
						_G.electrode5=el5 --   - electrode 5 voltge
						_G.bx=bx --   - magnetic field bx in gauss
						_G.by=by --   - magnetic field by in gauss
						_G.bz=bz --   - magnetic field bz in gauss

						simion.command("fly --restore-potentials=0   simpl.iob")
						--#simion.run("--noprompt ")
                        --sleep(1)
			
					end
				end
			end
		end
	end
end
	
FileHnd:close()

