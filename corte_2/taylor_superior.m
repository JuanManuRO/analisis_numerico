function  w = taylor_superior(f, a, b, y0, n, orden)
    syms t
    syms y
    h = (b-a)/n;
    tv = 0:h:b;
    w = zeros(1,n+1);
    w(1) = y0;
    for i = 2:n+1
        T = f(tv(i-1), w(i-1));
        faux(t,y) = f;
        for j = 1:orden-1
            faux(t,y) = vpa(diff(faux, t) + diff(faux, y)*faux);
            T = T + vpa(h^j/factorial(j+1)*faux(tv(i-1),w(i-1)));
        end
        w(i) = w(i-1) + h*T;
    end
end