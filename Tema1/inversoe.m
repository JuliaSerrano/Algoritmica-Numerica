function [Valor,Erel,Ncif] = inversoe(n)
    x = [0:n+1];
    m = (-1).^x;
    Valor = sum((1 ./ factorial(x)) .* m);
    vex = exp(-1);
    er_abs = abs(vex - Valor);
    Erel = er_abs ./ vex;
    Ncif = floor(-log10(Erel));
end

