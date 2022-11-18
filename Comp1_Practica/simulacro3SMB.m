clear;
clc;

    %a.
%valor calculado por Matlab
valor_matlab = exp(0.5);

%valor aproximado por la serie dada
n = 0:1:10;
x1 = (0.5.^n)./factorial(n);
vap = sum(x1);

%Imprimir resultados
fprintf('Valor Aproximado %.15f Valor Matlab %.15f\n',vap,valor_matlab)

er_abs = abs(valor_matlab - vap);	%error absoluto
er_rel=er_abs/valor_matlab;	%error relativo

ncif=floor(-log10(er_rel));


    %b.con bucles
x1 = zeros(1,11);
for n = 0:10
    x1(n+1) = (0.5.^n)./ factorial(n);
end
vap1 = sum(x1);

%Imprimir resultados
fprintf('Valor Aproximado %.15f Valor Matlab %.15f\n',vap1,valor_matlab)
    
    
    %c.

valoresx = [-0.5:0.01:0.5];
k=1;
for x = valoresx
    valor_real = exp(x);
    n = 0:1:10;
    valor_aprox = sum((x.^n)./factorial(n));
    er_rel(k) = abs(valor_real - valor_aprox)/abs(valor_real);
    ncif(k) = floor(-log10(er_rel(k)));
    k = k+1;
    
end
%grafica
subplot(1,2,1),semilogy(er_rel,'*r'),title('Error relativo')
subplot(1,2,2), plot(ncif,'*g'),title('Cifras significativas')











