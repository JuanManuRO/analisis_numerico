function  [w,tv] = taylor_2v_step(f, a, h, y0, modo, cond)
    syms y
    syms t
    %h = (b-a)/N;
    tv(1) = a;
    %w = zeros(1,N+1);
    w(1) = y0;
    i = 1;
    if strcmp(modo, 'punto medio')
        while w(i) > cond
            i = i+1;
            tv(i) = tv(i-1) + h;
            T = f(tv(i-1)+h/2, w(i-1)+h/2*f(tv(i-1), w(i-1)));
            w(i) = w(i-1) + h*T;
        end
    elseif strcmp(modo, 'euler modificado')
        while w(i) > cond
            i = i+1;
            tv(i) = tv(i-1) + h;
            w(i) = w(i-1) + h/2*(f(tv(i-1),w(i-1))+f(tv(i),w(i-1)+h*f(tv(i-1),w(i-1))));
        end
    elseif strcmp(modo, 'Heun')
        while w(i) > cond
            i = i+1;
            tv(i) = tv(i-1) + h;
            w(i) = w(i-1) + h/4*(f(tv(i-1),w(i-1)) + 3*f(tv(i-1)+2*h/3, w(i-1)+2*h/3*f(tv(i-1)+h/3,w(i-1)+h/3*f(tv(i-1),w(i-1)))));
        end
    elseif strcmp(modo, 'RK4')
        while w(i) > cond
            i = i+1;
            tv(i) = tv(i-1) + h;
            k1 = h*f(tv(i-1), w(i-1));
            k2 = h*f(tv(i-1)+h/2, w(i-1)+k1/2);
            k3 = h*f(tv(i-1)+h/2, w(i-1)+k2/2);
            k4 = h*f(tv(i), w(i-1)+k3);
            w(i) = w(i-1) + 1/6*(k1+2*k2+2*k3+k4);
        end
    end
end