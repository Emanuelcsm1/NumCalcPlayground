%% Dados de ENTRADA
p0=20; p1=25;
N=30; tol=0.5e-6;

% Declarando a função  g(x) tal que g(x)=x-f(x)
%f=10 -x^3;
%df= -3*x^2;
function y = f(t0)
	y= (2*t0/1.5) * sinh(1.5*30/(2*t0)) - 33;
end

%% PASSO 1
i=1;
q0=f(p0);
q1=f(p1);
%% PASSO 2
while (i<=N)
	%% PASSO 3
	p=p1-q1*(p1-p0)/(q1-q0);
	printf("p(%d) = %f\n",i,p);
	%% PASSO 4
	if  (abs(p-p0)<tol)
		printf("A solucao aproximada é : %f\n",p);
		break
	else
		%% PASSO 5
		i=i+1;

		%% PASSO 6
		p0=p1;
		q0=q1;

		p1=p;
		q1=f(p);

	end
end
%% PASSO 7
if (i==N) && (abs(p-p0)>=tol)
	printf("O método falhou após %d iterações.\n",N);

end
