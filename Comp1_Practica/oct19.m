clear;
clc;


    %Ejercicio 1
    
    %a.
valor_exacto = pi * cos(pi);

%valor aproximado
n = 0:12;

d = (-1) .^ n;
D = factorial(2*n);
x = (d./D).* pi.^(2.*n+1);
valor_aprox = sum(x);


er_abs = abs(valor_exacto - valor_aprox);	%error absoluto
er_rel=er_abs/valor_exacto;		%error relativo

ncif=floor(-log10(er_rel));     %cifras significativas


% fprintf('Valor exacto: %.15f aproximado %.15f error relativo %.15f cifras significativas %d\n',[valor_exacto;valor_aprox;er_rel;ncif])


    %b.
k = 1;
ncifras = 0;

while(ncifras < 10)
    valor_aprox = sum(x(1:k));
    erel = abs(valor_exacto - valor_aprox)./abs(valor_exacto);
    ncifras=floor(-log10(erel));
%     fprintf('Número de términos de la serie %d Número de Cifras obtenidas %d \n',k,ncifras)
    k=k+1;
end

    
    %c.

k = 1;
n = 0:10;
for x = [pi:0.1:2*pi]
    val_exacto = x .* cos(x);
    d = (-1) .^ n;
    D = factorial(2.*n);
    aux = (d./D).* (x.^(2.*n+1));
    val_aprox = sum(aux);
    er_rel(k) = abs(val_exacto - val_aprox)./val_exacto;
    ncif(k) = floor(-log10(er_rel(k)));
    k = k+1;
end
x = [pi:0.1:2*pi];
% subplot(1,2,1), semilogy(x,er_rel,'*r'),title('Error relativo')
% subplot(1,2,2), plot(x,ncif,'*g'),title('Cifras significativas')


    %Ejercicio 2
x = 10.^[0:15];
fx = f(x);
gx = g(x);
n = [0:15]
plot(n,fx,'b',n,gx,'g')
    
er_abs = abs(gx - fx) 	%er_abs = abs(vex - vaprox)
er_rel = er_abs ./ gx	%er_rel = er_abs ./ vex
ncif=floor(-log10(er_rel));

    
subplot(2,1,1), loglog(x,er_rel,'r*'), title('Error relativo respecto de x') 
subplot(2,1,2), semilogx(x,ncif,'g*'), title('Nº cifras dec significativas respecto de x')
    
    
    
    
    
    
    
    
    
    
    
