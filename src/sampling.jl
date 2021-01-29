function sampling(d)

 n = size(d);

 nx1=n[2];
 nx2=n[3];
 nx3=n[4];
 nx4=n[5];
 
 T = ones(nx1,nx2,nx3,nx4);


 for ix1=1:nx1
  for ix2=1:nx2
   for ix3=1:nx3
    for ix4=1:nx4
     v = std(d[:,ix1,ix2,ix3,ix4]);

     if v<0.001;
      T[ix1,ix2,ix3,ix4] = 0. * T[ix1,ix2,ix3,ix4]; 
     end

    end
   end
  end
 end

return T
end