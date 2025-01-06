%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   NÃƒO ALTERE ESSAS LINHAS ATÃ‰ A LINHA DE IGUAIS "=="
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear
clc

constFeig = 4.669201609102990;    % Valor "exato" da constante de Feigenbaum
nBifurcacoes = 14;                % NÃºmero mÃ¡ximo de bifurcaÃ§Ãµes calculadas
delta = zeros(nBifurcacoes, 1);   % Inicializa a variÃ¡vel que armazenarÃ¡ os deltas (ConstFeigenbaum)
delta(1) = 5;                     % Inicializa o primeiro valor de delta
erro = zeros(nBifurcacoes, 1);    % Inicializa a variÃ¡vel que conterÃ¡ os erros de aproximaÃ§Ã£o
erro(1) = abs((constFeig-delta(1))/constFeig)*100;  % CÃ¡lculo do primeiro erro de aproximaÃ§Ã£o
%===================================================================================================
%   EDITE SEU CÃ“DIGO A PARTIR DESTA LINHA
m = zeros (nBifurcacoes+1,1); %MATRIZ COM OS VALORES DE M
m(1) = 2; %m0
m(2) = 1 + sqrt(5); %m1
for n=3:nBifurcacoes+1; %iterando para os (n-1) - ciclos
  m(n) = m(n-1)  + ((m(n-1) - m(n-2))/delta(n-2)); %aproximacao inicial para m
  printf("N=%d --- valor de m inicializado em %f\n",n-1,m(n));
  pause();
  for i = 1:10 %iterando 10 iteracoes no metodo de newton
    x=0.5; %VALOR INICIAL DE X  PARA COMECAR A ITERAR O N-CICLO
    dx=0;  %VALOR INICIAL DE DX  PARA COMECAR A ITERAR O N-CICLO
    printf("Inicializando x=%f e dx = %f\n",x,dx);
    %pause();
    for k = 1:2^(n-1)
      dx = (x * (1-x)) +  (m(n) * dx * (1 - 2*x));
      x = (m(n) * x * (1-x));
      printf("k=%d --- x = %f e dx = %f\n",k,x,dx);
     % pause();
    endfor
    dm = (x-0.5)/dx;
    m(n) = m(n) - dm;
    printf("Iteracao %d ----  m=%f\n",i,m(n));
    %pause();
  endfor
  delta(n-1) = (m(n-1) - m(n-2)) / ( m(n) - m(n-1) );
  erro(n-1) = abs((constFeig-delta(n-1))/constFeig)*100;
endfor
% EDITE SEU CÃ“DIGO SOMENTE ATÃ‰ ESTA LINHA
%===================================================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   NÃƒO EDITE NADA A PARTIR DESTA LINHA
f = figure ("position", [30,30,700,450]);
movegui(f, "center")
delta = cat(1, 0, delta);
erro = cat(1, inf, erro);
ciclo = arrayfun(@(n){sprintf("2^%d", n)}, (0:nBifurcacoes)');
mtext = arrayfun(@(n){sprintf("%.9f", n)}, m);
deltaText = arrayfun(@(n){sprintf("%.15f", n)}, delta);
erroText = arrayfun(@(n){sprintf("%.4e", n)}, erro);
col_names = { "Ciclo", "m_n", "Delta", "Erro (%)"};
d = [ciclo, mtext, deltaText, erroText];
t = uitable (f, "Data", d, "ColumnName", col_names);
set(t, "columnwidth", {150,150,150,150})
p = get (t, "Position");
e = get (f, "position");
p(3:4) = e(3:4)*0.9;
set(t, "Position", p);
