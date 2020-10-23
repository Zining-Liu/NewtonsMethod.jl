using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    # Write your own tests here.

# return back nothing if non-convergence: wrote in function

# test of non-convergence

f(x)=2+x^2
f_prime(x)=2*x
t1=newtonroot(f, f_prime; x_0=0, tolerance=1E-7, maxiter=1000)[1]
t2=newtonroot1(f; x_0=0, tolerance=1E-7, maxiter=1000)[1]
@test t1 == nothing
@test t2 == nothing


# root of a known function
f(x)=x^2-2x+1
f_prime(x)=2*x-2
t3=newtonroot(f, f_prime; x_0=0, tolerance=1E-7, maxiter=1000)[1]
@test t3 ≈ 1.0

# automatic differentiation
t4=newtonroot2(f; x_0=0, tolerance=1E-7, maxiter=1000)[1]
@test t4 ≈ 1.0

# finding those roots with a BigFloat
t5=newtonroot(f, f_prime; x_0=BigFloat(x0), tolerance=1E-7, maxiter=1000)[1]
@test t5 ≈ 1.0


# several of above tests

f(x)=x^2-2x
f_prime(x)=2*x-2

t3=newtonroot(f, f_prime; x_0=1.5, tolerance=1E-7, maxiter=1000)[1]
@test t3 ≈ 2.0
t4=newtonroot2(f; x_0=1.5, tolerance=1E-7, maxiter=1000)[1]
@test t4 ≈ 2.0
t5=newtonroot(f, f_prime; x_0=BigFloat(1.5), tolerance=1E-7, maxiter=1000)[1]
@test t5 ≈ 2.0


f(x)=x^2-3x+2
f_prime(x)=2*x-3

t3=newtonroot(f, f_prime; x_0=0, tolerance=1E-7, maxiter=1000)[1]
@test t3 ≈ 1.0
t4=newtonroot2(f; x_0=0, tolerance=1E-7, maxiter=1000)[1]
@test t4 ≈ 1.0
t5=newtonroot(f, f_prime; x_0=BigFloat(0), tolerance=1E-7, maxiter=1000)[1]
@test t5 ≈ 1.0



# ensure that the maxiter is working
f(x)=x^2-2x+1
f_prime(x)=2*x-2

t6=newtonroot(f, f_prime; x_0=0, tolerance=1E-7, maxiter=5)[1]
@test t6 == nothing


# ensure that tol is working
t7=newtonroot(f, f_prime; x_0=0, tolerance=1E-7, maxiter=1000)[2]
@test t7 <= 1E-7


end
