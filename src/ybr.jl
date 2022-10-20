function ybr(mpc::Case, i::Int)
    f = Int(mpc.branch[i,1])
    t = Int(mpc.branch[i,2])
    yl = 1 / ( mpc.branch[i,3] + im * mpc.branch[i,4])
    bc = mpc.branch[i,5]
    tap = mpc.branch[i,9]
    τ = tap > 0 ? tap : 1
    shift = mpc.branch[i,10] * degtorad
    yff = (yl + im*bc/2)/τ^2  # y / a^2 + im * b/2
    ytt = yl + im * bc/2
    yft = - yl / (τ * exp(-im*shift))
    ytf= - yl / (τ * exp(im*shift))
    return [yff yft;
            ytf ytt]
end
