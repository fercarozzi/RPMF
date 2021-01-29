"""
    FFTfunc(in,dt,f1,f2)

Prepares an n-D signal for FFT in time

# Arguments
* 'in::Array{Float64,n}': input data. n is the number of dimensions of the array
* 'dt' : time sampling
* 'f1-f2': frequency range

# Output
* 'Dfft' : n-D signal in the Fourier domain
* 'if1-if2': frequency index range
* 'nf' : total number of indexes
"""
function FFTfunc(in,dt,f1,f2)

#padding and calculation of fft for an n-D signal.
 m=ndims(in);
 n=m-1;
 vect=size(in);
 nt=vect[1];

#Calculate index frequencies.
 nf=nextpow(2,nt);

 if1=convert(Int64, floor(f1*nf*dt)+1);
 if2=convert(Int64, floor(f2*nf*dt)+1);

dpad=zero(in)

 if m==2
    dpad = zeros(nf,vect[2]);

     dpad[1:nt,:] = in;

 elseif m == 3
     dpad = zeros(nf,vect[2],vect[3]);

     dpad[1:nt,:,:] = in;

 elseif m==5
     dpad = zeros(nf,vect[2],vect[3],vect[4],vect[5]);

     dpad[1:nt,:,:,:,:] = in;

 end

Dft = fft(dpad,1)

return Dft,if1,if2,nf

end


#***********************************************

 function padding(in)

#3D padding and fft.

 nt,nx,ny = size(in);

 nf  = nextpow(2,nt);
 nkx = nextpow(2,nx);
 nky = nextpow(2,ny);

if typeof(in) == Array{Float64,3}

   dpad=zeros(nf,nkx,nky);
else
   dpad=complex(zeros(nf,nkx,nky));
end

 dpad[1:nt,1:nx,1:ny] = in;


return dpad

end

#**************************************************

function padding2D(in)

#2D padding for fft.

 nx,ny = size(in);

 nkx = nextpow(2,nx);
 nky = nextpow(2,ny);

if typeof(in) == Array{Float64,3}

   dpad=zeros(nkx,nky);
else
   dpad=complex(zeros(nkx,nky));
end

 dpad[1:nx,1:ny] = in;


return dpad

end
