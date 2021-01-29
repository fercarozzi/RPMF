function completion(file_in,file_out,proc_param)

 d,h,ext = SeisRead(file_in);  

 T=sampling(d)


 vect=size(d);
 nt=vect[1];
 

 Dfft,if1,if2,nf=FFTfunc(d,ext.d1,proc_param.f1,proc_param.f2)

 Dout = complex(zeros(size(Dfft)));


 for ifreq=if1:if2
     
	aux = Dfft[ifreq,:,:,:,:]
	aux2 = pmf(T,aux,proc_param)
	Dout[ifreq,:,:,:,:]      = aux2
	Dout[nf-ifreq+2,:,:,:,:] = conj(aux2)

 end


 dout = ifft(Dout[:,:,:,:,:],1)
 dout = real(dout[1:nt,:,:,:,:])


 SeisWrite(file_out,dout,h,ext)
 
end

