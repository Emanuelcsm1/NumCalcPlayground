%% Metodo de Integracao de Romberg para as funcoes de nivel de bessel
function [Int,count] = IntRomberg(a,b,x,n)
%ENTRADAS

%a = 0; % valor minimo da integral
%b = 1; % valor maximo da integral
e_a = Inf; %inicializando o erro igual a infinito
j = 0; %inicializando j;
k = 1; %inicializando k;

theta = linspace(a,b,power(2,1));
count = power(2,1);
f = cos(x*sin(theta) - n*theta)/pi; %pontos conhecidos. Exemplo f = power(x,3)

I = zeros(1,1); %inicializando a matriz de integrais com 1 linha e uma coluna
I(1,1) = Trapezio(a,b,f,power(2,1)); %regra do trapezio
%printf("I11=%.5f\n",I(1,1)); debug

if(a==b)
  Int = 0;
  %printf("Valor da integral = %.5f\n",Integral); debug
else
  %prossiga normalmente
  while e_a > 1e-12
    j = j + 1;
    %nesse momento, deve-se calcular I(j+1,k).
    add_uma_coluna = zeros(size(I)(2),1);
    I = [I add_uma_coluna]; %concatenando matriz para ter onde guardar os dados
    add_uma_linha = zeros(1,size(I)(2));
    I = [I;add_uma_linha];
    %nesta parte a matriz I esta pronta para receber mais dados.

    theta = linspace(a,b,power(2,j+1));


    f = cos(x*sin(theta) - n*theta)/pi;
    count = count + size(f)(2);

    I(j+1,1) = Trapezio(a,b,f,power(2,j+1)); % calculando pelo metodo do trapezio
    %printf("I%d%d=%.5f\n",j+1,1,I(j+1,1)); debug

    for k =2:j+1
      aux = 2 + j - k;
      I(aux,k) = ( (power(4,k-1) * I(aux +1 ,k-1)) - I(aux,k-1) ) / (power(4,k-1) - 1 );
     % printf("I%d%d=%.5f\n",aux,k,I(aux,k)); debug
    endfor

    %nesta etapa, deve-se calcular o erro
    e_a = abs(( I(1,k) - I(2,k-1) )/ I(1,k));
  endwhile
  Int = I(1,size(I)(2));
  %printf("Metodo de Integracao de Romberg\n");
  %printf("Vezes que f foi calculada: %d",count); %debug
  if(a>b)
    Int = - Int;
   % printf("Valor da integral = %.5f\n",Integral); debug
  endif
 endif
