close all
clear
clc

tic
%Definir a EDO
f = @(t,y) (t+4*y)./(t+1);

%Definir o h
h = 1;

%Definir o t0
t0 = 1;

%Definir o y0
y0 = -5;

%Valor máximo para t
tmax = 5;

%Método da aproximação
tipo = "Euler";

[t,y] = MetodoRungeKutta(f, t0 ,y0, h, tmax, tipo)


%Método da aproximação2
tipo = "Heun";
[t2,y2] = MetodoRungeKutta(f, t0 ,y0, h, tmax, tipo)

%Método da aproximação3
tipo = "Ralston";

[t3,y3] = MetodoRungeKutta(f, t0 ,y0, h, tmax, tipo)


%Solução Exata
yex = @(t) -55/192*(t+1).^(4)-1/3*t-1/12;

tt = 0:1e-3:tmax;
figure(1)
hold on
grid on
box on
p1 = plot (tt,yex(tt), '--r','LineWidth', 2)
p2 = plot (t,y,'-bo','LineWidth',2,'MarkerSize',10, 'MarkerEdgeColor','k','MarkerFaceColor','b')
p3 = plot (t2,y2,'-ms','LineWidth',2,'MarkerSize',10, 'MarkerEdgeColor','k','MarkerFaceColor','m')
p4 = plot (t3,y3,'-c^','LineWidth',2,'MarkerSize',10, 'MarkerEdgeColor','k','MarkerFaceColor','c')
lgd = legend([p1,p2,p3,p4],{"Função Exata","Euler","Heun","Ralston"});
set(lgd, 'Fontsize',28)
set(gca, 'Fontsize',30)
toc
