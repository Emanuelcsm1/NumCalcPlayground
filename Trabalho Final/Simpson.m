%INTEGRAL DA REGRA DE SIMPSON
function [I,erro] = Simpson(a,b,f,n_pontos)
  %f eh um vetor com os pontos da funcao integrando
  %a eh o valor inferior da integral
  %b eh o valor superior da integral
  %n_pontos eh a quantidade de pontos
  Soma = 0;
  if (a==b)
    I = 0; % pois a area eh zero.;
  else
    %prosseguir normalmente
    h = (b - a)/(n_pontos-1);
    for i =1:n_pontos
      if(i==1 || i==n_pontos)
        Soma = Soma + f(i);
      elseif(mod(i,2)==0) %par
        Soma = Soma + 2*f(i);
      else
        Soma = Soma + 4*f(i);
      endif
    endfor
    I = Soma * (h/3);
    %calculo do erro especificamente para a letra B
    %erro = max (diff(f,4)/power(h,4)) - FORMULA ERRADA!!! O ERRO TENDE A AUMENTAR COM O h diminuindo...
    erro  = max(abs(diff(f,4)*power(h,5)/90));
  endif
endfunction
