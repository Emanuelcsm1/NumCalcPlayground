function S=Soma(a,h,N);
S=a;
for i= 1:N
 S= S+h;
 end
 fprintf('A soma é %.4f\n\n',S)

 s=a;
 k = 0;

 while k <N
   k= k+1;
   %k +=1;

   S += h;

 end
 fprintf('A soma é %.4f!\n\n', S)
end
