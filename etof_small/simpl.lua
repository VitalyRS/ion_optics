simion.workbench_program()
adjustable bx = 1000   -- gauss
adjustable by = 0     -- gauss
adjustable bz = 0     -- gauss
function segment.mfield_adjust()
ion_bfieldx_gu = bx
ion_bfieldy_gu = by
ion_bfieldz_gu = bz
end
