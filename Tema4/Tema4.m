clear;
clc;

    %Ejercicio 2

%Metodo1: metodo de newton
x0 = 1.5;
[s,cif1,error1] = newton(@fun,x0,10);

valor_real = 1.839286755214161;
%Metodo 2
iteracion = 1;
error2 = zeros(1,10);
for i =1:10
    xn = nthroot(1 + x0 + x0.^2,3);
    error2(i) = abs(xn - x0)/valor_real;
    cif2 = floor(-log10(error2));
    fprintf('Iter: %2d x= %.16f  Error rel: %.2e\n', i,xn,error2(i))  
    x0 = xn;
end

cif1_final = cif1(end);
cif2_final = cif2(end);
%grafica
k = 1:10;
% semilogy(k,error1,'r',k,error2,'g')


%orden de convergencia
k2 = error2(2:end)./error2(1:end-1);  %0.46   %orden 1
gan_iter=-log10(k2(end));            %0.3363
it_10=10/gan_iter;                  %29.73
k1 = error1(2:end) ./ (error1(1:end-1).^2);









