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
% subplot(1,2,1),loglog(x,er_rel,'*r'),title('Error relativo respecto de x')
% subplot(1,2,2),semilogx(x,ncif,'*g'),title('Cifras significativas respecto de x')



    %Ejercicio 2
%overflow  (1023)
k = 1;
while(2 ^ k < inf)
    k = k+1;
end
over = k-1;

%underflow (1074)
k = 1;
while(2^(-k)~=0)
    k = k+1;
end
under = k-1;


%epsilon  (52)
k = 1;
while(1+(2^(-k))~=1)
    k = k+1;
end
epsil = k-1;


    %Ejercicio 3 (Julio 2016)
%comparar resultados de log1p(x) y log(1+x)
% utilizando log1p(x) como vex y log(1+x) como aprox
% valores pequeños
x = 10.^-[1:16];

vex = log1p(x);
vaprox = log(1+x);

er_abs = abs(vex - vaprox);
er_rel = er_abs ./ vex;
ncif = floor(-log10(er_rel));

%graficas
% subplot(1,2,1),loglog(x,er_rel,'*r'),title('Error relativo respecto de x')
% subplot(1,2,2),semilogx(x,ncif,'*g'),title('Cifras significativas respecto de x')


a = 10 ^ -8;
n = [1:100];
f = ((-1).^(n+1) .* a.^n) ./ n;
fa = sum(f);

vexa = log1p(a);
vaproxa = log(1 + a);

% fprintf('Serie d: %10e log1p(a): %10e  log(1+a): %10e\n',[fa;vexa;vaproxa])

    %Ejercicio 4 (Julio 2017)
%evaluar funciones para valores cercanos a 0
n = [1:8];
h=10.^-n;

%evaluar
vaprox = (cosh(1+h) - 2*cosh(1) + cosh(1-h)) ./ (h.^2);
vex = cosh(1);

%error
er_abs = abs(vex - vaprox);
er_rel = er_abs ./ vex;


%grafica
% loglog(n,er_rel,'r*'), title('Error relativo respecto de n') 
    
%cifras
ncif =  floor(-log10(er_rel));
% semilogx(h,ncif,'*g'),title('Cifras significativas respecto de h')

%Para que valor de h se consiguen 8 cif.
% fprintf('h: %2e n_cifras:%2d \n',[h;ncif])



    %Ejercicio 5

n = [0:10];     %11 sumandos
m = (-1).^n;    %pares +, impares -
vex = exp(-1);  %valor exacto
vaprox = sum((1 ./ factorial(n)) .* m); %valor aproximado

%error
er_abs = abs(vex - vaprox);     %error absoluto
er_rel = er_abs ./ vex;         %error relativo
ncif = floor(-log10(er_rel));   %cifras signif.

n = 5;
Erel = inversoe(5);
while(Erel > 1e-15)     
    [Valor,Erel,Ncif] = inversoe(n);
%     fprintf('n: %2d n_cifras:%2d \n',[n;Ncif])
    n = n+5;
end


    %Ejercicio 7
n = [0:20];
x = 10 .^ -n;

v_exact = sinh(x);
v_aprox = (exp(x) - exp(-x)) ./ 2;

%el valor exacto y el valor aproximado son identicos
% hold on
% plot(v_exact,'bo')
% plot(v_aprox,'r*')
% hold off

%estudio error
eabs=abs(v_exact-v_aprox);
erel = eabs ./ v_exact;
ncif = floor(-log10(erel));
% whos eabs
% whos erel
% whos ncif

%graficas
% subplot(1,2,1),loglog(x,erel,'bo-'),title('Error relativo respecto de x')
% subplot(1,2,2),semilogx(x,ncif,'r*'),title('Cifras significativas respecto de x')


%print
a = [x;erel;ncif];
% fprintf('n: %2d error rel: %0.2e no cifras: %2d \n', a)

%cota
cota = eps(1) ./ sinh(x);

loglog(x,erel,'bo-',x,cota,'ro-')
legend('sinh(x) azul','(exp(x) - exp(-x)) ./ 2') 
title('Gráfica error relativo con cota')









    
    
