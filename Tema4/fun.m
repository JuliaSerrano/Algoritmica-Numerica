function [f,fp] = fun(x)
f = x.^3 - x.^2 -x -1;
if nargout == 1, end  %Si no se requiere derivada fin
fp = 3 * x.^2 - 2 * x - 1; %Se calcula la derivada
end

