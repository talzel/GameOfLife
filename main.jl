using Base: Bool, String

using JSON
using DelimitedFiles
include("game_of_life.jl")


function main()
    fp_config_file_path = first(ARGS)
    generations = parse(Int64,ARGS[2])

    initial_configuration = get_configuration(fp_config_file_path)
    
    runGol(initial_configuration, generations)
end

function get_configuration(fp::String)::Matrix{Bool}
    x = readdlm(fp)
    return .!(iszero.(x))
end

# maybe helpful with better display:
# https://discourse.julialang.org/t/update-variable-in-logged-message-without-printing-a-new-line/32755



main()