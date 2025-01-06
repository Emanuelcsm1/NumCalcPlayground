%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNÇÃO EXPONENCIAL
%
%ENTRADAS
%  x-> valor para calculo de f(x)= exp(x)
%  es -> erro máximo fornecido pelo usuário
%  maxIt -> máximo de iterações (pode ou não ser fornecido)
%
%SAÍDAS
%  f-> valor da função
%  ni -> numero de iterações
%  ea -> erro aproximado (calculado pelo código)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [f, ni, ea] = ExpEmanuel (x, es, maxIt)
%DEFINIÇÃO DO NUMERO MÁXIMO DE ITERAÇÕES
if nargin < 3
  %INICIALIZA O MÁXIMO
  maxIt = 30;
end
%INICIALIZA O CÁLCULO DA FUNÇÃO EXPONENCIAL
f=1;

%INICIALIZA O NUMERO DE ITERAÇÕES
ni = 1;

%INICIALIZA O ERRO
ea = inf;


%CRIAÇÃO DE VARIÁVEL DE SUPORTE
fold = f;

% SAIDA NA TELA DOS VALORES INICIAIS
    fprintf("iteração %d!\n",ni);
    fprintf("Valor da função: %.10f!\n", f);
    fprintf("Erro de aproximação: %.2e!\n\n", ea);

%LAÇO QUE FARÁ O SOMATÓRIO DA FUNÇÃO E O CÁLCULO DO ERRO
while (ea >es) && (ni < maxIt)
    %CALCULO DO SOMATÓRIO DA FUNÇÃO
    f = f + (x^ni) / factorial(ni);

    %ATUALIZA O ni
    ni+= 1;

    %CALCULO DO ERRO
    if abs(f) < 1e-12
      ea = abs(f-fold);
    else
      ea = abs((f-fold) / f);
    endif

    %ATUALIZAÇÃO DO FOLD
    fold = f;

    %SAIDAS NA TELA DOS VALORES DA FUNÇÃO
    fprintf("iteração %d!\n", ni);
    fprintf("Valor da função: %.10f!\n", f);
    fprintf("Erro de aproximação: %.2e!\n\n", ea);

end
end

