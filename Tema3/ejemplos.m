clear;
clc;

%TEMA 3 MINIMOS CUADRADOS

    %Ejemplo 1
%Tipo A
xi = [-1:2]';
yi = [-2 -1 0 3]';

%pol = a + bx 2 parametros 4 datos 
H1 = [xi.^0 xi.^1];
b1 = yi;
c1 = H1\b1;

%Tipo B

%pol = a + bx^2. 2 parametros 4 datos
H2 = [xi.^0 xi.^2];
b2 = yi;
c2 = H2\b2;

%Tipo C
%pol = a +bx + cx^2. 3 parametros 4 datos
H3 = [xi.^0 xi.^1 xi.^2];
b3 = yi;
c3 = H3\b3;


%Cual es mejor ajuste?

%residuos y errores
R1 = abs(yi - H1 *c1);
eror_rx = norm(R1);

R2 = abs(yi - H2 *c2);
error_px = norm(R2);

R3 = abs(yi - H3 *c3);
error_qx = norm(R3);

%Graficas de los polinomios y datos a ajustar
xx = [-1:0.01:2];
yy1 = c1(1) + c1(2) * xx;
yy2 = c2(1) + c2(2) * xx.^2;
yy3 = c3(1) + c3(2) *xx + c3(3) * xx.^2;
% plot(xi,yi,'ro',xx,yy1,'g',xx,yy2,'b',xx,yy3,'r')
% legend('Valores tabla','r(x)','p(x)','q(x)')



    %Ejemplo 2
xi = [-1 1 2 3 4]';
yi = [4 2 1 1 2]';
%pol. grado 3 -> p(x) =  a + bx + cx^2 + dx^3
%p(0) = 3 -> a = 3
%p''(0) = 1 -> 2c = 1; c = 0.5
H = [xi.^1  xi.^3];
b = yi - 3 - 0.5 * xi.^2;
c = H\b;

%residuos y error
R = abs(yi - H *c);
e = norm(R);

%estimacion del valor aprox en x = 1.2
x = 1.2;
val_aprox = 3 + c(1) *x + 0.5 *x.^2 + c(2) *x.^3;


%grafica
xx = -1:0.1:4;
yy = 3 + c(1) *xx + 0.5 * xx.^2 + c(2) *xx.^3;
% plot(xx,yy,'b',xi,yi,'*r')



    %Ejemplo 3
%u(x) = A + Bcos(x) + Csin(x)
%rest. u'(0) = 1
%u'(x) = -Bsin(x) + Ccos(x)
%u'(0) = C -> C = 1
xi = [-pi/2 0 pi/2 pi]';
yi = [1 2 -1 1]';
H = [xi.^0 cos(xi)];
b = yi - sin(xi);
c = H\b;

    %Ejemplo 4
%u(x) = ax^2 + x
xi = [ 1 2 3]';
yi = [1 2 8]';
H = [xi.^2];
b = yi - xi;
c = H\b;
a = c(1);

    %Ejemplo 5
%Ajustes de datos con pesos
xi = [-1 0 1]';
yi = [2 3 7]';
wi = [1 1 1/2]';

%p(x) = a + bx
H = [xi.^0 xi.^1];
W = diag(wi);    %W matriz diagonal con los pesos en la diagonal
c = (sqrt(W) * H)\(sqrt(W)*yi);
a = c(1)
b = c(2)
r = abs(yi - H *c)
e = norm(r)




























