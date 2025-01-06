%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% QUESTÃO 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ALUNO: EMANUEL CASTRO MIRANDA
% CURSO ; ENGENHARIA ELÉTRICA

% CÁLCULO DE FUNÇÃO E DERIVADA
function [f, dfdx] = quest4Emanuel(x, a, b)


  %CONDIÇÃO DE DOMÍNIO
  if x<-2 || x>2
    fprintf("O valor de x está fora do domínio da função \n");
     [f] = [];
     [dfdx] = [];
    return
  end

  %FUNÇÃO E DERIVADA PARA X<0
  if x<0
    f = log(x^2-2*x)-a*x^3+b*x;
    dfdx = 2/(x-2) - 3*a*x^2 + b;

  %FUNÇÃO E DERIVADA PARA X>=0
  elseif x>=0
    f = 25*x^4-105*x^3+23*b*x^2-28*a*x;
    dfdx = 100*x^3 - 315*x^2 + 46*b*x - 28*a;
  endif

  end

