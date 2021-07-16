
# https://discourse.julialang.org/t/is-the-a-function-that-essentially-does-foldr-but-witha-stopping-condition/36875/2


function runGol(init_gen,generations::Int64)
    # display(init_gen)
    # println(generations)
    # display(init_gen)
    println()
    for x in [1:1:generations;]
        println("Generation $(x):")
        new_generation = create_new_generation(init_gen)
        println()
        prev = new_generation
    end
    # sleep(5)
    # display(.!initial_configuration)
end


function create_new_generation(current_generation::Matrix{Bool})::Matrix{Bool}
    next_generation = zeros(Bool,axes(a)
    for i in CartesianIndices(current_generation)
        neighbours = Bool[]
        if i[1] == 0
            # no east update:
        else
            neighbours = [neighbours; a[i - CartesianIndex(0,1)]] # east update
        end

        if i[1] == axes(current_generation,1).stop
            #no west update
        else
            neighbours = [neighbours; a[i + CartesianIndex(0,1)]] # west update
        end

        if i[2] == 0
            # no north update
        else 
            neighbours = [neighbours; a[i + CartesianIndex(-1,0)]] # north update
            if i[1] == 0 # northeast update
                neighbours = [neighbours; a[i + CartesianIndex(-1,1)]]
            end

            if i[1] ==  axes(current_generation,1).stop # northwest update
                neighbours = [neighbours; a[i + CartesianIndex(-1,-1)]]
            end
        end

        if i[2] == axes(current_generation,2)
            #no south update
        else
            neighbours = [neighbours; a[i + CartesianIndex(1,0)]] # south update
            if i[1] == 0 # south east update
                neighbours = [neighbours; a[i + CartesianIndex(1,1)]]
            end

            if i[1] ==  axes(current_generation,1).stop # south west update
                neighbours = [neighbours; a[i + CartesianIndex(1,-1)]]
            end
        end

        neighbours_count = length(neighbours[neighbours])

        
        // decide if index lives or dies next gen
        next_generation[i] = current_generation[i] ? neighbours_count in [2,3] : current_generation[i]
    end
    return next_generation
end

# function count_neighbours(i::CartesianIndex,population::Matrix{bool})::Int
#     west_neighbour = population[CartesianIndex(i[0] - 1,i[1])]
#     northwest_neighbour = population[CartesianIndex(i[0] - 1,i[1] - 1)]
#     southwest_neighbour = population[CartesianIndex(i[0] - 1,i[1] + 1)]
#     north_neighbour = population[CartesianIndex(i[0],i[1] - 1)]
#     northeast_neighbour = population[CartesianIndex(i[0] + 1,i[1] - 1)]
#     east_neighbour = population[CartesianIndex(i[0] + 1,i[1])]
#     southeast_neighbour = population[CartesianIndex(i[0] + 1,i[1] + 1)]
#     south_neighbour = population[CartesianIndex(i[0],i[1] + 1)]

#     living_neighbours = filter(identity,[west_neighbour,
#         northwest_neighbour,
#         southwest_neighbour,
#         north_neighbour,
#         northeast_neighbour,
#         east_neighbour,
#         southeast_neighbour,
#         south_neighbour])
#     return length(living_neighbours)
# end