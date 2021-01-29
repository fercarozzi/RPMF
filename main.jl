using SeisMain,SeisProcessing,SeisPlot,Statistics,FFTW,LinearAlgebra,PyPlot


include("src/read_process_param.jl")
include("src/sampling.jl")
include("src/FFTfunc.jl")
include("src/completion.jl")
include("src/pmf.jl")
include("src/doit.jl")
include("src/fold.jl")
include("src/unfold.jl")
include("src/rqrd.jl")



file_in="data/test1"
file_out_1="data/test1_pmf_l1"
file_out_2="data/test1_pmf_l2"

proc_param_file = "proc_param.txt"

SeisGeometry(file_in,dsx=5,dsy=5,dgx=5,dgy=5)

println("starting process")

proc_param = read_process_param(proc_param_file)

proc_param.ty=1
completion(file_in,file_out_1,proc_param)
proc_param.ty=2
completion(file_in,file_out_2,proc_param)

dout1,hout1,eout1=SeisRead(file_out_1)
dout2,hout2,eout2=SeisRead(file_out_2)

d0,h0,ext0 = SeisRead("data/linear")

Q1=10*log(10, sum(d0.^2)/sum((d0-dout1).^2))
Q2=10*log(10, sum(d0.^2)/sum((d0-dout2).^2))

println("S/N_o reconstruction with l1/l2 is better than with l2? ", Q1>Q2)


#-----------------------------------------------
# Plots
figure(1,(10,10))

subplot(221)
SeisPlotTX(d0[:,:,2,5,6],style="wiggles",xlabel="CMPy",ox=1,ylabel="Time (s)",dy=0.002,fignum=1,title="Ideal")
subplot(222)
din,hin,ein = SeisRead(file_in);
SeisPlotTX(din[:,:,2,5,6],style="wiggles",xlabel="CMPy",ox=1,ylabel="Time (s)",dy=0.002,fignum=1,title="Noisy",xcur=2.3)
subplot(223)
SeisPlotTX(dout1[:,:,2,5,6],style="wiggles",xlabel="CMPy",ox=1,ylabel="Time (s)",dy=0.002,fignum=1,title="l1/l2")
subplot(224)
SeisPlotTX(dout2[:,:,2,5,6],style="wiggles",xlabel="CMPy",ox=1,ylabel="Time (s)",dy=0.002,fignum=1,title="l2")

tight_layout()
