%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Método de Newton-Cotes para Integração
%   Entrada:
%     func -> função a ser integrada
%     a -> limite inferior de integração
%     b -> limite superior de integração
%     N -> número de subintervalos
%     tipo ->  escolhe a integração a ser utilizada
%
%   Saídas:
%     I -> valor da integral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function I = MetodoNewtonCotes(func, a, b, N, tipo)
  % Vamos verificar se a = b. Se for, a integral vale 0
  % Se b < a troca b e a de lugar
  if a == b
    I = 0;
    return
  elseif b < a
    aux = flip([a b]);
    a = aux(1);
    b = aux(2);
  endif

  % Calculo do tamanho do comprimento de intervalo h
  h = (b - a) / N;

  % Criação do vetor de valores x a serem analisados
  x = (a:h:b)';

  % Calculo dos valores da função
  f = func(x);

  switch tipo
    case "Trap"
      I = (h/2) * (f(1) + 2 * sum(f(2:end-1)) + f(end));
    case "13Simpson"
      I = (h/3) * (f(1) + 4*sum(f(2:2:end-1)) + 2*sum(f(3:2:end-2)) + f(end));
    case "38Simpson"
      I = (3*h/8) * (f(1) + 3*(sum(f(2:3:end-2)) + sum(f(3:3:end-1))) + ...
                              2*sum(f(4:3:end-3)) + f(end));
  endswitch
end

