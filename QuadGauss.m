function I = QuadGauss(f,a,b,n)
% Chamada da função que armazena os pontos e pesos da quadratura
% w -> pesos da função, x -> pontos da quadratura
[w, x] = PontosGauss(n);

% Cálculo do valor do Determinante da Jacobiana
dJ = (b-a)/2;

% Mudança de escala para os valores de x
xi = dJ*x + (b+a)/2;

% Cálculo da Integral
I = sum(w .* f(xi)) * dJ;
end
