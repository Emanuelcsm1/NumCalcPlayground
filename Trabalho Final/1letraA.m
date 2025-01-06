clear
clc
% Parâmetros do problema
L = 5;           % em H
R = 400;         % em ohms
C = 5e-6;        % em F
q0 = 2;        % em C
V0 = 220;       % em V
% Função q(t)
f = @(t) ((q0 - C*V0) / sqrt(1 - (C*R^2 / (4 * L)))) .* exp((-R .* t) / (2 * L)) .* cos(t .* sqrt((1 / (L * C)) - ((R^2) / (4 * (L^2)))) - atan(R / (L * sqrt((4 / (C * L)) - ((R^2) / (L^2)))))) + C*V0;

 t = [0:0.001:0.2]

 plot(t,f(t))


% Valor de cruzamento
q_5_percent = 0.05 * q0;

% Define o tamanho do passo da pesquisa incremental e os limites de t
h = 5e-6;
t_min = 0;
t_max = 0.2;

% Inicializa os intervalos
t_a = t_min;
t_b = t_a + h;

% Inicialização do contador de intervalos e do vetor I
interval_count = 0;
I = [];

% Laço que percorrerá os intervalos
while true
  % Verifica se há mudança de sinal na diferença (cruzamento)
  if (f(t_a) - q_5_percent) * (f(t_b) - q_5_percent) < 0
    % Atualiza o número de intervalos que contêm cruzamentos
    interval_count = interval_count + 1;
    % Armazena o intervalo que contém o cruzamento
    I = [I; [t_a, t_b]];
    MetodoBissecao (t_a, t_b, 05e-7, f,50)
  end

  % Atualização do t_a
  t_a = t_b;

  % Condicionante para verificar se t_a = t_max
  if t_a == t_max
    break;
  end

  % Atualização do t_b
  t_b = t_a + h;

  % Limite do valor de t_b
  if t_b > t_max
    t_b = t_max;
  end

end

% Apresentação dos resultados na tela
fprintf("Achamos %d intervalos que contêm cruzamentos!\n", interval_count)
fprintf("Os intervalos que contêm cruzamentos são:\n")
fprintf("\tI = [\n")
for i = 1:interval_count
  fprintf("\t     ")
  fprintf("%.6f  ", I(i, :))
  fprintf("\n")
end
fprintf("\t     ]\n\n")


