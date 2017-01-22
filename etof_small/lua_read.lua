--file ="a01.csv" 
local file = io.open("a02.csv" )
i=0
if file then
	
	
    	for line in file:lines() do
		  a = {}    -- new array
				print("--2-------")
				 print (line)
			      if i==0 then
					j=0
        				for num in string.gmatch(line, "%S+") do
   							
							i=1
							a[j] = num
							j=j+1
						end
						for i=0,5,1 do
							print (a[i])
						end
				else
				break
				end
				
    	end
	
	

end
	