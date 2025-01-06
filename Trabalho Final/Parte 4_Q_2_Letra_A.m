%CORRESPONDE A RESPOSTA DA LETRA A

n = [0 1 2 3]; %ordens de funcao de Bessel
x = 0:0.1:20; %intervalos de x para teste
values = zeros(size(n)(2),size(x)(2));
for i=1:size(n)(2)
  for j = 1:size(x)(2)
    values(i,j) = IntRomberg(0,pi,x(j),n(i));
  endfor
  plot(x,values(i,:));
  hold on
endfor
