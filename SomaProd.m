function[S,P] = SomaProd(a,b,p)

if nargin<3
  p=1;
end

S=p*(a+b)
P=a*b

fprintf('O peso é %.f!\n',p)
fprintf('A soma é %.f!\n',S)
fprintf('O produto é %.f!\n\n',P)
end



