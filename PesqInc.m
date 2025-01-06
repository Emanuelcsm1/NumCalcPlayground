%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método da Pesquisa Incremental
%
% Entradas:
%   f -> função a se verificar as raízes
%   xl -> lower bound do intervalo (limite inferior)
%   xu -> upper bound do intervalo (limite superior)
%   h -> incremento (espaçamento do intervalo)
%
% Saídas:
%   ni -> número de intervalos que contém raiz
%   I -> intervalos que contem raízes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ni, I] = PesqInc(f, xl, xu, h)
% Inicializar os valores de xa e xb
xa = xl;
xb = xa + h;

% Inicialização do ni e do I
ni = 0;
I = [];

% Laço que percorrerá os intervalos
while true
  if f(xa) * f(xb) < 0
    % Atualiza o número de intervalos que contém raízes
    ni += 1;
    % Armazena o intervalo que contém raiz
    I = [I; [xa, xb]];
  endif

  % Atualização do xa
  xa = xb;

  % Condicionante para verificar se xa = xu
  if xa == xu
    break;
  endif

  % Atualização do xb
  xb = xa + h;

  % Limite do valor de xb
  if xb > xu
    xb = xu;
  endif
end

% Apresentação dos resultados na tela
fprintf("Achamos %d intervalos que contém raízes!\n", ni)
fprintf("Os intervalos que contém raízes são:\n")
fprintf("\tI = [\n")
for i = 1:ni
  fprintf("\t     ")
  fprintf("%.6f  ", I(i, :))
  fprintf("\n")
end
fprintf("\t     ]\n\n")
end









