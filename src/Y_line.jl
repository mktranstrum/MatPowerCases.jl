function Y_line(mpc::Case, i::Int)
    Y = spdiagm( (mpc.bus[:,5] + im * mpc.bus[:,6] ) ./ mpc.baseMVA ) 
    f = Int(mpc.branch[i,1])
    t = Int(mpc.branch[i,2])
    yl = 1 / ( mpc.branch[i,3] + im * mpc.branch[i,4])
    bc = mpc.branch[i,5]
    tap = mpc.branch[i,9]
    shift = mpc.branch[i,10] * π/180
    update_Y!(Y, f, t, yl, bc, tap, shift)
    return Y
end
