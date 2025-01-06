%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MÉTODO DE RUNGE KUTTA PARA A SOLUÇÃO DE EDOs DE PRIMEIRA ORDEM
%
% ENTRADAS:
%   f -> valor da derivada dy/dt da EDO (isolar a derivada)
%   t0 -> valor inicial para o tempo (variavel independente)
%   y0 -> valor incial para a solução da EDO (variável dependete)
%   h -> comprimento de passo (intervalo de tempo)
%   tmax -> tempo máximo de análise
%   tipo -> variável que escolhe qual técnica utilizar para calcular a funcção incremento
%
% SAÍDAS:
% t -> vetor de valores de tempo analisados
% y -> vetor de valores da solução aproximados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [t,y] = MetodoRungeKutta(f, t0 ,y0, h, tmax, tipo)
  if nargin < 6
    tipo = "Heun"
  endif

  %Criar o vetor de valores de t

  t = (t0:h:tmax)';

  %Condicional para verificar se o último t é tmax

  if t(end) ~= tmax
    t(end+1) = tmax;
  endif


  %Criação do vetor de valores da solução da EDO (PVI)
  y = zeros(length(t),1)

  %Alocação do primeiro valor de y
  y(1) = y0;

  %Laço para cálculo das aproximações de y
  for i = 2:length(t)
    % Recalcula o valor de h para verificar se troca o valor de h
    h = t(i) -t(i-1);

    %Criação do switch case para a escolha do método de cálculo
    %da função de incremento ou função de inclinação
    switch tipo
      case "Euler"
        phi = f(t(i-1), y(i-1));

      case "Heun"
        phi0 = f(t(i-1),y(i-1));
        y0=y(i-1)+phi0*h;
        phi1=f(t(i),y0);
        phi=(phi0+phi1)/2;

      case "PM"
        phi0 = f(t(i-1),y(i-1));
        y1=y(i-1)+phi0*h/2;
        phi=f(t(i-1)+h/2,y1);

      case "Ralston"
        %Valor de k1
        k1= f(t(i-1),y(i-1));


      case "Nystron"
        k1-f(t(i-1),y(i-1));
        k2= f(t(i-1)+2/3*h,y(i-1)+2/3*k1*h);
        k2= f(t(i-1)+2/3*h,y(i-1)+2/3*k2*h);
        phi=1/4*(k1+3/2*(k2+k3));

      case "RK4"
        k1 = f(t(i-1),y(i-1));
        k2 = f(t(i-1) + 1/2 * h, y(i-1) + 1/2 * k1 * h);
        k3 = f(t(i-1) + 1/2 * h, y(i-1) + 1/2 * k2 * h);
        k4 = f(t(i-1) + h, y(i-1) + + k3 * h);
        phi = 1/6 * (k1 + 2 * (k2 + k3) + k4);

        %Valor de k2
        k2= f(t(i-1)+3/4*h, y(i-1)+3/4*k1*h)

        %Valor da inclinação phi
        phi= 1/3*k1+2/3*k2;
    endswitch

    %Cálculo da aproximação da solução
      y(i) = y(i-1) + phi*h;
  endfor
  endfunction
