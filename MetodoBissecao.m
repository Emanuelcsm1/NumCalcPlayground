%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MÉTODO DA BISSECÇÃO
%
%ENTRADAS
%  xl-> lower bound do intervalo (valor inferior)
%  xu -> upper bound do intervalo (valor superior)
%  es -> erro máximo fornecido pelo usuário
%  f -> função a ser calculada a raiz
%  maxIt -> máximo de iterações (pode ou não ser fornecido)
%
%SAÍDAS
%  n-> numero de iterações a serem realizadas
%  fval -> valor da função na aproximação da raiz
%  ni -> numero de iterações
%  ea -> erro aproximado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [n, xr, fval, ni, ea] = MetodoBissecao (xl, xu, es, f, maxIt)
  %  Condicional para verificar se vamos calcular somente
  % o número de iterações necessárias para atingir o erro solicitatado

  if nargin < 4
    %CALCULA O NUMERO DE ITERAÇOES MÁXIMO

    deltax = xu -xl;
    n= log2(deltax/es);

%SAÍDAS

    xr= []; fval = []; ni= []; ea= [];
  else
    %O USUÁRIO PASSOU MAIS MAIS DE 4 ENTRADAS, DEVEMOS INC
    if nargin < 5
      %INICIALIZA O MÁXIMO
      maxIt = 50;
    end


    %INICIALIZA O NUMERO DE ITERAÇÕES
    ni = 0;

    %INICIALIZA O ERRO
    ea = inf;


    %CRIAÇÃO DE VARIÁVEL DE SUPORTE
    xold = xl;


    %LAÇO QUE FARÁ O SOMATÓRIO DA FUNÇÃO E O CÁLCULO DO ERRO
    while (ea >es) && (ni < maxIt)
      %ATUALIZAÇÃO DE NI
      ni += 1;

      %CALCULO DA PRÓXIMA ITERAÇÃO ( APROXIMAÇÃO DE RAÍZ)
     xr = (xl+xu)/2;
      %VARIÁVEL DE TESTE
      teste =  f(xl) * f(xr);

      %VERIFICAÇÃO SE f(xl)*f(xr)<0
        if teste < 0
          xu=xr;
        elseif teste >0
          xl=xr;
        else
          %ACHAMOS A RAIZ, É O PRÓPRIO XR
          n= [];
          fval = f(xr);
          ea= 0;

      %SAIDAS NA TELA DOS VALORES DA FUNÇÃO
      fprintf("iteração %d!\n", ni);
      fprintf("Raiz aproximada: %.10f!\n", xr);
      fprintf("Valor da função: %.10f!\n", fval);
      fprintf("Erro de aproximação: %.2e!\n\n", ea);
      endif

      %CALCULANDO O ERRO DE APROXIMAÇÃO
      if abs(xr) < 1e-12
      ea = abs(xr-xold);
    else
      ea = abs((xr-xold) / xr);
    endif


      xold =xr;
      fval = f(xr);
      n= [];

      %SAIDAS NA TELA DOS VALORES DA FUNÇÃO
      fprintf("iteração %d!\n", ni);
      fprintf("Raiz aproximada: %.10f!\n", xr);
      fprintf("Valor da função: %.10f!\n", fval);
      fprintf("Erro de aproximação: %.2e!\n\n", ea);




  end
  end
  end
