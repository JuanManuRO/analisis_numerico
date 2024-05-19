function [c, counter] = secante(f, x0, x1, alpha)
    e = abs(x1-x0);
    counter = 0;

    while e > alpha
        counter = counter + 1;
        c = x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
        x0 = x1;
        x1 = vpa(c);
        e = abs(x1-x0);
    end
    c = vpa(c);
end