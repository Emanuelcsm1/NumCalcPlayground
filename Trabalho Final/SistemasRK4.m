function [t, y] = SistemasRK4(f, a, b, y0, h)
    n = length(y0); % Número de equações diferenciais

    t = a:h:b; % Pontos de tempo para as aproximações das soluções das EDOs

    if t(end) < b
        t = [t, b]; % Adiciona o último tempo de análise se necessário
    end

    m = length(t); % Número de pontos para as aproximações das EDOs

    y = zeros(m, n); % Matriz para armazenar as aproximações das soluções do sistema

    y(1, :) = y0; % Condições iniciais

    for i = 1:(m - 1)
        h = t(i + 1) - t(i); % Comprimento de passo

        k1 = f{1}(t(i), y(i, 1), y(i, 2)); % Cálculo de k1 para a primeira equação do sistema
        l1 = f{2}(t(i), y(i, 1), y(i, 2)); % Cálculo de k1 para a segunda equação do sistema

        k2 = f{1}(t(i) + h/2, y(i, 1) + h/2 * k1, y(i, 2) + h/2 * l1); % Cálculo de k2 para a primeira equação do sistema
        l2 = f{2}(t(i) + h/2, y(i, 1) + h/2 * k1, y(i, 2) + h/2 * l1); % Cálculo de k2 para a segunda equação do sistema

        k3 = f{1}(t(i) + h/2, y(i, 1) + h/2 * k2, y(i, 2) + h/2 * l2); % Cálculo de k3 para a primeira equação do sistema
        l3 = f{2}(t(i) + h/2, y(i, 1) + h/2 * k2, y(i, 2) + h/2 * l2); % Cálculo de k3 para a segunda equação do sistema

        k4 = f{1}(t(i) + h, y(i, 1) + h * k3, y(i, 2) + h * l3); % Cálculo de k4 para a primeira equação do sistema
        l4 = f{2}(t(i) + h, y(i, 1) + h * k3, y(i, 2) + h * l3); % Cálculo de k4 para a segunda equação do sistema

        y(i + 1, 1) = y(i, 1) + h/6 * (k1 + 2*k2 + 2*k3 + k4); % Cálculo das aproximações das soluções da primeira equação do sistema
        y(i + 1, 2) = y(i, 2) + h/6 * (l1 + 2*l2 + 2*l3 + l4); % Cálculo das aproximações das soluções da segunda equação do sistema
    end
