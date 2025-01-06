% Cálculo do N (numero de subintervalos a integrar)
close all
clear
clc

%declarando função e intervalo
f = @(x) sin(x.^2)+1;
a=0;
b=4;

%subintervalo para as derivadas
deltax = 1e-3;

%calculo das derivadas

xx = (a:deltax:b)';
D2 = abs(diff(f(xx),2))/deltax.^2;
[D2max, idxmax] = max(D2)





