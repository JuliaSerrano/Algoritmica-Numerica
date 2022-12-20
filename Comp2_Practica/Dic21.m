clear;
clc;

    %Problema 1
xi = [-2:2]';
yi = -3 +4*xi - sin(xi) + xi.^3;

%1.t(x)
%pol.grado 3 -> t(x) = a + bx + cx^2 + dx^3
H1 = [xi.^0 xi.^1 xi.^2 xi.^3];
b1 = yi;
c1 = H1\b1;        %vector de coeficientes

%2.p(x)
%p(x) = a + bx + cx^2 + dx^3
%p(0) = a = 0
H2 = [xi.^1 xi.^2 xi.^3];
b2 = yi;
c2 = H2\b2;

%vector de residuos
res_p = abs(yi - H2 *c2);
[max_res,p] = max(res_p);       %maximo residuo es 3, que se da cuando 
                               %xi = 0, ya que hemos impuesto que cuando 
                               %x sea 0, pase por el 0

%3.q(x)
% xi = -1. w=4
%resto w = 1
wi = [1 4 1 1 1]';
H3 = [xi.^1 xi.^2 xi.^3];
W = diag(wi);
c3 = (sqrt(W)*H3)\(sqrt(W)*yi);
res_q = abs(yi - H3 *c3)
[min_res,p2] = min(res_q)
%el residuo es minimo donde hemos forzado un peso mayor


%4.representar
xx = -2:0.01:2;
yyt = c1(1) *xx.^0 + c1(2)*xx.^1 + c1(3)*xx.^2 + c1(4)*xx.^3;
yyp = c2(1)*xx.^1 + c2(2)*xx.^2 + c2(3)*xx.^3;
yyq = c3(1)*xx.^1 + c3(2)*xx.^2 + c3(3)*xx.^3;
% plot(xx,yyp,'b',xx,yyq,'g',xi,yi,'*r',0,0,'or',xx,yyt,'y')



    %Problema 2
    
%1.
%Metodo iterativo dado
N = 6;
x0 = 1.7;
s = sqrt(2);
error = abs(s - x0);

for i = 1:N
    x1 = (2*x0.^3 + 7*x0.^2 + 14)/(3*x0.^2 + 14*x0 - 2);
    error = abs(s - x1);
    ncif = floor(-log10(error));
    fprintf('Iter %d Sol %.16f Error %0.2e Ncif %d\n', i,x1,error,ncif)
    x0 = x1;
end
s = x0

%Se cumple la segunda relación, ya que en cada iteracion gana 2 cifras
%de precision. Metodo de orden 2
    
    
%2.
N = 6;
x0 = 1.4142;
s = sqrt(2);
error = abs(s - x0);

for i = 1:N
    x1 = x0 - (x0.^3 + 7*x0.^2 - 2*x0-14)/23.7;
    error = abs(s - x1);
    ncif = floor(-log10(error));
    fprintf('Iter %d Sol %.16f Error %0.2e Ncif %d\n', i,x1,error,ncif)
    x0 = x1;
end
s = x0

%Tambien es de orden 2 (Segunda relacion)








