function q = carga(t)
  L = 5;           % em H
  R = 400;         % em ohms
  C = 5e-6;        % em F
  q0 = 2*C;        % em C
  CV0 = 220;       % em V
  t = 0:0.01:0.2;

  omega = sqrt(1/(L*C) - R^2/(4*L^2));
  phi = atan(R/(L*sqrt(4/(C*L) - R^2/L^2)));

  A = (q0 - CV0)/(sqrt(1 - C*R^2/(4*L)));
  q = A*exp(-R*t/(2*L)) * cos(omega*t - phi) + CV0;
endfunction
