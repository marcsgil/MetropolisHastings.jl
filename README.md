# MetropolisHastings.jl

A simple implementation of the Metropolis-Hastings algorithm.

The module contains only the `metropolisHastings` function, which has the signatures:

### `metropolisHastings(f,N::Int)`

Sample `N` points from a univariate probability distribution proportional to `f`.

`f` must have the signature `f(x::Number)`.

### `metropolisHastings(f,N::Int,d::Int)`

Sample N points from a multivariate probability distribution proportional to f.

`f` must have the signature `f(x::Vector)` where `x` has length `d`.
