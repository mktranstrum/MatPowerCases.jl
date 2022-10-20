function loadcase(filename, key="mpc")
    @show filename
    mpc = matread(filename)[key]
    # TODO: Filter out inactive elements?
    return Case(mpc["baseMVA"],
                mpc["bus"],
                mpc["gen"],
                mpc["branch"])
end
