x = [1,2];
fx = x.^3+4*x.^2-10;
r = roots([1 4 0 -10]);
resp = real(r(3));

errors = (x - resp)./resp.*100;

while any(errors>2)
    aprox = x.^3+4*x.^2-10;
    new = aprox^3+4*aprox^2-10;
    if new < 0
        if fx(1) < 0
            x(1) = aprox;
        else
            x(2) = aprox;
        end
    elseif new > 0
        if fx(1) > 0
            x(1) = aprox;
        else
            x(2) = aprox;
        end
    else
        x = aprox;
        break
    end
    errors = (x - resp)./resp.*100;
end

%%
x = [1,2];
fx = x.^3+4*x.^2-10;
r = roots([1 4 0 -10]);
resp = real(r(3));

errors = (x - resp)./resp.*100;

while any(errors>2)
    aprox = x(2)-fx(2)*(x(2)-x(1))/(fx(2)-fx(1));
    new = aprox^3+4*aprox^2-10;
    if new < 0
        if fx(1) < 0
            x(1) = aprox;
        else
            x(2) = aprox;
        end
    elseif new > 0
        if fx(1) > 0
            x(1) = aprox;
        else
            x(2) = aprox;
        end
    else
        x = aprox;
        break
    end
    errors = (x - resp)./resp.*100;
end