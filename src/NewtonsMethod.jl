module NewtonsMethod

using Distributions, LinearAlgebra, Statistics


function newtonroot(f, f_prime; x_0=0.5, tolerance=1E-7, maxiter=1000)
    normdiff=Inf
    iter=1
    x_old=x_0

    while normdiff > tolerance && iter <= maxiter
        x_new=x_old-f(x_old)/f_prime(x_old)
        normdiff = norm(x_new - x_old)
        x_old=x_new
        iter+=1
    end

    if iter <= maxiter
        return (value = x_old, normdiff=normdiff, iter=iter)
    else
        return (value =nothing, normdiff=normdiff, iter=iter)
    end
end

export newtonroot


using ForwardDiff

function newtonroot1(f; x_0=0.5, tolerance=1E-7, maxiter=1000)


    D(f) = x -> ForwardDiff.derivative(f, x)
    f_autoprime = D(f)

    normdiff=Inf
    iter=1
    x_old=x_0

    while normdiff > tolerance && iter <= maxiter
        x_new=x_old-f(x_old)/f_prime(x_old)
        normdiff = norm(x_new - x_old)
        x_old=x_new
        iter+=1
    end

    if iter <= maxiter
        return (value = x_old, normdiff=normdiff, iter=iter)
    else
        return (value =nothing, normdiff=normdiff, iter=iter)
    end

end

export newtonroot1

end # module
