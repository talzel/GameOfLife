
# using Distributed
# using ProgressMeter
# using Genie
using JSON
using DelimitedFiles

function main()
    fp_config_file_path = first(ARGS)
    initial_configuration = get_configuration(fp_config_file_path)
    display(initial_configuration)
    println()
    sleep(5)
    display(.!initial_configuration)
end

function get_configuration(fp::String)::Matrix{Bool}
    x = readdlm(fp)
    return .!(iszero.(x))
end

# maybe helpful with better display:
# https://discourse.julialang.org/t/update-variable-in-logged-message-without-printing-a-new-line/32755

main()