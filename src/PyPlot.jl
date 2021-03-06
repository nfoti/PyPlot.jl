#!/usr/bin/env julia
# File: Pyplot.jl
# Author: Junfeng Li <li424@mcmaster.ca>
# Description: module's main file

module PyPlot

# get src location
PYPLOT_JL_HOME = Pkg.dir("PyPlot", "src")

# relative include
include("aux.jl")
include("parse.jl")
include("funcs.jl")
include("wrap.jl")
include("alias.jl")

# start
start_daemon()
start_socket()

# release resources when exit
atexit(PyPlot.stop_daemon)
atexit(PyPlot.stop_socket)

# turn off interactive when julia is not interactive
if !isinteractive()
    ioff()
end

end # end module
