function dd=difdiv(xi,fi) 
% Función que calcula la tabla de diferencias divididas de una función f 
% en puntos xi con f(x)=fi.
% Argumentos Entrada: xi nodos, fi valores de f(x) en xi 
%Argumento Salida: dd vector de coeficientes en la Fórmula de Newton del 
% polinomio de interpolación de f(x) en xi. 
% En la matriz D se van guardando los valores de la tabla de diferencias 
% divididas. 
% Los coeficientes de la F. de Newton se disponen en la primera fila de D,
% atendiendo a cómo se guardan las dif. divididas en el procedimiento siguiente.
% Alternativamente se podría haber organizado de forma que los 
% coeficientes de Newton estuvieran en la diagonal (ver 
%en diapositivas de clase). 
N=length(xi); 
D=zeros(N); 
D(:,1)=fi; 
for k=2:N 
for j=1:N-k+1 
dif=D(j,k-1)-D(j+1,k-1); 
dx=xi(j)-xi(j+k-1); 
D(j,k)=dif/dx; 
end 
end
% Vector con coeficientes F. Newton 
dd=D(1,:);
end
