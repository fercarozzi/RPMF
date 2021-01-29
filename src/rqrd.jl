"""
rqrd(M,p)

Computes the reduced-rank approximation of matrix M via randomized QR 
the randomized QR decomposition

"""


function rqrd(M,p)
#M is the unfolded tensor(it becomes a matrix)
#p is the number of random vectors that are used for the projection.

 n=size(M)

 omega=rand(n[2],p)

 y=M*omega

 F = qr(y)

 Q = Matrix(F.Q)

 L=Q*adjoint(Q)*M

return L

end
