function [x_aprox] = busca_raizes(f, a, b, delta, max_iter, tol)
% BUSCA_RAIZES: Encontra as raízes de uma função f em um intervalo [a, b]
% usando uma pesquisa incremental seguida do método da bissecção.
%
%   [x_aprox] = busca_raizes(f, a, b, delta, max_iter, tol) retorna a
%   aproximação da raiz encontrada.
%
%   f: função a ser avaliada
%   a, b: extremidades do intervalo de busca
%   delta: tamanho do passo na pesquisa incremental
%   max_iter: número máximo de iterações na pesquisa incremental
%   tol: tolerância para o método da bissecção

  % Busca por intervalos com raízes usando pesquisa incremental
  x = a;
  i = 1;
  while x < b && i <= max_iter
    if f(x)*f(x+delta) < 0
      % Encontrou um intervalo que contém raiz
      % Aplica método da bissecção nesse intervalo
      [x_aprox, iter] = bisseccao(f, x, x+delta, tol);
      if iter > 0
        % Aproximação encontrada com sucesso
        return
      end
    end
    x = x + delta;
    i = i + 1;
  end

  % Se chegou aqui, não encontrou raiz
  error("Não foi encontrada uma raiz no intervalo dado.");
end

function [x_aprox, iter] = bisseccao(f, a, b, tol)
% BISSECCAO: Encontra uma aproximação da raiz da função f no intervalo [a, b]
% usando o método da bissecção.
%
%   [x_aprox, iter] = bisseccao(f, a, b, tol) retorna a aproximação da
%   raiz encontrada e o número de iterações realizadas.
%
%   f: função a ser avaliada
%   a, b: extremidades do intervalo
%   tol: tolerância para o critério de parada

  % Critério de parada: largura do intervalo é menor que a tolerância
  while abs(b-a) > tol
    % Calcula o ponto médio do intervalo
    c = (a+b)/2;
    % Verifica em qual metade do intervalo está a raiz
    if f(a)*f(c) < 0
      b = c;
    else
      a = c;
    end
  end

  % Retorna a aproximação da raiz e o número de iterações
  x_aprox = (a+b)/2;
  iter = ceil(log2(abs(b-a)/tol));
end

