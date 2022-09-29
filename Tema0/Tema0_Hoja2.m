clear;
clc;

%Funciones

    %1.fun1
    
p = fun1(2,pi);
    
   %2.cosn -> arg opc entrada
p = cosn(0.3,4);
   
   %3.suma -> arg opc salida
[S,R] = suma(2,3);
   
   %5.
x = -2:0.01:2;      %intervalo
l = length(x);      %longitud

p = zeros(4,l);      

for i= 1:4
    p(i,:) = fun5(x,i);
end

% plot(x,p)


%Volcado de datos usando fprintf()

    %1.  5 decimales
%fprintf('%.5f\n',pi);

    %2.  2 decimales y 8 decimales
%fprintf('%.2f\n%.8f\n',exp(1),exp(1))

    %3. 
x = 174;
%fprintf('%d %4d %04d %.2f %e\n',x,x,x,x,x)   
   
    %4.
A = [2 -15 3 127; -97 32 0 3];

%4 lineas, cada columna
% fprintf('%d %d\n', A(:,1)', A(:,2)', A(:,3)', A(:,4)')

%2 lineas, cada fila
%fprintf('%d %d %d %d\n',A(1,:),A(2,:))

%2 lineas cada fila pero reservando 4 columnas por elemento
% fprintf('%4d %4d %4d %4d\n',A(1,:),A(2,:))

% Bucles de Control
   %1.
x= 0;
for k = 1:100
   x = cos(x);
%     plot(k,x,'*r')
%     hold on
end
% hold off
%  lim = x(end)
   %2.
% Crear vector x inicializado con ceros
x=zeros(101,1); %x(1)=x0=0
% Calcular iteraciones y guarder en x:
for k=1:100
x(k+1)=cos(x(k));
end
% Dibujar gráfica de iteraciones:
% plot(x,'*r')
%Valor estimado del límite sucesión:
l=x(end);
%Calculamos error relativo y nº de cifras decimales y representamos gráficamente:
val_real = x(1:end);     %valor real
er_abs = abs(val_real - l);  %error absoluto
er_rel=er_abs/val_real;      %error relativo
ncif=floor(-log10(er_rel)); %num cifras significativas
%subplot(1,2,1), semilogy(er_rel,'*r')   %grafica errores relatviops
% subplot(1,2,2), plot(ncif,'*g') %grafica num cifras significvativas
   %2
x = zeros(51,1); %x0 = 0
for k = 1:50
   x(k+1) = 1/2 .* exp(-x(k));
end
last_el = x(end);
% plot(x,k,'*r')
   %3.
%con bucles anidados
A = rand(5,7);
[n,m] = size(A);
for i = 1:n
    for j = 1:m
        if A(i,j) <= 0.4
            A(i,j)= 0.2;
        else
           A(i,j) = 0.7;
        end
    end
end
A;
%con indexado logico
A(A<=0.4) = 0.2;
A(A>0.4) = 0.7;
   %4.
x = rand(1,10);
[n,m] =size(x);
%bucles anidados
for i = 1:n
   for j = 1:m
       if x(i,j) >= 0.5
           x(i,j) = 0.8;
       else
           x(i,j) = 0;
       end
   end
end
%indexado logico
x(x(i,j)>= 0.5) = 0.8;
x(x(i,j)<0.5) = 0;
   %5.
       %1.
%a. sin bucles
n = 0:60;
x1 = 1 ./ (2 .^ n);
vap1 = sum(x1);

%b
x2 = ones(61,1);
for k = 1:60
   x2(k+1) = x2(k) + 1/ (2.^k);
end
vap2 = x2(end);

%c.

n=1; 
s = 1;
v_real = 2;
e_rel = abs(s - 2);

while(e_rel>10^(-16))
s(n+1) = s(n) + 1/ (2.^ n);
n=n+1;
e_rel = abs(s(n) - 2);
% fprintf('Numero de iteraciones: %d Error: %d\n ',n,e_rel)

end


    %2.
n = 1:61;
s = zeros(61,1);
erel = zeros(61,1);
ncif = zeros(61,1);
s(1) = 1;
erel(1) = abs(2 - s(1));
ncif(1) = floor(-log10(erel(1)));
for n = 1:61
    s(n+1) = s(n) + 1/ (2.^ n);
    erel(n+1) = abs(  2 - s(n+1));
    ncif(n+1) = floor(-log10(erel(n+1)))
end
erel;
[min_erel,pos] = min(erel);
fprintf('Numero cifras significativas: %d\n',ncif([50:60],:))


%grafica errores relativos
subplot(1,2,1), semilogy(erel,'*r'), title('Errores relativos')

%grafica cifras decimales
subplot(1,2,2), plot(ncif,'*g'), title('Numero cifras decimales')

    
    
    
    