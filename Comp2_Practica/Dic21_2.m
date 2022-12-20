clear;
clc;

    %Ejercicio 1
    
%a.
xi = [-3 -2 0 2 4]';
yi = [3 0 -1 1 2]';
H1 = [(xi.^2 -1) (xi.^3 - 5*xi)  ((xi-4).^2)];
b1 = yi;
c1 = H1\b1;
a = c1(1);
b1 = c1(2);
c = c1(3);

%grafica
xx = -4:0.01:4;
yy1 = a *(xx.^2 - 1) + b1 * (3*xx.^3 - 5*xx) + c *(xx-4).^2;
% plot(xx,yy,'b',xi,yi,'r*')

%b.
%p(0) = -1
%p(0) = -a + 16c
%a = 1 + 16c
H2 = [(3*xi.^3 - 5*xi) (xi-4).^2 + 16*(xi.^2 - 1)];
b2 = yi - xi.^2 +1;
c2 = H2\b2;
yy2 = 16*c2(2) + 1 + c2(1) * (3*xx.^3 - 5*xx) + c2(2) * (xx - 4).^2;
% plot(xi,yi,'r*',xx,yy1,'b',xx,yy2,'g')


%c.
%residuos
r1 = abs(yi - H1 *c1);
error_total1 = sum(r1.^2);
r2 = abs(yi - H2 *c2);
error_total_2 = sum(r2.^2);

%es mejor el primer ajuste, ya que tiene menor error. El segundo
%ajuste tiene mayor error ya que pusimos la restriccion
%de p(0) = -1




    %Ejercicio 2
%a.
xx = [1:0.01:2];
fx = xx.^3 + 4*xx.^2 - 10;
% plot(xx,fx,'r',xx,fx*0,'g')     %Tiene 1 raiz

f1 = 1 + 4 - 10;
f2 = 2^3 + 4*2^2 - 10;
f1*f2; %<0 -> existe al menos una raiz


%b.
%metodo iterativo
N = 20;
x0 = 1.5;

for k = 1:N
    x1 = 1/2 * sqrt(10 - x0.^3);
%     fprintf('Iteracion %2d Raiz %.16f \n',k,x1)
    x0 = x1;
end
s = x0;


%c.

k = 1;
xk = zeros(1,42);
error = zeros(1,42);
x0 = 1.5;
error(k) = 100;
while(error(k)>1.e-12)
    xk(k+1) = 1/2 * sqrt(10 - xk(k).^3);
    error(k+1) = abs(xk(k+1) - xk(k));
    fprintf('Iteracion %2d Raiz %.16f Error %0.2e \n',k,xk(k+1),error(k+1))
    xk(k) = xk(k+1);
    k = k +1;
end
s = x0
semilogy(error,'r')
    
    












