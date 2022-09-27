function [S,R] = suma(a,b)
    S = a + b;
    if nargout == 2
        R = a -b;
    end
end

