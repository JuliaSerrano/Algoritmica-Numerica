clear;
clc;

%JULIO20
    %Ejercicio1
%vector columna de los valores x donde se va a interpolar
xi = [0:0.4:0.8]';

%vector columna de los valores de la función sobre los nodos
yi = [1  4 -0.5]';

%matriz de coeficientes
H = [xi.^0 sin(pi*xi) sin(2*pi*xi)];

%término independiente
b = yi;
%vector de incognitas
c = H\b;

% Gráfica de la función interpolante en [0,0.8] y puntos donde interpola
xx=0:0.01:0.8;
yy=c(1)+c(2)*sin(pi*xx) +c(3)*sin(2*pi*xx);
% plot(xx,yy,'g',xi,yi,'og')

%JULIO19

    %Ejercicio1
%a.
%vector columna de los valores x donde se va a interpolar
xi = [2.6 2.9 3.1 3.5]';

%vector columna de los valores de la función sobre los nodos
yi = [2.3 4.1 5.3 6.6]';

%grado minimo. 4 condiciones -> grado3
% pol.grado3   a+ b*x+ c*x^2 + d*x^3

%Matriz de coeficientes de las incógnitas
H1 = [xi.^0 xi.^1 xi.^2 xi.^3];
%término independiente
b1 = yi;
%vector de incognitas. coeficientes
c1 = H1\b1;

%b.
%u(x) =A + B/x + Clog(x) + Dx^2

%Matriz de coeficientes de las incógnitas
H2 = [xi.^0 1./xi log(xi) xi.^2];
%término independiente
b2 = yi;
%vector de incognitas. coeficientes
c2 = H2\b2;

%valores de coeficientes:
A = c2(1);
B = c2(2);
C = c2(3);
D = c2(4);


%graficas
xx=2.6:0.01:3.6;
yy1 = c1(1) *xx.^0 + c1(2)*xx.^1 + c1(3) *xx.^2 + c1(4) * xx.^3;
yy2 = c2(1) *xx.^0 + c2(2)./xx + c2(3) .* log(xx) + c2(4) .*xx.^2;

% plot(xi,yi,'ro',xx,yy1,'b',xx,yy2,'g')


%JULIO18

    %Ejercicio1
    

%vector columna de los valores x donde se va a interpolar
xi = [-0.5 -0.3 0.1 0.5]';

%vector columna de los valores de la función sobre los nodos
yi = [2.5 2.3 1.9 1.4]';

%grado minimo. 4 condiciones -> grado3
% pol.grado3   a+ b*x+ c*x^2 + d*x^3

%Matriz de coeficientes de las incógnitas
H = [xi.^0 xi.^1 xi.^2 xi.^3];
%término independiente
b = yi;
%vector de incognitas. coeficientes
c = H\b;
%graficas
xx=-0.7:0.01:0.7;
yy = c(1) *xx.^0 + c(2)*xx.^1 + c(3) *xx.^2 + c(4) * xx.^3;
% plot(xi,yi,'r*',xx,yy,'b')


%p'(1) = 2 -> 5 condiciones. grado 4
%Matriz de coeficientes de las incógnitas
H = [xi.^0 xi.^1 xi.^2 xi.^3 xi.^4];
b = [yi;2];
H = [H;0 1 2 3 4];
c = H\b;
px = c(1) +c(2)*xi + c(3)*xi.^2 +c(4)*xi.^3 + c(5)*xi.^4;


%JUNIO 17

    %Ejercicio 1
%     izq | der
%     f   | g

n = 1:8;
h = 10.^-n;

f = cosh(1);
dg = cosh(1+h) - 2*cosh(1) + cosh(1-h);
Dg = h.^2;
g = dg./Dg;

%error relativo
er_abs = abs(f - g); 	%er_abs = abs(vex - vaprox)
er_rel = er_abs ./ f;	%er_rel = er_abs ./ vex
%cifras
ncifras=floor(-log10(er_rel));
% fprintf('h: %2d error rel: %0.2e n_cifras:%2d \n',[h;er_rel;ncifras])

% subplot(2,1,1), loglog(n,er_rel,'r'), title('Error relativo respecto de n') 
% subplot(2,1,2), semilogx(h,ncifras,'g*'), title('Nº cifras dec significativas respecto de h')



    %Ejercicio2

%a.
%vector columna de los valores x donde se va a interpolar
xi = pi*[-1.5:1:1.5]';
%vector columna de los valores de la función sobre los nodos
yi = sin(xi);
%4 condiciones -> grado 3
%Matriz de coeficientes de las incógnitas
H = [xi.^0 xi.^1 xi.^2 xi.^3];	
%término independiente
b = yi;
%vector de incognitas. coeficientes
c = H\b;
% Gráfica de la función interpolante y puntos donde interpola
xx=-5:0.01:5;
yy = c(1) *xx.^0 + c(2)*xx.^1 + c(3) *xx.^2 + c(4) *xx.^3;
% plot(xi,yi,'ro',xx,yy,'b')


%b.
%condicion p(0) = 1 -> a =1
%5 condiciones -> grado 4
%matriz de coeficientes
H2 = [xi.^1 xi.^2 xi.^3 xi.^4];
%término independiente
b2 = yi - 1;
%vector de incógnitas
c2 = H2\b2;

%Graficas
xx=-5:0.01:5;
yy2 = 1 + c2(1)*xx.^1 + c2(2) *xx.^2 + c2(3) *xx.^3 + c2(4) *xx.^4;
% plot(xi,yi,'ro',xx,yy2,'g',0,1,'sr')
    
%c.
%pol. grado 3 condiciones p'(0) = 1
%5 condiciones 
%c2 = 1

%matriz de coeficientes
H3 = [xi.^0 xi.^2 xi.^3];

%término independiente
b3 = yi - xi;
%vector de incógnitas
c3 = H3\b3;
%Graficas
xx=-5:0.01:5;
yy3 = c3(1)*xx.^0+ xx + c3(2) *xx.^2 + c3(3) *xx.^3;
plot(xi,yi,'ro',xx,yy3,'k')

%residuo y error
residuo = c3(1)*xi.^0+ xi + c3(2) *xi.^2 + c3(3) *xi.^3 - yi;
error = sum(residuo.^2);

%grafica conjunta
plot(xi,yi,'ro',xx,yy,'b',xx,yy2,'g',0,1,'sr',xx,yy3,'k')
    
    
    
    
    
    
    
    