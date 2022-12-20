clear;
clc;


    %Ejemplo 1: Julio 2017
%f(x) = x^2 - exp(x)

x = -2:0.1:2;
fx = x.^2 - exp(-x);

%a.
% plot(x,fx,'r',x,fx*0,'b')

%Teorema Bolzano
f0 = 0.^2 - exp(-0);
f1 = 1.^2 - exp(-1);
if(f0 * f1) < 0
%     fprintf("Tiene al menos una raiz en el intervalo [0,1] por Teorema de Bolzano\n")
end

%b.metodo iterativo para encontrar raiz hasta error

error = 100;                %Control
iteracion = 1;              %Contador iteraciones
x0 = 1.0;                   %Valor inicial (x0)
while(error > 1e-10)        %Criterio parada
    x1 = sqrt(exp(-x0));    %Metodo iterativo
    error = abs(x1 - x0);   %Estimacion error
    ncif = floor(-log10(error));
%     fprintf('Iter %2d Sol %.15f Error %0.2e Ncif %d\n', iteracion,x1,error,ncif)
    iteracion = iteracion + 1;  %contador++
    x0 = x1;
end
s = x0;     %Solucion final (s)
    

%c. metodo iterativo 2: metodo N-R
x0 = 1;
iteracion = 1;
error = abs(x0 - s);
while(error >  1e-10)
    x1 = x0 - ((x0.^2 - exp(-x0))./ (2*x0 + exp(-x0)));    %metodo iterativo N-R
    error = abs(x1 - s);
    ncif = floor(-log10(error));
%     fprintf('Iter %2d Sol %.15f Error %0.2e Ncif %d\n', iteracion,x1,error,ncif)
    iteracion = iteracion + 1;
    x0 = x1;
end
s = x0;

    %Ejemplo 2: metodo biseccion
a = 0;
b = 1;
N = 10;
% s = biseccion (@fun_bis,a,b,N );

%biseccion2, con precision
% s = biseccion2(@fun_bis,a,b,10^-8,30)


    %Ejemplo 3
%a) Demostrar que tiene al menos una sol en [-2,0]
x = -2:0.01:0;
fx = x.^3 + 2*x.^2 + 3*x + 4;
fa = -2.^3 + 2 *(-2).^2 + 3 *(-2) + 4;
fb = 4;
fa * fb; %< 0 -> tiene una solucion s en [-2,0]

%metodo biseccion
a = -2;
b = 0;
% s = biseccion (@fun_3,a,b,N);

    %Ejemplo 4
    
%Metodo de newton iterando 3 veces
x0 = 0;
error = zeros(1,6);
ncif = zeros(1,6);
for iteracion = 1:6
    x1 =((x0-1)*exp(x0)+2)/-exp(x0);
    error(iteracion) = abs(x1 - log(2));
    ncif(iteracion) = floor(-log10(error(iteracion)/log(2)));
    fprintf('Iter %2d Sol %.15f Error %0.2e Ncif %d\n', iteracion,x1,error(iteracion),ncif(iteracion))
    x0 = x1;
end
s = x0
    

    
    



