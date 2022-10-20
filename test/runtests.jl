using MatPowerCases
using Test

mpc = loadcase("pglib_opf_case14_ieee.mat")
nonzeroshunts(mpc)
for i = 1:nbranches(mpc)
    ybr(mpc, i)
    Y_line(mpc, i)
end
nbuses(mpc)
ngenerators(mpc)
nbranches(mpc)
bus_types(mpc)
Vbus(mpc)
Sbus(mpc)
