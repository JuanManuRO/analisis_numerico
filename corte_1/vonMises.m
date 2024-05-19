function [c, counter] = vonMises(f, x0, alpha)
    f1 = diff(f);
    aux = f1(x0);
    x1 = x0 - (f(x0)/aux);
    e = abs(x1-x0);
    counter = 0;
    
    while e > alpha
        counter = counter + 1;
        x1 = x0 - (f(x0)/aux);
        e = abs(x1-x0);
        x0 = vpa(x1);
    end
    c = vpa(x0);
end