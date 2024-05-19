function [c, counter] = newton_raphson(f, x0, alpha)
    f1 = diff(f);
    x1 = x0 - (f(x0)/f1(x0));    
    e = abs(x1-x0);
    counter = 0;
    
    while e > alpha
        counter = counter + 1;
        x1 = x0 - (f(x0)/f1(x0));
        e = abs(x1-x0);
        x0 = vpa(x1);
    end
    c = vpa(x0);
end