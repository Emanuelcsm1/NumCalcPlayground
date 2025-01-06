function [U,x] = cholesky(A, b)
  % Verifique as dimensões da matriz A
  [n, m] = size(A);
  if n ~= m
    error('A matriz A deve ser quadrada.');
  end

  % Verifique se o vetor b tem a dimensão correta
  if nargin == 2
    if length(b) ~= n
      error('O vetor b deve ter a mesma dimensão que A.');
    end
  end
  % Inicialize a matriz U com zeros
  U = zeros(n, n);

  % Algoritmo de decomposição de Cholesky
  for i = 1:n
    soma = 0;
    if i > 1
      for k = 1:(i - 1)
        soma = soma + U(k, i)^2;
      end
    end
    U(i, i) = sqrt(A(i, i) - soma);

    for j = (i + 1):n
      soma = 0;
      if i > 1
        for k = 1:(i - 1)
          soma = soma + U(k, i) * U(k, j);
        end
      end
      U(i, j) = (A(i, j) - soma) / U(i, i);
    end
  end
    % Se o usuário não fornecer b, saia da função com o valor de U e um vetor vazio x
  if nargin ==1
    x = [];
    return;
  end

  % Resolver U^T * d = b usando substituição progressiva
  L = transpose(U)

  d = forward_substitution(L, b)

  % Resolver U * x = d usando substituição regressiva
  x = backward_substitution(U, d);
end

function y = forward_substitution(L, b)
  n = length(b);
  y = zeros(n, 1);

  for i = 1:n
    y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
  end
end

function x = backward_substitution(U, d)
  n = length(d);
  x = zeros(n, 1);

  for i = n:-1:1
    x(i) = (d(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
  end
end

