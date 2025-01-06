clear
clc
% Parâmetros do problema
L = 5;           % em H
R = 400;         % em ohms
C = 5e-6;        % em F
q0 = 2;        % em C
V0 = 220;       % em V
% Função q(t)
f = @(t) ((q0 - C*V0) / sqrt(1 - (C*R^2 / (4 * L)))) .* exp((-R .* t) / (2 * L)) .* cos(t .* sqrt((1 / (L * C)) - ((R^2) / (4 * (L^2)))) - atan(R / (L * sqrt((4 / (C * L)) - ((R^2) / (L^2)))))) + C*V0;

 omega = sqrt(1/(L*C) - R^2/(4*L^2));
 phi = atan(R/(L*sqrt(4/(C*L) - R^2/L^2)));
 df = @(t) -((q0 - C.*V0).*R/(2.*L)/(sqrt(1 - (C.*R)^2/(4.*L)))) * exp(-R.*t/(2.*L)) .* cos(omega.*t - phi) - (q0 - C.*V0).*exp(-R.*t/(2.*L))*omega .* sin(omega.*t - phi);



 f_1percenta = 0.99*(1.1e-3);
 f_1percentb = 1.01*(1.1e-3);
t0 = f_1percenta;
es = 0.5e-7;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Método de NWR personalizado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENTRADAS
%   f -> função de análise
%   df -> derivada da função (analítica)
%   x0 -> valor inicial de aproximação
%   es -> erro máximo de aproximação
%   maxIt -> nro máximo de iterações
%
% SAÌDAS
%   xr -> valor aproximado
%   ni -> numero de iterações
%   ea -> erro de aproximação
%   fval -> valor da função no xr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [tr, ni,ea,fval] = MetodoNewtonR(f,df,t0,es,maxIt)

  if nargin < 5
    %INICIALIZA O MÁXIMO
    maxIt = 20;
  end


  %INICIALIZA O NUMERO DE ITERAÇÕES
  ni = 0;

  %INICIALIZA O ERRO
  ea = inf;


  %CRIAÇÃO DE VARIÁVEL DE SUPORTE
  tOld = t0;


  %LAÇO QUE FARÁ O AS APROXIMAÇÕES E O CÁLCULO DO ERRO
  while (ea > es) && (ni<maxIt)
    %ATUALIZAÇÃO DE NI
    ni += 1;

    %CALCULO DA PRÓXIMA ITERAÇÃO (APROXIMAÇÃO DE RAÍZ)
    %FATOR DE CORREÇÃO
    deltax = -f(tOld) / df(tOld);
    tr = tOld + deltax;


    %CALCULANDO O ERRO DE APROXIMAÇÃO
     ea = abs(tr - tOld) / abs(tr);


    %ATUALIZA XOLD
    tOld =tr;

    %CALCULA O VALOR DA FUNÇÃO PARA XR
    fval = f(tr);

    %SAIDAS NA TELA DOS VALORES DA FUNÇÃO
    fprintf("iteração %d!\n", ni)
    fprintf("Raiz aproximada: %.10f!\n", tr)
    fprintf("Valor da função: %.10f!\n", fval)
    fprintf("Erro de aproximação: %.2e!\n\n", ea)

  end %FECHA O WHILE
  end %FECHA FUNCTION
