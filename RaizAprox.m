function [x, ni, ep] = RaizAprox(a, x0, es, maxIt)
  if nargin < 4
    maxIt = 50;
  end

  ep= inf;
  ni = 0;
  xOld = x0;

  while (ep > es) && (ni < maxIt)
      ni = ni+1
      x = (xOld + a/xOld)/2;
      ep= abs((x-xOld)/x);
      xOld = x;
  end
end

