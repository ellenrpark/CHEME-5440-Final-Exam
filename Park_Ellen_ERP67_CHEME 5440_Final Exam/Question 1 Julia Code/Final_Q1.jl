using DifferentialEquations
using Plots
include("PhasePortraitV2.jl")

function NotchDelta(D1,D2)
    v=0.00000000001

    dD1=@. (1.0/(1.0+10.0*(D2^2/(0.1+D2^2))^2))-D1
    dD2=@. (1.0/(1.0+10*(D1^2/(0.1+D1^2))^2))-D2

    return(dD1,dD2)
end

x1range=(0.0,1.0,20)
x2range=(0.0,1.0,20)
x0=([0.3,0.32],[0.3,0.32])
tspan=(0.0,60.0)

phaseplot(NotchDelta, x1range,x2range,xinit=x0,clines=true,norm=true,scale=0.5)
