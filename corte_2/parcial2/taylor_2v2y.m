function  [w,tv] = taylor_2v2y(f1, f2, a, h, y10, y20, modo, cond)
    syms y
    syms v
    syms t
    %h = (b-a)/N;
    %tv = a:h:b;
    tv(1) = a;
    %w = zeros(2,N+1);
    w(:,1) = [y10; y20];
    i = 1;
    if strcmp(modo, 'euler')
        for i = 2:N+1
            w(:,i) = w(:,i-1) + h*[f1(tv(i-1), w(1,i-1), w(2,i-1));  f2(tv(i-1), w(1,i-1), w(2,i-1))];
        end
    elseif strcmp(modo, 'RK4')
        while w(2,i) > cond
            i = i+1;
            tv(i) = tv(i-1) + h;
            k1 = vpa(h*[f1(tv(i-1), w(1,i-1), w(2,i-1));  f2(tv(i-1), w(1,i-1), w(2,i-1))]);
            k2 = vpa(h*[f1(tv(i-1), w(1,i-1)+k1(1)/2, w(2,i-1)+k1(2)/2);  f2(tv(i-1), w(1,i-1)+k1(1)/2, w(2,i-1)+k1(2)/2)]);
            k3 = vpa(h*[f1(tv(i-1), w(1,i-1)+k2(1)/2, w(2,i-1)+k2(2)/2);  f2(tv(i-1), w(1,i-1)+k2(1)/2, w(2,i-1)+k2(2)/2)]);
            k4 = vpa(h*[f1(tv(i), w(1,i-1)+k3(1), w(2,i-1)+k3(2));  f2(tv(i), w(1,i-1)+k3(1), w(2,i-1)+k3(2))]);
            w(:,i) = w(:,i-1) + 1/6*(k1+2*k2+2*k3+k4);
        end
    end
end