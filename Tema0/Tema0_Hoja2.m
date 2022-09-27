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
A = [2 -15 3 127; -97 32 0 3]

%4 lineas, cada columna
% fprintf('%d %d\n', A(:,1)', A(:,2)', A(:,3)', A(:,4)')

%2 lineas, cada fila
%fprintf('%d %d %d %d\n',A(1,:),A(2,:))

%2 lineas cada fila pero reservando 4 columnas por elemento
fprintf('%4d %4d %4d %4d\n',A(1,:),A(2,:))




    
    
    
    