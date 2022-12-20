function [s,n]=biseccion2(fun,a,b,tol,N)
%fun, nombre funcion previamente creada
%[a,b] intervalo que contiene solucion
%tol: precisión deseada
%N numero max iteraciones
s=NaN;n=NaN;
if nargin==4, N=20; end  	%20 iteraciones como max por defecto
fa=fun(a); fb=fun(b); % Evaluación de fx en extremos intervalo
if (fa*fb>0), fprintf('ERROR: Método no aplicable en intervalo [a,b]\n'); end
n=1;
iteracion = 1;
while ( ((b-a)/2 > tol) && (n<=N) ) % Condiciones salida
s = (a+b)/2;
fs=fun(s); % Evalúa la función en la estimación de la raiz
if (fs*fa <0), b=s; fb=fs; else a=s; fa=fs; end
n=n+1;
iteracion = iteracion + 1;
fprintf("Iteracion %d\n", iteracion)
end
s = (a+b)/2; % Mejor hipótesis dado el intervalo final [a,b]
end
