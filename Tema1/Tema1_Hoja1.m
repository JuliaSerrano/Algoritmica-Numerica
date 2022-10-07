clear;
clc;

%Representacion en coma flotante. Error relativo

    %Ejercicio 0
    
        %1.
%valor aprox de pi/4 sumando 100 primeros terminos de la serie
n = 0:99;               %100 primeros terminos
D = (-1).^ n;           %Dividendo
d = (2 .* n) + 1;       %divisor
x = D ./ d;             %terminos
    
%valor aproximado
vap = sum(x);
    
%calcula el error relativo y num cifras decimales 
v_real = pi/4;
er_abs = abs(v_real - vap);     %error absoluto
er_rel = er_abs / v_real;       %error relativo
ncif = floor(-log10(er_rel));   %cifras decimales garantizadas
    
        %2.
%valores aprox de e(exp(1)) dada sucesion CUIDADO NO SERIE, no sum(x)

%con n = 10
v_real = exp(1);
n = 10;
x = (1 + (1./n)).^ n;
er_abs = abs(v_real - x);
er_rel = er_abs / v_real;
ncif = floor(-log10(er_rel));

%con n = 10.^[1:15]
n = 10.^[1:15];
x = (1 + (1./n)) .^ n;
er_abs = abs(v_real - x);
er_rel = er_abs / v_real;
ncif = floor(-log10(er_rel));

%graficas de er_rel y ncif

% subplot(1,2,1), semilogy(er_rel,'*r'),title('Error relativo')
% subplot(1,2,2), plot(ncif,'*g'),title('Cifras significativas')

%menor numero de cifras significativas y pos.
[c,p]=min(ncif);

%Imprimir resultados con formato fprintf:
k=1:15;
% fprintf('k=%d, error rel:%3.2e, cif:%d \n',[k;er_rel;ncif])
    


    %3.
%evaluar f(x) y g(x) 
x=10.^-[0:10];

f = sqrt(1+x.^2) - 1;

Dg = x .^2;
dg = sqrt(1+x.^2) + 1;
g = Dg ./ dg;

%error relativo y representar
er_abs = abs(g - f);
er_rel = er_abs ./ g;

%grafica
% subplot(1,2,1),loglog(x,er_rel,'*r'),title('Error relativo')

%cifras significativas
ncif=floor(-log10(er_rel));
% subplot(1,2,2),semilogx(x,ncif,'*g'),title('Cifras significativas')

%imprimir resultados
n=[0:10];
% fprintf('n: %2d error rel: %3.2e n_cifras:%2d \n',[n;er_rel;ncif])


    %4.
%comparar resultados formulas equivalentes para valores grandes de x

x = 10.^[1:10];     %valores grandes de x

%evaluar 2 formulas
v_ex = 4 ./ (x + (sqrt( x.^2 - 4)));
v_aprox = x - sqrt(x .^2 - 4);

%error relativo
er_abs = abs(v_ex - v_aprox);
er_rel = er_abs ./ v_ex;

%cifras
ncif=floor(-log10(er_rel));

%representar respecto de x
% subplot(1,2,1),loglog(x,er_rel,'*r'),title('Error relativo respecto de x')
% subplot(1,2,2),semilogx(x,ncif,'*g'),title('Cifras significativas respecto de x')


%maximo/minimo num cifras dec y posicion

[mx,p] =max(ncif);
[mn,l] =min(ncif);

%imprimir
k = [1:10];
% fprintf('k: %2d error rel: %0.2e n_cifras: %2d \n',[k;er_rel;ncif])

x = 10 .^ (-[0:10]);
cota = eps(1) ./ sinh(x);

    %Ejercicio 1
    
x=10.^-[0:10];

%evaluar funciones
f = sqrt(1 + x.^2) - 1;

Dg = x.^2;
dg = sqrt(1 + x.^2) + 1;
g = Dg ./ dg;

%errores
er_abs = abs(g - f);
er_rel = er_abs ./ g;
ncif = floor(-log10(er_rel));

%graficas
subplot(1,2,1),loglog(x,er_rel,'*r'),title('Error relativo respecto de x')
subplot(1,2,2),semilogx(x,ncif,'*g'),title('Cifras significativas respecto de x')



    %Ejercicio 2


    




    
    
