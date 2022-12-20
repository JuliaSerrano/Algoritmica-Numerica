function s = biseccion (fx,a,b,N )

%fx, nombre funcion previamente creada
%[a,b] intervalo que contiene solucion
%N numero max iteraciones

% Evaluamos la función fx (previamente creada) en a y en b: 
fa=fx(a);fb=fx(b);
if fa*fb > 0
fprintf('La función no tiene raices simples en el intervalo [a,b]\n')
end
for i=1:N
    c=(a+b)/2;
    fc=fx(c);      %evaluo funcion en punto medio intervalo
    if fa*fc < 0
        b=c;
    else
        a=c;
        fa=fc; % Ahorramos una evaluación en la siguiente iteración
    end
end
s=a; % s solución aproximada, podría ser s=b ó s=(a+b)/2,
fprintf('La raiz aproximada es %12.8f\n',s)
end



