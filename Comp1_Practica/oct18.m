clear;
clc;

    %Ejercicio1

%valores pequeños
h=10.^-[1:8];

%primera expresion
d = sqrt(7+h) - sqrt(7 - h);
f = d./h;

%segunda expresion
g = 1/sqrt(7);

%errores
er_abs = abs(g - f);
er_rel = er_abs ./ g;
%cifras
ncifras=floor(-log10(er_rel));
% fprintf('h: %2d error rel: %0.2e n_cifras:%2d \n',[h;er_rel;ncifras])

n = 1:8;
%graficas
% subplot(2,1,1), loglog(n,er_rel,'r'), title('Error relativo respecto de n') 
% subplot(2,1,2), semilogx(h,ncifras,'g*'), title('Nº cifras dec significativas respecto de h')



    
    %Ejercicio 2

%vector columna de los valores x donde se va a interpolar   
xi = [1 -2 -1 2]';
%vector columna de los valores de la función sobre los nodos
yi = [1 -4 2 1]';

%u(x) = 1 + x^2 + x/(5+x) + x^3

%Matriz de coeficientes de las incógnitas
H = [xi .^ 0 xi.^2 xi./(5+xi) xi.^3];
%término independiente
b = yi;
%vector de coeficientes/incognitas
c = H\b;

%grafica

%puntos auxiliares en el intervalo [-2,2]
xx = -2:0.01:2;
%vector de valores del polinomio obtenido en dichos puntos
yy = c(1)*xx.^0 + c(2)*xx.^2 + c(3) * (xx./(5+xx)) + c(4) *xx.^3;
%pintamos grafica del polinomio interpolante y los puntos que interpola
plot (xx, yy, 'g', xi, yi,'*r');


%condicion adicional p'(1) =1
%5 condiciones -> grado 4
%p’(1) = c2 + 2*c3 + 3*c4 +4*c5 = 1























