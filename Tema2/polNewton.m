function px=polNewton(xi,fi,xx) 
% Calcula el polinomio de Newton que interpola la tabla (xi,fi) y 
% lo evalúa en el vector xx 
% Argumentos de Entrada: xi nodos donde se interpola, 
% fi valores en los nodos, xx vector donde se evalúa el valor 
%del polinomio de interpolación 
% Salida: px=valor(es) del polinomio de Newton en xx 
N=length(xi);
m=length(xx); 
%Llamamos a función difdiv 
dd=difdiv(xi,fi); 
pp=zeros(1,m); 
pp=xx-xi(1); 
px=zeros(1,m);
px=dd(1)+dd(2)*pp; 
for k=3:N 
pp=pp.*(xx-xi(k-1)); 
px=px+dd(k)*pp;
end 
end
