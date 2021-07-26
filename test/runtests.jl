using GameOfLife
using Test 

@test [1, 2] + [2, 1] == [3, 3]
@test GameOfLife.run([false false false false
                      false true true false
                      false true false false
                      false false false false]::Matrix{Bool},1) == [false false false false
                                                                    false true true false
                                                                    false true true false
                                                                    false false false false]::Matrix{Bool} #AbstractArray