%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método de Newton-Raphson
%
% Entradas
%   f -> função de análise
%   df -> derivada da função (analítica)
%   x0 -> valor inicial de aproximação
%   es -> erro máximo de aproximação
%   maxIt -> número máximo de iterações
%
% Saídas
%   xr -> raiz aproximada
%   ni -> número de iterações
%   ea -> erro de aproximação
%   fval -> valor da função no xr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xr,ni,ea,fval] = MetodoNewtonR(f,df,x0,es,maxIt)
  % Definição do número máximo de iterações
  if nargin < 5
    % Inicializa o máximo
    maxIt = 20;
  end

  % Inicializa o número de iterações
  ni = 0;

  % Inicializa o erro
  ea = inf;

  % Criação de uma variável para suporte no cálculo do erro
  xOld = x0; %x zero

  % Laço que fará as aproximações e o cáculo do erro
  while (ea > es) && (ni < maxIt)
    % Atualização do ni
    ni += 1;

    % Cálculo da próxima iteração (aproximação da raiz)
    % Fator de correção
    deltax = - f(xOld) / df(xOld);
    xr = xOld + deltax;

    % Cálculo do erro de aproximação
    % aproximação atual - x, aproximação anterior - fold
    if abs(xr) < 1e-12
      ea = abs(xr - xOld);
    else
      ea = abs((xr - xOld) / xr);
    endif

    % Atualização do xold
    xOld = xr;

    % Cálculo dao valor da função no xr
    fval = f(xr);

    % Saídas na tela dos valores da função
    fprintf("Iteração %d!\n", ni)
    fprintf("Raiz aproximada: xr = %.6f\n", xr)
    fprintf("Valor da função: %.10f!\n", fval)
    fprintf("Erro de aproximação: %.2e!\n\n", ea)
  end % Fecha o while
end %Fecha a function





