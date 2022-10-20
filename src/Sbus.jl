function Sbus(mpc::Case)
    out = -(mpc.bus[:,3] + im * mpc.bus[:,4]) ./ mpc.baseMVA # - delivered power
    genbus = Int.(mpc.gen[:,1])
    out[genbus] += (mpc.gen[:,2] + im * mpc.gen[:,3]) ./  mpc.baseMVA # + generated power
    return out
end
