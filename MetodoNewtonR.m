%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     MÉTODO DE NEWTON-RAPHSON
%
% ENTRADAS
%   f -> função de análise
%   df -> derivada da função (analítica)
%   x0 -> valor inicial de aproximação
%   es -> erro máximo de aproximação
%   maxIt -> nro máximo de iterações
%
% SAÌDAS
%   xr -> raiz aproximada
%   ni -> numero de iterações
%   ea -> erro de aproximação
%   fval -> valor da função no xr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xr, ni,ea,fval] = MetodoNewtonR(f,df,x0,es,maxIt)

  if nargin < 5
    %INICIALIZA O MÁXIMO
    maxIt = 20;
  end


  %INICIALIZA O NUMERO DE ITERAÇÕES
  ni = 0;

  %INICIALIZA O ERRO
  ea = inf;


  %CRIAÇÃO DE VARIÁVEL DE SUPORTE
  xOld = x0;


  %LAÇO QUE FARÁ O AS APROXIMAÇÕES E O CÁLCULO DO ERRO
  while (ea >es) && (ni < maxIt)
    %ATUALIZAÇÃO DE NI
    ni += 1;

    %CALCULO DA PRÓXIMA ITERAÇÃO (APROXIMAÇÃO DE RAÍZ)
    %FATOR DE CORREÇÃO
    deltax = -f(xOld) / df(xOld);
    xr = xOld + deltax;


    %CALCULANDO O ERRO DE APROXIMAÇÃO
    if abs(xr) < 1e-12
      ea = abs(xr-xOld);
    else
      ea = abs((xr-xOld) / xr);
    endif

    %ATUALIZA XOLD
    xOld =xr;

    %CALCULA O VALOR DA FUNÇÃO PARA XR
    fval = f(xr);

    %SAIDAS NA TELA DOS VALORES DA FUNÇÃO
    fprintf("iteração %d!\n", ni);
    fprintf("Raiz aproximada: %.10f!\n", xr);
    fprintf("Valor da função: %.10f!\n", fval);
    fprintf("Erro de aproximação: %.2e!\n\n", ea);




  end %FECHA O WHILE
  end %FECHA FUNCTION
