close all
clear
clc

%Definir a func
f = @(x) x.^(cos(3.*x)./4);

%Definir o a
a = 1;

%Definir o b
b = 8;

%Definir o n
n = 7;

##h = (b-a)/N;

%Valor Exato
Iex = 7.095654048966;

I = QuadGauss(f,a,b,n)
ee = abs((Iex - I)/Iex)

% Determinação do subintervalo para derivadas
deltax = 1e-3;

% Cálculo da derivadas
xx = (a:deltax:b)';
D4 = abs(diff(f(xx), 4)) / deltax^4;
[D4max, idx4max] = max(D4);


%Método da aproximação2
tipo = "13Simpson";
N=38
I2 = MetodoNewtonCotes(f, a, b, N, tipo)
##ea2 = ((N*h^5)/180)*(D4max)
ee2 = abs((Iex - I2)/Iex)
##N2 = ((b-a)^5/(180*(ee)) * D4max)^(1/4)


##Método da aproximação3
tipo = "38Simpson";
N=46
I3 = MetodoNewtonCotes(f, a, b, N, tipo)
##ea3 = ((N*h^5)/80)*(D4max)
ee3 = abs((Iex - I3)/Iex)
##N3 = ((b-a)^5/(80*(ee)) * D4max)^(1/4)

%Valor Exato
Iex = 7.095654048966;


