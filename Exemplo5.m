close all
clear
clc

%PLOT DA FUNÇÃO

f = @(x) sin(6*(cos(x)).^2-4*x);

%DEFINIR INTERVALO DO PLOT

xx=(0:1e-2:4)';

%REALIZA O PLOT

plot(xx,f(xx),'-b', 'LineWidth',2)
hold on
grid on

%% CHAMADA PESQUISA INCREMENTAL

[ni, I] = PesqInc(f, 0, 4, 0.2);

%% METODO DA BISSECCAO PARA xl = 1.4
%% xu = 1.6

es= 0.5e-6;
[~, xr, fval, ~, ~] = MetodoBissecao (1.4, 1.6, es, f)
plot(xr,fval,'or','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','k')


[~, xr, fval, ~, ~] = MetodoBissecao (3.4, 3.6, es, f)
plot(xr,fval,'or','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','k')
