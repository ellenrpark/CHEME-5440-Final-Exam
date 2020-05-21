using DifferentialEquations
using Plots
include("PhasePortraitV2.jl")

function NotchDelta(N1,N2)
    v=0.00000000001

    dN1=@. (1/(1+10*N2^2))^2/(0.1+(1/(1+10*N2^2)^2))-N1
    dN2=@. (1/(1+10*N1^2))^2/(0.1+(1/(1+10*N1^2)^2))-N2

    return(dN1,dN2)
end

x1range=(0.0,1.0,20)
x2range=(0.0,1.0,20)
x0=([0.0,10.0],[1.0,10.0])
tspan=(0.0,60.0)

phaseplot(NotchDelta, x1range,x2range,xinit=(), t=tspan,clines=true,norm=true,scale=0.5)
