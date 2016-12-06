

"""
Add `val` to an ArrayContainer. Returns true if `value` was not already
present.
"""
@inline function add!{T<:Integer}(arr::ArrayContainer, val::T)
    inpoint = searchsorted(arr.arr, val)
    return isempty(inpoint) ? (splice!(arr.arr, inpoint, val); true) : false
end

"""
Add a number of values to an `ArrayContainer`.
"""
@inline function add!{T<:Integer}(arr::ArrayContainer, vals::AbstractVector{T})
    for val in vals
        add!(arr, val)
    end
end

"""
    append!(arr::ArrayContainer, pos::UInt16)

Append `val` to the `ArrayContainer` `arr`, this assumes that the value being
appended is larger than any value currently in the container.
"""
@inline function append!{T<:Integer}(container::ArrayContainer, val::T)
    push!(container.arr, val)
end

"Remove `val` from an ArrayContainer. Returns true if `val` was present."
@inline function remove!{T<:Integer}(arr::ArrayContainer, val::T)
    rempoint = searchsorted(arr.arr, val)
    return isempty(rempoint) ? false : (deleteat!(arr.arr, rempoint); true)
end

"Clear all values from an ArrayContainer"
@inline function clear!(container::ArrayContainer)
    container.arr = Vector{UInt16}()
end
