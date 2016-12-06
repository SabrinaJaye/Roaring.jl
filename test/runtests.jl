module TestRoaring

using Base.Test

using Roaring

@testset "Containers" begin

    @testset "ArrayContainer" begin

        # Construction.
        @test Roaring.cardinality(Roaring.ArrayContainer()) == 0
        @test Roaring.cardinality(Roaring.ArrayContainer()) == Roaring.cardinality(Roaring.ArrayContainer())
        @test isempty(Roaring.ArrayContainer())

        # Adding integers to the container.


    end

end

end # module
