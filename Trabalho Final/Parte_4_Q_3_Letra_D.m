%LETRA D
% A IDEIA EH APLICAR O METODO DE NEWTON PARA ACHAR AS 5 RAIZES PARA AS FUNCOES DE BESSEL DE ORDEM 0,1,2 E 3.
clear;
clc;
Input = [2.3 5.5 8.5 11.8 15;0 3.6 7 10 13; 0 5 8.5 11.7 15;0 6.2 10 12.7 16.3]; % coletados aproximado pelo grafico
Output = zeros(4,5); % armazena as raizes encontradas
for n = 0:3;
  printf("Curva de bessel ordem %d\n",n);
 % n_iter = 0; % inicializando o numero de iteracoes
 % delta_x = 1; % inicializando o "erro" entre iteracoes
  for i=1:5 %para a raiz i da curva n de Bessel
   cont = 1; % inicializando o numero de iteracoes
   delta_x = 1; % inicializando o "erro" entre iteracoes
   x = zeros(1,20);
   x(1)= Input(n+1,i); % estimativa inicial
    while(cont <=16 && delta_x>1e-14) %16 porque eh 15 +1
      printf("Iteracao %d\n",cont);
      d_x =  cos(x(cont)*sin(x(cont)) -n*x(cont)) * (sin(x(cont))+x(cont)*cos(x(cont)) - n);
      x(cont+1) = x(cont) - (IntRomberg(0,pi,x(cont),n))/d_x;

      delta_x = x(cont+1) - x(cont);

      cont = cont + 1;
    endwhile
    Output(n+1,i) = x(cont);
    printf("Raiz %d = %.8f\n",i,x(cont));
  endfor
endfor

