function unfold(X,j)
# unfold: convert a tensor into a matrix. Works for tensors of order 3 and 4. 
#This is different from Kolda where a_1=reshape(a,n1,n2*n3*n4)
#  A  = unfold(X,mode);
#
#  IN   X:      tensor
#       mode:  unfolding mode
#
#  OUT  A:      matrix
#
#  Copyright (C) 2013, Signal Analysis and Imaging Group
#  Author: Nadia Kreimer and M D Sacchi 
#
#
 
m=ndims(X);
n=size(X)
if m==3;
    
    
    if j==1
        I1 = [1,2,3] ;
	A=zeros(n[1]*n[2],n[3])
        A = reshape(X, n[1]*n[2],n[3]);
    end;
    
    if j==2;    
        I2 = [3,1,2] ;
	A=zeros(n[3]*n[1],n[2])
        A = reshape(permutedims(X, I2), n[3]*n[1],n[2]);
    end;
    
    if j==3;    
        I3 = [2,3,1] ;
	A=zeros( n[2]*n[3],n[1])
        A = reshape(permutedims(X, I3), n[2]*n[3],n[1]);
    end;
    
elseif m==4;
    
    
    if j==1;    
        I1 = [1,2,3,4] ;
	A=zeros(n[1]*n[2]*n[3],n[4])
        A = reshape(X, n[1]*n[2]*n[3],n[4]);
    end;
    
    if j==2;    
        I2 = [4,1,2,3] ;
	A=zeros(n[4]*n[1]*n[2],n[3])
        A = reshape(permutedims(X, I2), n[4]*n[1]*n[2],n[3]);
    end;
    
    if j==3;    
        I3 = [3,4,1,2] ;
	A=zeros(n[3]*n[4]*n[1],n[2])
        A = reshape(permutedims(X, I3), n[3]*n[4]*n[1],n[2]);
    end;
    
    if j==4;    
        I4 = [2,3,4,1] ;
	A=zeros( n[2]*n[3]*n[4],n[1])
        A = reshape(permutedims(X, I4), n[2]*n[3]*n[4],n[1]);
    end;
    
end;
return A

end