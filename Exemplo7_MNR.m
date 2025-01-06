%%LIMPEZAS
clear
clc

% Definição dos Parâmetros
R= 225; C=0.6e-6; L=0.5; Z=75;

% Definição da função

f = @(w) C*L*w.^2 - L*sqrt(1/Z^2 - 1/R^2)*w -1;

% Gráfico da função

ww= (-1000:1:22000)';
figure(1)
plot(ww, f(ww), '-b', 'Linewidth', 2);
grid on
set(gca, 'FontSize', 40, 'XTick', (-1000:5000:22000));
set(gca,'XLim',[ww(1),ww(end)])
hold on
grid on

