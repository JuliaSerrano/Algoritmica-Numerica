clear;
clc;
    
    %Ejercicio 1
xi = [0 1 2]';
fi = [18.9 14.5 17.9]';

    %1.1
%p1(x) grado 2 a +bx +cx^2
H1 = [xi.^0 xi.^1 xi.^2];
b1 = fi;
c1 = H1\b1;
size(H1);

    %1,2
x = 1.35;
val_est = c1(1) + c1(2).*x +c1(3).* x.^2; %profundidad de 14.8027


    %Ejercicio 2
xx = [0:0.2:2]';
fxx = [18.9 17.9 17.10 16.30 15.20 14.50 15.30 15.90 16.30 17.30 17.90]';

%p2(x) grado 2 minimos cuadrados
%a +bx +cx^2    3 params
    %2.1
H2 = [xx.^0 xx.^1 xx.^2];
size(H2);
b2 = fxx;
c2 = H2\b2;

    %2.2
%grafica
x_aux = -0.5:0.01:2.5;
yy1 = c1(1) + c1(2)*x_aux.^1 + c1(3) *x_aux.^2;
yy2 = c2(1) + c2(2)*x_aux + c2(3) *x_aux.^2;
% plot(xx,fxx,'*g',x_aux,yy1,'b',x_aux,yy2,'r')
    
    %2.3

x = 1.4;
v_exacto = 15.90;

val_est1 = c1(1) + c1(2).*x +c1(3).* x.^2;
val_est2 = c2(1) + c2(2).*x +c2(3).* x.^2;


er_abs1 = abs(v_exacto - val_est1);
er_abs2 = abs(v_exacto - val_est2);

er_rel1 = er_abs1 ./ v_exacto;
er_rel2 = er_abs2 ./ v_exacto;

ncifras1 = floor(-log10(er_rel1));
ncifras2 = floor(-log10(er_rel2));

    %2.4

%residuos y errores

p1_xx = c1(1) + c1(2).*xx +c1(3).* xx.^2;
R1 = abs(p1_xx - fxx);
E1=norm(R1);
[E_max1,p1] = max(R1)

p2_xx =  c2(1) + c2(2).*xx +c2(3).* xx.^2;
R2 = abs(p2_xx - fxx);
E2=norm(R2);
[E_max2, p2]= max(R2)
    
    
    
    
    
    

