close all
clear
clc

f1 = @(t, y1, y2) y2;
f2 = @(t, y1, y2) (10^-2) .* exp(-0.8 .* t) - 2 .* (sqrt(2) / 10) .* 4 .* sqrt(2) .* y2 - ((4 .* sqrt(2)).^2) .* y1;

f = {f1,f2};
a = 0;
b = 3;
t0 = 0;
y1_0 = 0.14;
y2_0 = 0.028;
y0 = [y1_0, y2_0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Letra b)

h = 0.6;
[t, y] = SistemasRK4(f, a, b, y0, h)
yp= y(:,1);
y2p= y(:,2);

h = 0.3;
[t1, y1] = SistemasRK4(f, a, b, y0, h)
yp1= y1(:,1);
y2p1= y1(:,2);

h = 0.2;
[t2, y2] = SistemasRK4(f, a, b, y0, h)
yp2= y2(:,1);
y2p2= y2(:,2);

h = 0.1;
[t3, y3] = SistemasRK4(f, a, b, y0, h)
yp3= y3(:,1);
y2p3= y3(:,2);

h = 0.01;
[t4, y4] = SistemasRK4(f, a, b, y0, h)
yp4= y4(:,1);
y2p4= y4(:,2);



figure(1)
hold on
grid on
box on
p = plot (t,yp,'-b')
p1 = plot (t1,yp1,'-m')
p2 = plot (t2,yp2,'-c')
p3 = plot (t3,yp3,'-r')
p4 = plot (t4,yp4,'-g')
lgd = legend([p,p1,p2,p3,p4],{"h=0,6","h=0.3","h=0.2","h=0.1","h=0.01"});


figure(2)
hold on
grid on
box on
p2 = plot (t,y2p,'-b')
p21 = plot (t1,y2p1,'-m')
p22 = plot (t2,y2p2,'-c')
p23 = plot (t3,y2p3,'-r')
p24 = plot (t4,y2p4,'-g')
lgd = legend([p2,p21,p22,p23,p24],{"h=0,6","h=0.3","h=0.2","h=0.1","h=0.01"});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Letra c)

##tt = 0:h:3;  % Intervalo de tempo desejado com um passo de 0.01
##yex = @(tt) exp(-0.8.*tt)/78400 .* (1960.*sin(5.06.*tt) + 10951.*cos(5.6.*tt) + 25);
##
##yy = yex(tt);  % Avalia a função yex em cada ponto de tt
##plot(tt, yy)




