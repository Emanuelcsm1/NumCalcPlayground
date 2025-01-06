% Cálculo do N (número de subintervalos a integrar)
close all
clear
clc

% Função utilizada
f = @(x) sin(x.^2) + 1

% Definição do intervalo de integração
a = 0;
b = 4;

% Determinação do subintervalo para derivadas
deltax = 1e-3;

% Cálculo da derivadas
xx = (a:deltax:b)';
D2 = abs(diff(f(xx), 2)) / deltax^2;

figure(1)
hold on
grid on
plot(xx(1:end-2), D2, '-b', 'LineWidth', 2)

[D2max, idx2max] = max(D2);
x2max = xx(idx2max);
plot(x2max,D2max,'om','MarkerSize',10,'MarkerFaceColor','m',...
                          'MarkerEdgeColor', 'k')

% Cálculo do número de subintervalos para Regra do Trap
% Erro Máximo no cálculo da integração
es = 1e-6;
disp('Regra do Trapézio')
N = sqrt((b-a)^3/(12*es) * D2max)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Regra 1/3 de Simpson
D4 = abs(diff(f(xx), 4)) / deltax^4;

figure(2)
hold on
grid on
plot(xx(1:end-4), D4, '-b', 'LineWidth', 2)

[D4max, idx4max] = max(D4);
x4max = xx(idx4max);
plot(x4max,D4max,'om','MarkerSize',7,'MarkerFaceColor','m',...
                          'MarkerEdgeColor', 'k')

% Cálculo do número de subintervalos para Regra do Trap
% Erro Máximo no cálculo da integração
disp('Regra 1/3 de Simpson')
N = ((b-a)^5/(180*es) * D4max)^(1/4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Regra 3/8 de Simpson
% Cálculo do número de subintervalos para Regra do Trap
% Erro Máximo no cálculo da integração
disp('Regra 3/8 de Simpson')
N = ((b-a)^5/(80*es) * D4max)^(1/4)


