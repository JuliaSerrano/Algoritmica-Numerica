function [f,fp] = fun_3(x)
f = x.^3 + 2*x.^2 + 3 *x + 4;
if nargout == 1, end  %Si no se requiere derivada fin
fp = 3*x.^2 + 4*x + 3;%Se calcula la derivada
end

