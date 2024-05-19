function  res = integracion_numerica(f, a, b, modo, metodo, n)
    if strcmp(modo, 'cerrado')
        h = (b-a)/n;
        if strcmp(metodo, 'trapecio')
            res = vpa(h/2*(f(a)+2*sum(f(a+(1:n-1)*h))+f(b)));
        elseif strcmp(metodo, 'simpson13')
            if rem(n,2) == 0
                res = vpa(h/3*(f(a)+2*sum(f(a+(2:2:n-1)*h))+4*sum(f(a+(1:2:n-1)*h))+f(b)));
            else
                res = 'No definida para n impar';
            end
        elseif strcmp(metodo, 'simpson38')
            if rem(n,3) == 0
                res = vpa(3*h/8*(f(a)+2*sum(f(a+(3:3:n-1)*h))+3*sum(f(a+(2:3:n-1)*h))+3*sum(f(a+(1:3:n-1)*h))+f(b)));
            else
                res = 'No definida para n no divisibles por 3';
            end
        elseif strcmp(metodo, 'boole')
            if rem(n,4) == 0
                res = vpa(2*h/45*(7*f(a)+14*sum(f(a+(4:4:n-1)*h))+32*sum(f(a+(3:4:n-1)*h))+12*sum(f(a+(2:4:n-1)*h))+32*sum(f(a+(1:4:n-1)*h))+7*f(b)));
            else
                res = 'No definida para n no divisibles por 4';
            end
        end
    elseif strcmp(modo, 'abierto')
        h = (b-a)/(n+2);
        a = a+h;
        if strcmp(modo, 'punto medio')
            if rem(n,2) == 0
                res = vpa(2*h*sum(f(a+(0:2:n)*h)));
            else
                res = 'No definida para n impar';
            end
        elseif n == 1
            res = vpa(3*h/2*(f(a)+f(a+h)));
        elseif n == 2
            res = vpa(4*h*3*(2*f(a)-f(a+h)+2*f(a+2*h)));
        elseif n == 3
            res = vpa(5*h*24*(11*f(a)+f(a+h)+f(a+2*h)+11*f(a+3*h)));
        end
    end
end