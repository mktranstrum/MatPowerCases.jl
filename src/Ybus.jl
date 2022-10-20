function Ybus(mpc::Case)
    Y = spdiagm( (mpc.bus[:,5] + im * mpc.bus[:,6] ) ./ mpc.baseMVA )# baseMVA
    for i = 1:size(mpc.branch,1)
        f = Int(mpc.branch[i,1])
        t = Int(mpc.branch[i,2])
        yl = 1 / ( mpc.branch[i,3] + im * mpc.branch[i,4])
        bc = mpc.branch[i,5]
        tap = mpc.branch[i,9]
        shift = mpc.branch[i,10] * degtorad
        update_Y!(Y, f, t, yl, bc, tap, shift)
    end
    return Y
end

function update_Y!(Y, f, t, yl, bc, tap, shift)
    τ = tap > 0 ? tap : 1
    Y[f, f] += (yl + im*bc/2)/τ^2  # y / a^2 + im * b/2
    Y[t, t] += yl + im * bc/2
    Y[f, t] += - yl / (τ * exp(-im*shift))
    Y[t, f] += - yl / (τ * exp(im*shift))
    nothing
end

