
# https://discourse.julialang.org/t/is-the-a-function-that-essentially-does-foldr-but-witha-stopping-condition/36875/2


function runGol(init_gen,generations::Int64)
    # display(init_gen)
    # println(generations)
    # display(init_gen)
    println()
    for x in [1:1:generations;]
        println("Generation $(x):")
        new_generation = create_new_generation(init_gen)
        println(new_generation)
        prev = new_generation
    end
    # sleep(5)
    # display(.!initial_configuration)
end


function create_new_generation(current_generation::Matrix{Bool})::Matrix{Bool}
    next_generation = zeros(Bool,axes(current_generation))
    for i in CartesianIndices(current_generation)
        println("current index")
        println(i)
        neighbours = Bool[]
        if i[2] == axes(current_generation,2).stop
            # no east update:
        else
            println("check east")
            println(i)
            neighbours = [neighbours; current_generation[i + CartesianIndex(0,1)]] # east update
        end

        if i[2] == 1
            #no west update
        else
            println("check west")
            println(i)
            neighbours = [neighbours; current_generation[i + CartesianIndex(0,-1)]] # west update
        end

        if i[1] == 1
            # no north update
        else 
            println("check north")
            println(i)
            neighbours = [neighbours; current_generation[i + CartesianIndex(-1,0)]] # north update
            if !(i[2] == axes(current_generation,2).stop) # northeast update
                println("check north east")
                println(i)
                neighbours = [neighbours; current_generation[i + CartesianIndex(-1,1)]]
            end

            if !(i[2] == 1) # northwest update
                println("check north west")
                println(i)
                neighbours = [neighbours; current_generation[i + CartesianIndex(-1,-1)]]
            end
        end

        if !(i[1] == axes(current_generation,1).stop) # south check
            println("check south")
            println(i)
            # println(axes(current_generation,1))
            neighbours = [neighbours; current_generation[i + CartesianIndex(1,0)]] # south update
            if !(i[2] == axes(current_generation,2).stop) # south east update
                println("check south east")
                println(axes(current_generation,2).stop)
                println("$(i) -> $(i + CartesianIndex(1,1))")
                neighbours = [neighbours; current_generation[i + CartesianIndex(1,1)]]
            end

            if !(i[2] ==  1) # south west update
                println("check south west")
                println("$(i) -> $(i + CartesianIndex(1,1))")
                neighbours = [neighbours; current_generation[i + CartesianIndex(1,-1)]]
            end
        end

        neighbours_count = length(neighbours[neighbours])

        
        # decide if index lives or dies next gen
        next_generation[i] = current_generation[i] ? neighbours_count in [2,3] : neighbours_count == 3
    end
    return next_generation
end
