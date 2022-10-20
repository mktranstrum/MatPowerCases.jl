function nonzeroshunts(mpc::Case)
    bus_number = Int.(mpc.bus[:,1])
    ysh = (mpc.bus[:,5] + im * mpc.bus[:,6]) / mpc.baseMVA

    inds = abs.(ysh) .> 0
    return bus_number[inds], ysh[inds]
end
