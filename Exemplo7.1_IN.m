close all
clear
clc


f = @(x) exp(-x.^2).* (cos(4*x)+2*x);

a=0;
b=3;

N=9038;

IT= MetodoNewtonCotes(f,a,b,N,"Trap")
I13= MetodoNewtonCotes(f,a,b,N,"13Simpson")
I38= MetodoNewtonCotes(f,a,b,N,"38Simpson")

Iex= integral(f,a,b)


ErroT=abs((Iex-IT)/Iex)*100
Erro13=abs((Iex-I13)/Iex)*100
Erro38=abs((Iex-I38)/Iex)*100


hder = 1e-4;
xder = (a:hder:b)';
fder = f(xder);


Df = diff(fder,2) / hder^2;

[Dfmax, idxMax] = max(abs(Df))
xMax = xder(idxMax)


figure(1)
plot(xder(1:end-2), abs(Df), 'LineWidth',2)
grid on
box on
hold on
plot(xMax,Dfmax,'or','MarkerSize',6,'MarkerFacecolor','r','MarkerEdgeColor', 'k')
