close all
clear
clc

%Definir a func
f = @(x) -4.*x.^5+10.*x.^4-x.^2-4*x+3;

%Definir o a
a = -1;

%Definir o b
b = 2;


% Determinação do subintervalo para derivadas
deltax = 1e-3;

% Cálculo da derivadas
xx = (a:deltax:b)';
D2 = abs(diff(f(xx), 2)) / deltax^2;
[D2max, idx2max] = max(D2);

% Cálculo do número de subintervalos para Regra do Trap
% Erro Máximo no cálculo da integração
es = 0.5e-5;
disp('Regra do Trapézio')
N = sqrt((b-a)^3/(12*es) * D2max)


D4 = abs(diff(f(xx), 4)) / deltax^4;
[D4max, idx4max] = max(D4);
disp('Regra 1/3 de Simpson')
N = ((b-a)^5/(180*es) * D4max)^(1/4)

disp('Regra 3/8 de Simpson')
N = ((b-a)^5/(80*es) * D4max)^(1/4)

n=3;
I = QuadGauss(f,a,b,n)
Iex = I
h = (b-a)/N;

%Método da aproximação
tipo = "Trap";
N=9428;
I1 = MetodoNewtonCotes(f, a, b, N, tipo)
ee1 = abs((Iex - I1)/Iex)


##Método da aproximação2
tipo = "13Simpson";
N=120;
I2 = MetodoNewtonCotes(f, a, b, N, tipo)
##ea2 = ((N*h^5)/180)*(D4max)
ee2 = abs((Iex - I2)/Iex)
##N = ((b-a)^5/(180*(0.2*10^-8)) * D4max)^(1/4)


##Método da aproximação3
tipo = "38Simpson";
N=146;
I3 = MetodoNewtonCotes(f, a, b, N, tipo)
##ea3 = ((N*h^5)/80)*(D4max)
ee3 = abs((Iex - I3)/Iex)
##N3 = ((b-a)^5/(80*(0.2*10^-8)) * D4max)^(1/4)
