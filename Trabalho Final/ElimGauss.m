%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MÉTODO DA ELIMINAÇÃO DE GAUSS
%
% ENTRADAS
% A -> matriz dos coeficientes
% b -> vetor do lado direito do sistema linear
%
%
% SAÍDAS
% C -> matriz aumentada escalonada
% x -> vetor solução do sistema
% determinante -> determinante da matriz A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,C, determinante] = ElimGauss(A,b)

  %Armazena o número de linhas e de colunas da matriz A
  [m,n] = size(A);

  if m ~= n
    %A MATRIZ NÃO É QUADRADA
    error("a matriz A deve ser quadrada!")
  endif

  % TAMANHO DO VETOR
  if nargin > 1
    nb = length(b);

    if n~= nb
      %b não possui o mesmo número de linhas de A como tamanho
      error("O vetor n deve possuir o mesmo número de linhas de A!")
    endif
    else
    b = nan(n,1);
  endif
    %Matriz aumentada do sistema
    C = [A,b];

    %Numero de colunas de C
    nc = n+1;

    %Eliminação progressiva
    for j = 1:(n-1) % Percorre as colunas de A
      if C(j,j) == 0
        error("O elemento pivô foi nulo!")
      endif
      for i = (j+1):n % Percorre as linhas de A
        % Cálculo do fator que zera os elementos abaixo do elemento pivô
        fator = C(i,j)/C(j,j)

        % Cálculo da nova linha da matriz C
        C(i, j:nc)= C(i, j:nc) - fator* C(j, j:nc)
      endfor
    endfor

    % Cálculo determinante
    if nargin < 2
      determinante = prod(diag(C(:, 1:n)));
    else
      determinante = [];
    endif


    % Delclaração do vetor de soluções
    x = nan(n,1);

    % Cálculo do último elemento de x (vetor solução)
    x(n) = C(n, nc)/C(n, n);

    %Substituição regressiva
    for i = (n-1):-1:1  % Percorre as linhas de C em ordem regressiva
      x(i) = (C(i,nc)- C(i, i+1:n) * x(i+1:n)) / C(i,i);
    endfor


    end
