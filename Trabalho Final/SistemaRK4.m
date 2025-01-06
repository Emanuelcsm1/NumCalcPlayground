function [t, y] = SistemaRK4(f, a, b, y0, h)
    n = length(y0); % Número de equações diferenciais
    t = a:h:b; % Pontos de tempo para as aproximações das soluções das EDOs
    if t(end) < b
        t = [t, b]; % Adiciona o último tempo de análise se necessário
    end

    m = length(t); % Número de pontos para as aproximações das EDOs

    y = cell(m, 1); % Matriz para armazenar as aproximações das soluções do sistema


    y{1} = y0; % Condições iniciais

##    k1 = zeros(m,1)
##    k2 = zeros(m,1)
##    k3 = zeros(m,1)
##    k4 = zeros(m,1)
##    phi = zeros(m,1)


    for i = 1:(m - 1)
        h = t(i + 1) - t(i); % Comprimento de passo
        k1 = f(t(i), y{i}); % Cálculo de k1 para cada equação do sistema
        k2 = f(t(i) + h/2, y{i} + h/2 * k1); % Cálculo de k2 para cada equação do sistema
        k3 = f(t(i) + h/2, y{i} + h/2 * k2); % Cálculo de k3 para cada equação do sistema
        k4 = f(t(i) + h, y{i} + h * k3); % Cálculo de k4 para cada equação do sistema
        phi = (k1 + 2*k2 + 2*k3 + k4)/6; % Cálculo de phi para cada equação do sistema
        y{i + 1} = y{i} + h * phi; % Cálculo das aproximações das soluções do sistema
    end
end
