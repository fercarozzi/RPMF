mutable struct proc_params

    rank::Array{Int64,1}
    niter::Int32
    tol::Float32
    f1::Float32
    f2::Float32

    a::Float32
    ty::Int16
end
 


function read_process_param(filename)

f = open(filename,"r")
fstring = read(f,String);
close(f)

ini = first(something(findlast("r1=",fstring),0:-1))
r1 = parse(Int64, fstring[something(findnext(r"r1=.*",fstring,ini))][4:end]) 
ini = first(something(findlast("r2=",fstring),0:-1))
r2 = parse(Int64, fstring[something(findnext(r"r2=.*",fstring,ini))][4:end]) 
ini = first(something(findlast("r3=",fstring),0:-1))
r3 = parse(Int64, fstring[something(findnext(r"r3=.*",fstring,ini))][4:end]) 
ini = first(something(findlast("r4=",fstring),0:-1))
r4 = parse(Int64, fstring[something(findnext(r"r4=.*",fstring,ini))][4:end]) 

rank = [r1,r2,r3,r4]

ini = first(something(findlast("niter=",fstring),0:-1))
niter = parse(Float32, fstring[something(findnext(r"niter=.*",fstring,ini))][7:end])

ini = first(something(findlast("tol=",fstring),0:-1))
tol = parse(Float32, fstring[something(findnext(r"tol=.*",fstring,ini))][5:end])

ini = first(something(findlast("f1=",fstring),0:-1))
f1 = parse(Float32, fstring[something(findnext(r"f1=.*",fstring,ini))][4:end]) 

ini = first(something(findlast("f2=",fstring),0:-1))
f2 = parse(Float32, fstring[something(findnext(r"f2=.*",fstring,ini))][4:end]) 

ini = first(something(findlast("a=",fstring),0:-1))
a = parse(Float32, fstring[something(findnext(r"a=.*",fstring,ini))][3:end])


ty = 0 
params = proc_params(rank,niter,tol,f1,f2,a,ty)

return params

end