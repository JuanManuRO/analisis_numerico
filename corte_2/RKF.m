function [w, w2, tv] = RKF(f, a, b, y0, hmin, hmax, e)
    format longG
    w(1) = y0;
    w2(1) = y0;
    tv(1) = a;
    h = hmax;
    i = 1;
    while tv(i) + h <= b
        k1 = vpa(h*f(tv(i), w(i)));
        k2 = vpa(h*f(tv(i)+h/4, w(i)+k1/4));
        k3 = vpa(h*f(tv(i)+3*h/8, w(i)+3*k1/32+9*k2/32));
        k4 = vpa(h*f(tv(i)+ 12*h/13, w(i)+1932*k1/2197-7200*k2/2197+7296*k3/2197));
        k5 = vpa(h*f(tv(i)+h, w(i)+439/216*k1-8*k2+3680*k3/513-845*k4/4104));
        k6 = vpa(h*f(tv(i)+h/2, w(i)-8*k1/27+2*k2 - 3544*k3/2565 + 1859*k4/4104 - 11*k5/40));

        i = i+1;
        
        w2(i) = w(i-1) + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55;
        w(i) = w(i-1) + 25*k1/216 + 1408*k3/2565 + 2197*k4/4104 - k5/5;
        tv(i) = tv(i-1)+h;
        if tv(i) == b
            break
        end
        R = abs(w2(i)-w(i))/h;
        if R > e
            i = i-1;
        end
        q = (e/(2*R))^(1/4);
        h = max(q*h,hmin);
        h = min(h, hmax);
        h = min(h, b-tv(i));
    end
end
