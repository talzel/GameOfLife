module GameOfLife
include("RunGol.jl")


greet() = print("Hello World!")
run(generation_0, generations) = RunGol.runGol(generation_0,generations)
# runFromFile(fp) = x = readdlm(fp)
# end # module
end