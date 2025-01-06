%PRIMEIRA FUNÇÃO
% f(x)=e^(-0.5)*cos(5x)

%Inicialiazação do eixo x
x= linspace(0,2*pi,1000)';
y=exp(-0.5*x).*cos(5*x);
plot(x,y)
grid on
box on
set(gca,"FontSize",28)

