function [x_aprox] = busca_raizes(f, a, b, dx, max_it, tol, max_rec)
    fa = f(a);
    fb = f(b);

    x_aprox = [];
    i = 1;

    if sign(fa) == sign(fb)
        return
    end

    while i <= max_it && (b-a)/2 > tol
        c = a + dx;
        fc = f(c);

        if fc == 0
            x_aprox = [x_aprox, c];
        elseif sign(fa) ~= sign(fc)
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end

        % Adicionar condicional para limitar o número de chamadas recursivas
        if max_rec > 0 && i == 1
            x_aprox = [x_aprox, busca_raizes(f, a, b, dx, max_rec-1, tol, max_rec-1)];
        end

        i = i + 1;
    end

    x_aprox = [x_aprox, (a+b)/2];
end

% Definir uma função aleatória
function y = f(x)
    y = x.^3 - 4*x.^2 + 3*x - 2;
end

% Chamar a função busca_raizes
[x_aprox] = busca_raizes(@f, -10, 10, 0.1, 50, 10e-5, 5);
disp(x_aprox)
