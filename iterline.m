%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     MÉTODO ITERATIVO LINEAR
%
% ENTRADAS
%   x0 -> valor inicial para começar a iteração
%   es -> erro relativo desejado
%   imax -> numero máximo de iterações permitido
%   iter -> exibir ou ñ nro de iterações (true/false)
%   ea -> erro relativo atual
%
% SAÌDAS
%   xr -> raiz aproximada
%   iter -> numero de iterações realizadas
%   ea -> erro relativo final
%me
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xr, iter, ea] = iterline(g, x0, es, imax)

  %CONDICIONAIS NARGIN E VALORES PADRÕES CASO O USUÁRIO NN PASSE
  if nargin<2 || isempty(x0), x0 = 0; end
  if nargin<3 || isempty(es), es = 0.0001; end
  if nargin<4 || isempty(imax), imax = 50; end  %NRO MÁXIMO DE ITERAÇÕES SETADO EM 50!


  %INICIALIZA VARIÁVEIS
  xr = x0;
  iter = 0;
  ea = 100;

  %INÍCIO DO LOOP ITERATIVO LINAR
  while (1)
    xrold = xr;
    xr = g(xrold);
    iter = iter + 1;

  %CÁLCULO DO ERRO RELATIVO
    if xr < 10e-12
      ea = abs((xr - xrold)) * 100;
    else
      ea = abs((xr-xrold)/xr)* 100;
    end

   %MOSTRAR VALORES NA TELA
       %SAIDAS NA TELA DOS VALORES DA FUNÇÃO
fprintf("Raiz estimada: %f\n", xr);
fprintf("Erro relativo: %f%%\n", ea);
fprintf("Número da iteração: %d\n", iter);
   %VERIFICAÇÃO DO ERRO E NRO DE ITERAÇÕES
    if ea <= es || iter >= imax
      break
    end
  end
end






