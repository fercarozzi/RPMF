function doit(D,mrank,n,j)

   A = unfold(D,j)
   X = rqrd(transpose(A),mrank[j])      
   C = fold(transpose(X),j,n)         

 return C
end


