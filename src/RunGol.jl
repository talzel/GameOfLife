module RunGol

# https://discourse.julialang.org/t/is-the-a-function-that-essentially-does-foldr-but-witha-stopping-condition/36875/2


function runGol(init_gen::AbstractArray{Bool,2},generations::Int64)::AbstractArray{Bool,2}
    println("Generation 0:")
    display(init_gen)
    println()
    
    prev = init_gen
    for x in [1:1:generations;]
        println("Generation $(x):")
        new_generation = create_new_generation(prev)
        display(new_generation)
        println()
        prev = new_generation
    end
    return prev
end

function neighbours(p::CartesianIndex,vertical_dim::Int, horizonal_dim)
    neighbours = bool[]
    for y in [p[1] - 1, p[1], p[1] + 1]
        for x in [p[2] - 1, p[2], p[2] + 1]
            if 1 <= y <= vertical_dim && 1<= x <= horizonal_dim && p[1] != y && p[2] != x
                neighbours = [neighbours; CartesianIndex(y,x)]
            end
    return neighbours
        end
    end
end

function create_new_generation(current_generation::AbstractArray{Bool,2})::AbstractArray{Bool,2}
    next_generation = zeros(Bool,axes(current_generation))

    function vertical_border(i, limit,coordinate)
            if !(i[2] == limit ) #east update
                neighbours = [neighbours; current_generation[i + CartesianIndex(0,1)]] # east update
            end
        end 

    for i in CartesianIndices(current_generation)
        neighbours = Bool[]
        if !(i[2] == axes(current_generation,2).stop) #east update
            # println(i)
            # println(current_generation[i])
            neighbours = [neighbours; current_generation[i + CartesianIndex(0,1)]] # east update
        end

        if !(i[2] == 1) #no west update
            neighbours = [neighbours; current_generation[i + CartesianIndex(0,-1)]] # west update
        end

        if !(i[1] == 1) # no north update
            neighbours = [neighbours; current_generation[i + CartesianIndex(-1,0)]] # north update
            if !(i[2] == axes(current_generation,2).stop) # northeast update
                neighbours = [neighbours; current_generation[i + CartesianIndex(-1,1)]]
            end

            if !(i[2] == 1) # northwest update
                neighbours = [neighbours; current_generation[i + CartesianIndex(-1,-1)]]
            end
        end

        if !(i[1] == axes(current_generation,1).stop) # south check
            neighbours = [neighbours; current_generation[i + CartesianIndex(1,0)]] # south update
            if !(i[2] == axes(current_generation,2).stop) # south east update
                neighbours = [neighbours; current_generation[i + CartesianIndex(1,1)]]
            end

            if !(i[2] ==  1) # south west update
                neighbours = [neighbours; current_generation[i + CartesianIndex(1,-1)]]
            end
        end

        neighbours_count = length(neighbours[neighbours])
        
        # decide if index lives or dies next gen
        next_generation[i] = current_generation[i] ? neighbours_count in [2,3] : neighbours_count == 3
    end
    return next_generation
end

end