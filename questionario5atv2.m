function y = f(x)
  y = x^3 - 2*x^2 - 5*x + 6;
end
[x_aprox] = busca_raizes(@f, -5, 5, 0.1, 50, 10e-5);
disp(x_aprox);

function [x_aprox] = busca_raizes(f, a, b, passo, max_iter, tol)
  % Realiza a pesquisa incremental para encontrar os intervalos que contém raízes
  intervalos = [];
  i = a;
  while i < b
    if f(i)*f(i+passo) < 0
      intervalos = [intervalos; i, i+passo];
    end
    i = i + passo;
  end

  % Aplica o método da bissecção em cada intervalo para encontrar uma aproximação da raiz
  x_aprox = [];
  for i = 1:size(intervalos,1)
    a_i = intervalos(i,1);
    b_i = intervalos(i,2);
    j = 1;
    while j <= max_iter
      c_i = (a_i + b_i) / 2;
      if f(c_i) == 0 || (b_i - a_i) / 2 < tol
        x_aprox = [x_aprox; c_i];
        break;
      end
      j = j + 1;
      if sign(f(c_i)) == sign(f(a_i))
        a_i = c_i;
      else
        b_i = c_i;
      end
    end
  end
end
