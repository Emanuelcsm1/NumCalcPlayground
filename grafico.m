function y = grafico(H)


H = 0:0.5:4;

  y = 4.4294*sqrt(H).*tanh(1.3842*sqrt(H))-5;
  plot(H, y);
  xlabel('H');
  ylabel('f(H)');
  title('Gráfico da função f(H)');

  % Encontra a raiz de f(H) usando fzero
  H_raiz = fzero(@funcao_raiz, [0, 4]);
  f_H_raiz = 4.4294*sqrt(H_raiz).*tanh(1.3842*sqrt(H_raiz))-5;

  % Plota o ponto vermelho na raiz encontrada
  hold on;
  plot(H_raiz, f_H_raiz, 'ro');
endfunction

function y = funcao_raiz(H)
  y = 4.4294*sqrt(H).*tanh(1.3842*sqrt(H))-5;
endfunction

grafico(H);

