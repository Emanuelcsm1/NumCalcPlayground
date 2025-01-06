function y = fdet(t)
  if t < 0
    fprintf("O valor de t está fora do domínio da função \n");
    y = [];
    return
  end

  k = 4;

  if t < 2
    y = 40 * (t^5) * exp(-3*t);
  elseif t < 5*pi/4 + 2
    y= k*cos(2*t - 4);
  else
    y = 0;
  end

  end

