%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método de Newton para sistemas não-linear
%
% Entradas
%   f -> vetor de funções a ser calculado
%   J -> matriz Jacobiana do sistemas
%   x0 -> "chute" inicial do Método
%   es -> erro máximo para iterações
%   maxIt -> número máximo de iterações
%
% Saída
%   xr -> vetor solução do sistema
%   fval -> vetor de valores da função f
%   ni -> número de iterações
%   ea -> erro de aproximação calculado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xr,fval,ni,ea] = MetodoNewtonSNL(f,J,x0,es,maxIt)
  % Definição do número máximo de iterações
  if nargin < 5
    maxIt = 20;
  endif

  % Inicialização do Erro
  ea = inf;

  % Inicializar o número de iterações
  ni = 0;

  % Definição do x anterior
  xOld = x0;

  while (ea > es) && (ni < maxIt)
    % Atualizar o número de iterações
    ni += 1;

    % Cálculo da função f
    func = f(xOld);

    % Cálculo da Jacobiana
    Jac = J(xOld);

    % Cálculo do fator de correção
    delta_x = - ElimGauss(Jac, func);

    % if norm(delta_x) < 1e-10

    % Calcula a aproximação
    xr = xOld + delta_x;

    if norm(xr) < 1e-14
      ea = norm(xr - xOld);
    else
      ea = norm(xr - xOld) / norm(xr);
    endif

    % Cálcula o vetor de funções
    fval = f(xr);

    % Atualizar o xOld
    xOld = xr;

    % Saída na tela dos resultados
    fprintf('Iteração %d\n', ni)
    fprintf('xr = [')
    fprintf('%.6f ',xr(1:end-1))
    fprintf('%.6f]\n',xr(end))
    fprintf('fval = [')
    fprintf('%.4e ',fval(1:end-1))
    fprintf('%.4e]\n',fval(end))
    fprintf('Erro: ea = %.2e\n\n',ea)
  endwhile
end







