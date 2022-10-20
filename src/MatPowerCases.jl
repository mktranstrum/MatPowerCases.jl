module MatPowerCases

export Case, loadcase, nonzeroshunts, ybr, nbuses, ngenerators, nbranches, bus_types, Vbus, Sbus, Ybus, Y_line

using SparseArrays
using MAT: matread

const degtorad = π/180
const radtodeg = 180/π

include("case.jl")
include("loadcase.jl")

nbuses(mpc::Case) = size(mpc.bus,1)
ngenerators(mpc::Case) = size(mpc.gen,1)
nbranches(mpc::Case) = size(mpc.branch,1)
bus_types(mpc::Case) = mpc.bus[:,2] .|> Int

include("Vbus.jl")
include("Sbus.jl")
include("Ybus.jl")
include("Y_line.jl")
include("nonzeroshunts.jl")
include("ybr.jl")

end # module
