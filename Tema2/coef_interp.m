function c = coef_interp(xi,yi)
%Implementa el calculo de los coef. polinomio interpolacion en datos
%xi,yi
%Arg.entrada: xi,yi (vectores columna)
%Arg. salida: c vector de coeficientes del polinomio 
l=length(xi);
D=zeros(l);
D(:,1)=yi;
for k=2:l
 for j=1:l-k+1
 dif=D(j,k-1)-D(j+1,k-1);
 dx=xi(j)-xi(j+k-1);
 D(j,k)=dif/dx;
 end
end
% Vector con coeficientes F. Newton
c=D(1,:);
end
