function [f,fp] = fun_3(x)
f = 2 - exp(x)
if nargout == 1, end  %Si no se requiere derivada fin
fp = -exp(x);%Se calcula la derivada
end

