%METODO DE ELIMINACAO DE GAUSS POR PIVOTAMENTO

%ENTRADA 1: Matriz de coeficientes do sistema de equacoes...
A = [3 -4 8 2 7;1 0 4/9 2 2;6 1 1 13 -8;0 0 0 4 2;2 8 -2 -2 0];

%ENTRADA 2: Vetor COLUNA correspondente ao segundo termo das equacoes
b = [1;-1;2;4;5]; % formato [a;b;c;d]
eliminacao = true;
trocou = false;

%1 - Checar se a matriz eh quadrada
if (size(A)(1) == size(A)(2))
  %proceder
  printf("Matriz valida!\n");
  pause(1);
  clc;
  C = [A b]; %Inicializando a matriz C = [A/b]
  n_c = size(C)(2); % quantidade de colunas da matriz C
  n = n_c - 1; % quantidade de colunas da matriz A

  for i = 1:n
   % eliminacao = true; %inicializando o controlador de eliminacao como true
    if(C(i,i)==0 && i<n)
     % trocou = false; %inicializando o controlador de troca como false
      for j=i+1:n
        if(C(j,i) != 0)
        %----- PERMUTACAO ENTRE LINHAS ---------%
          aux = C(i,:);
          C(i,:) = C(j,:);
          C(j,:) = aux;
          trocou = true; % controlador para avisar que houve troca de linha
          break;
        endif
      endfor
      eliminacao = trocou;
    endif
    if(i==n)
      if(C(i,i) == 0)
        eliminacao = false;
      endif
    endif
    if(eliminacao == true)
      if( C(i,i)!= 1 )
        C(i,:) = C(i,:) / C(i,i) ;
      endif
      for j = 1:n
        if (j != i)
          C(j,i:n_c) = -C(j,i)*C(i,i:n_c) + C(j,i:n_c);
        endif
      endfor
    endif
  endfor
  %Verificacao dos tipos de solucao obtida
  nulas = false;
  tipoSol = 0;
  for i = n:-1:1
    if (norm(C(i,1:n)) == 0)
      nulas  = true;
      if(C(i,n_c) != 0 && tipoSol == 0)
        tipoSol = -1; %Sistema Impossivel
        break;
      endif
    endif
  endfor

  if(nulas == true && tipoSol == 0)
    tipoSol = 1; % Sistema Possivel Indeterminado
  endif

  if (nulas == false && tipoSol == 0)
    tipoSol = 2; %Sistema Possivel Determinado
  endif
else
  printf("A matriz nao eh quadrada!\n");
endif

%HORA DE PRINTAR A SOLUCAO
if(tipoSol == -1)
  printf("Sistema Impossivel!\n");
elseif(tipoSol==1)
  printf("Sistema possivel Indeterminado\n");
else(tipoSol==2)
  printf("Solucao encontrada!\n");
  C
  printf("\n");
  for i=1:n
    printf("x%d=%.3f\n",i,C(i,n_c));
  endfor
  endif

