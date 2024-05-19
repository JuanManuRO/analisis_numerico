function [c, counter] = falsa_posicion(f, a, b, alpha)
    c = b-(f(b)*(b-a))/(f(b)-f(a));    
    e = abs(f(c));
    counter = 0;

    while e > alpha
        counter = counter + 1;
        if f(a)*f(b) < 0
            if f(a)*f(c) < 0
                b = c;
            end
            if f(b)*f(c) < 0
                a = c;
            end
            c = vpa(b-(f(b)*(b-a))/(f(b)-f(a)));
            e = abs(f(c));
        else 
            break
        end
    end
    
    c = vpa(c);
end