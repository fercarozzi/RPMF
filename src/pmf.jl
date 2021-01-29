function pmf(t,Dobs,pm)


 D = copy(Dobs)
 n = size(D)
 no= size(Dobs)
 N_modes = ndims(Dobs)

 Ones = ones(no)

 A = ones(no)


 rel=0
 iter=0
 
 for k = 1:pm.niter      

  C = zero(D)

  for j = 1:N_modes
      Y = doit(D,pm.rank,n,j) 
      C  +=  Y
  end
     
  E = t.*(Dobs-D)

  cte=0.001
  epsi=sqrt.(sum((abs.(Dobs)).^2))/length(Dobs)*cte


  if pm.ty==1              # >>l1l2 norm
     A = @. 1.0 / (1.0 + (N_modes * pm.a * sqrt((abs(E))^2 + epsi^2)) )
     

  elseif pm.ty==2         # >>Frobenius norm
     A = @. Ones * (1.0 / (1.0 + (N_modes * pm.a) ) )	

  end


  rel = (norm(D - ((Ones-A.*t).*C/4 + A.*Dobs)))^2/(norm(D))^2
  if rel < pm.tol
    iter=k
    break
  end
  

# Update 

  D =@. (( (Ones - A*t) * (C/4.0) )+ ( A * Dobs)) ;

  iter=k
 end   

 return D

end


