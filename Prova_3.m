close all
clear
clc

%Definir a func
func = @(x) exp(-0.1.*x.^2).*(cos(4.*x)+2);

%Definir o a
a = 0;

%Definir o b
b = 4;

%Definir o N
N = 6;


%Valor Exato
Iex = 5.1877630653;

% Determinação do subintervalo para derivadas
deltax = 1e-3;

% Cálculo da derivadas
xx = (a:deltax:b)';
D4 = abs(diff(func(xx), 4)) / deltax^4;
[D4max, idx4max] = max(D4);

##%Método da aproximação
##tipo = "Trap";
##I1 = MetodoNewtonCotes(func, a, b, N, tipo)

h = (b-a)/N;
%Método da aproximação2
tipo = "13Simpson";
N=942;
I2 = MetodoNewtonCotes(func, a, b, N, tipo)
ea2 = ((N*h^5)/180)*(D4max)
ee2 = abs((Iex - I2)/Iex)
##N = ((b-a)^5/(180*(0.2*10^-8)) * D4max)^(1/4)


%Método da aproximação3
##tipo = "38Simpson";
##N=1153;
##I3 = MetodoNewtonCotes(func, a, b, N, tipo)
##ea3 = ((N*h^5)/80)*(D4max)
##ee3 = abs((Iex - I3)/Iex)*100
##N3 = ((b-a)^5/(80*(0.2*10^-8)) * D4max)^(1/4)

