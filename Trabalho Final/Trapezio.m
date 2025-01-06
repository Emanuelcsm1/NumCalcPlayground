%FUNCAO PARA CALCULO DA REGRA DO TRAPEZIO
function I = Trapezio(a,b,f,n_pontos)
  %f eh um vetor com os pontos da funcao integrando
  %a eh o valor inferior da integral
  %b eh o valor superior da integral
  %n_pontos eh a quantidade de pontos
  Soma = 0;
  if (a==b)
    I = 0; % pois a area eh zero.
  elseif(a>b)
    aux = b;
    b = a;
    a = aux;
    h = (b - a)/(n_pontos-1);
    for i =1:n_pontos
      if(i==1 || i==n_pontos)
        Soma = Soma + f(i);
      else
        Soma = Soma + 2*f(i);
      endif
    endfor
    I = Soma * (h/2);
    %MULTIPLICAR A INTEGRAL FINAL POR -1
  else
    %prosseguir normalmente
    h = (b - a)/(n_pontos-1);
    for i =1:n_pontos
      if(i==1 || i==n_pontos)
        Soma = Soma + f(i);
      else
        Soma = Soma + 2*f(i);
      endif
    endfor
    I = Soma * (h/2);
  endif
endfunction
