function [f,fp] = fun_bis(x)
f = x - cos(x);
if nargout == 1, end  %Si no se requiere derivada fin
fp = 1 + sin(x);%Se calcula la derivada
end

