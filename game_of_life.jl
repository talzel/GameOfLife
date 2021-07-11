
# https://discourse.julialang.org/t/is-the-a-function-that-essentially-does-foldr-but-witha-stopping-condition/36875/2


function runGol(init_gen,generations::Int64)
    # display(init_gen)
    # println(generations)
    display(init_gen)
    for x in [1:1:generations;]
        println("Generation $(x):")
        new_generation = create_new_generation(init_gen)
        println()
        prev = new_generation
    end
    # sleep(5)
    # display(.!initial_configuration)
end


function create_new_generation(population::Matrix{Bool})::Matrix{Bool}
    for i in CartesianIndices(population)
        
    end
end

function count_neighbours(i::CartesianIndex,population::Matrix{bool})::Int
    west_neighbour = population[CartesianIndex(i[0] - 1,i[1])]
    northwest_neighbour = population[CartesianIndex(i[0] - 1,i[1] - 1)]
    southwest_neighbour = population[CartesianIndex(i[0] - 1,i[1] + 1)]
    north_neighbour = population[CartesianIndex(i[0],i[1] - 1)]
    northeast_neighbour = population[CartesianIndex(i[0] + 1,i[1] - 1)]
    east_neighbour = population[CartesianIndex(i[0] + 1,i[1])]
    southeast_neighbour = population[CartesianIndex(i[0] + 1,i[1] + 1)]
    south_neighbour = population[CartesianIndex(i[0],i[1] + 1)]

    living_neighbours= filter(identity,[west_neighbour,
        northwest_neighbour,
        southwest_neighbour,
        north_neighbour,
        northeast_neighbour,
        east_neighbour,
        southeast_neighbour,
        south_neighbour])
end