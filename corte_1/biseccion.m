function [c, counter] = biseccion(f, a, b, alpha)
    c = (a+b)/2;    
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
            c = vpa((a+b)/2);
            e = abs(f(c));
        else 
            break
        end
    end
end