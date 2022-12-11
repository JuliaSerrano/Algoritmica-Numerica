function [s,ncif,error]=newton(fun,x0,N) 
% fun puntero a la función: debe devolver f(x) y f'(x), 
% x0  punto inicial 
% N número iteraciones 
error = zeros(1,N);
s = 1.839286755214161;
for k=1:N
% Llamada a f para obtener valores de f(x) y f'(x)   
[f, fp] = fun(x0);% Llamada a f para obtener valores de f(x) y f'(x)  
if f==0, break; end   % Ya he obtenido la raiz y termino 
x1 = x0-(f/fp);        % Iteracion de Newton.    
error(k) = abs(x1 - s)/s;
ncif = floor(-log10(error(k)));
fprintf('%2d -> %18.15f Error: %.2e \n',k,x1,error(k));  % Volcar datos iteracion.
x0=x1;       % Actualizar x0 con el ultimo valor x1 para volver a iterar.
end
s = x1;     % Al final devuelvo último término de la sucesión.
end



