function fold(A,j,n)

N=length(n)

if N==3
    
    n1 = n[1]; n2 = n[2]; n3 = n[3];
    
    if j==1 ;
        J1 = [1, 2, 3];
        X = reshape(A, n1,n2,n3);
	return X
    end;
    
    if j==2;
        J2 = [2, 3, 1];    
        X = permutedims(reshape(A,n3,n1,n2),J2);
	return X
    end;
    
    if j==3;
        J3 = [3, 1, 2];    
        X = permutedims(reshape(A,n2,n3,n1),J3);
	return X
    end;
    
    
elseif N==4;
    
    n1 = n[1]; n2 = n[2]; n3 = n[3]; n4 = n[4];
    
    if j==1;
        J1 = [1,2,3,4];    
        X = reshape(A,n1,n2,n3,n4);
	return X
    end;
    
    if j==2;
        J2 = [2,3,4,1] ;    
        X = permutedims(reshape(A,n4,n1,n2,n3),J2);
	return X
    end;
    
    if j==3;
        J3 = [3,4,1,2];     
        X = permutedims(reshape(A,n3,n4,n1,n2),J3);
	return X
    end;
    
    if j==4;
        J4 = [4,1,2,3] ;
        X = permutedims(reshape(A,n2,n3,n4,n1),J4);
	return X
    end
    
end

end