function p = cosn(x,n)
    if nargin == 1
        n = 2;
    end
    p = cos(x) .^ n;
end

