%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Função Exponencial
%
% Entradas:
%   x -> valor para cálculo de f(x) = exp(x)
%   es -> erro máximo fornecido pelo usuário
%   maxIt -> máximo de iterações (pode ou não ser fornecido)
%
% Saídas:
%   f -> valor da função
%   ni -> número de iterações
%   ea -> erro aproximado (calculado pelo código)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
es = 0.5e-4;
maxIt = 1000;

% Inicializa o cálculo da função exponencial
f = 0;

% Inicializa o número de iterações
k = 1;

% Inicializa o erro
ea = inf;

% Criação de uma variável para suporte no cálculo do erro
fold = f
% Saídas na tela
fprintf("Iteração %d!\n", k)
fprintf("Valor da função: %.10f!\n", f)
fprintf("Erro de aproximação: %.2e!\n\n", ea)

% Laço que fará o somatório da função e o cáculo do erro
while (ea > es) && (k < maxIt)
  % Cálculo do somatório da função
  f = 1/k^(4);

  % Atualização do ni
  k += 1;

  % Cálculo do erro de aproximação
  % aproximação atual - f, aproximação anterior - fold

    ea = abs((f - fold) / f);


  % Atualização do fold
  fold = f;

  % Saídas na tela dos valores da função
  fprintf("Iteração %d!\n", k)
  fprintf("Valor da função: %.10f!\n", f)
  fprintf("Erro de aproximação: %.2e!\n\n", ea)
end










