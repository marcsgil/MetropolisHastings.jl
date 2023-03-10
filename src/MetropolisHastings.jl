module MetropolisHastings

export metropolisHastings

"""
    metropolisHastings(f,N)

Sample N points from a univariate probability distribution proportional to f.

f must have the signature f(x), where x is a number.
"""
function metropolisHastings(f,N)
    samples = Vector{Float64}(undef,N)

    samples[1] = randn()

    for n in 2:length(samples)
        x₀ = samples[n-1]
        x = randn() + x₀

        if f(x)/f(x₀) ≥ rand()
            samples[n] = x
        else
            samples[n] = x₀
        end
    end
    
    samples
end

"""
    metropolisHastings(f,N,d)

Sample N points from a multivariate probability distribution proportional to f.

f must have the signature f(x) where x in a vector of size d.
"""
function metropolisHastings(f,N,d)
    samples = Array{Float64}(undef,d,N)

    samples[:,1] = randn(d)

    for n in 2:size(samples,2)
        x₀ = view(samples,:,n-1)
        x = randn(d) .+ x₀

        if f(x)/f(x₀) ≥ rand()
            samples[:,n] = x
        else
            samples[:,n] = x₀
        end
    end
    
    samples
end

end
