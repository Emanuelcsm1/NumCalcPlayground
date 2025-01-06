%LETRA B

%QTD DE VEZES QUE QUE A FUNCAO DO INTEGRANDO EH CALCULADO
%FUNCAO DE BESSEL DE ORDEM 0 (N=0) VS REGRA 1/3 DE SIMPSON
%ERRO PRECISA SER MENOR QUE 1E-12
x = 0:1e-2:20; % pontos de x que estao sendo analisados

% ------------------------OBSERVACAO ---------------------%
%a questao fala para comparar quantas iteracoes sao necessarias em cada metodo
%de modo que o erro final seja menor que 1e-12
%entao porque a questao define um h, se esse h eh variavel com a quantidade de iteracoes
err_simpson = 1e-12; % constante de erro
err_simpson_calculado = 1; % inicializacao do erro calculado
n_int = zeros(2,size(x)(2));% Matriz para guardar o numero de iteracoes utilizada para cada metodo

a = 0;
b = pi;
%f = ? -> eh definido dentro de cada metodo, pois o tamanho varia com o numero de pontos


%------------------------- TESTE PARA SIMPSON 1/3----------%
for i = 1:size(x)(2);
  n_pontos = 3; % inicializando numero de pontos que vai aumentando a cada vez
  err_simpson_calculado = 1; % inicializacao do erro calculado
  while(err_simpson_calculado > err_simpson)
    printf("%d",n_pontos);
    theta = linspace(a,b,n_pontos);
    f = cos(x(i)*sin(theta));
    [I,err_simpson_calculado] = Simpson(a,b,f,n_pontos);
    printf("Err = %f\n",err_simpson_calculado);
    %system("pause");
    if(err_simpson_calculado < err_simpson)
      n_int(1,i) = n_pontos;
      printf("proximo ponto");
     % system("pause");
    else
      n_pontos = n_pontos + 1;
      printf("Aumentar a resolucao\n");
      %system("pause");
    endif
  endwhile
endfor

%----------------------- TESTE PARA INTEGRACAO DE ROMBERG
for i = 1:size(x)(2)
  [Int,count] = IntRomberg(a,b,x(i),0);
  n_int(2,i) = count;
endfor

%-------------------------FIM DO ALGORITMO------------------------------
%VIDE A TABELA n_int:
%             |0|0.1|0.2|0.3|............................................|20|
%Simpson(1/3) |x| x | x | x |................................................
%IntRomberg   |y| y | y | y |.................................................

