clear;
clc;

%Interpolacion clasica
%vector columna de los valores x donde se va a interpolar
xi = [0:0.25:0.75]';
%vector columna de los valores de la función sobre los nodos
yi = [1 -1 2 0]';


    %Ejercicio 1: polinomio grado 3
%a + bx + cx^2 + dx^3
%matriz de coeficientes
H = [xi.^0 xi.^1 xi.^2 xi.^3];
%termino independiente
b = yi;
%vector de coeficientes
c = H\b;
%grafica
xx = [0:0.01:0.75];
yy = c(1)*xx.^0 + c(2)*xx+c(3)*xx.^2+c(4)*xx.^3;
%plot(xx,yy,'g',xi,yi,'ro')

    %Ejercicio 2: funciones no polinomiales

%a) u2(x) = c1 + c2*cos(2pix) + c3*sin(2pix) + c4(4pix)
H = [xi.^0 cos(2*pi*xi) sin(2*pi*xi) cos(4*pi*xi)];
b = yi;
c = H\b;
%b) 
H = [exp(xi) cos(xi) xi.^3 1./(1+xi.^2)];
b = yi;
x = H\b;

    %Ejercicio 3: polinomios con restricciones

%a) con u'(0) = 0
%5 parámetros (4 datos + derivada), grado 4
%p(x) = a + bx +cx^2 +dx^3 +ex^4
%p'(x) = b + 2cx + 3dx^2 + 4ex^3
%p'(0) = b -> b = 0
H = [xi.^0 xi.^2 xi.^3 xi.^4];
b = yi;
c = H\b;
%b)con u'(0) = 1
%p'(0) = b -> b = 1
H = [xi.^0 xi.^2 xi.^3 xi.^4];
b = yi - xi;
c = H\b;
   
    %Ejercicio 4
%1.)
%vector columna de los valores x donde se va a interpolar
xi = [1 3 5]';
%vector columna de los valores de la función sobre los nodos
yi = 2*sinh(xi);
%matriz de coeficientes
H1 = [xi.^0 xi.^1 xi.^2];
%término independiente
b1 = yi;
%vector de incógnitas
c1 = H1\b1;
% Gráfica de la función interpolante en [1/5] y puntos donde interpola
xx=1:0.001:5;
yy=c1(1) *xx.^0  + c1(2)*xx.^1 + c1(3)*xx.^2;
fx = 2*sinh(xx);
%error interpolacion
er_int = abs(fx - yy);
% subplot(1,2,1)
% plot(xx,fx,'g',xx,yy,'r',xi,yi,'*r')
% title('Función original y polinomio interpolador')
% subplot(1,2,2)
% plot(xx,er_int)
% title('Error de interpolación')

%maximo error
[max_er,p] = max(er_int);
%minimo error y posicion
[min_er,p] = min(er_int);
[n,m] = size(er_int);

for i= 1:m
    if er_int(i) == 0
%         fprintf('i: %d\n',i)
    end
end

%1.3. ??

%2.)
%vector columna de los valores x donde se va a interpolar
xi = [1 5]';
%vector columna de los valores de la función sobre los nodos
yi = 2*sin(xi);
%matriz de coeficientes
H2 = [xi.^0 (xi - 1).^2];
%término independiente
b2 = yi;
%vector de incógnitas/coeficientes
c2 = H2\b2;




    
    
    
    
    
    
    