function [c, counter] = iter_punto_fijo(f, a, b, alpha)
    aux1 = (a+b)/2;
    aux2 = f(aux1);
    e = abs(aux2 - aux1);
    counter = 0;
    
    f1 = diff(f);
    if (f1(a)<=1) && (f1(b)<=1)
        while e > alpha
            counter = counter + 1;
            aux1 = aux2;
            aux2 = vpa(f(aux1));
            e = vpa(abs(aux2 - aux1));
        end
    end
    
    c = vpa(aux2);
end