function  R = romberg(f, a, b, i, j)
    if j == 1
        h = (b-a)/2^(i-1);
        aux = 0;
        for k = 1:2^(i-1)-1
            aux = aux + f(a+k*h);
        end
        aux = 2*aux;
        aux = aux + f(a);
        aux = aux + f(b);
        R = h/2*aux;
    else
        R = (1+1/(4^(j-1)-1))*romberg(f,a,b,i,j-1) - 1/(4^(j-1)-1)*romberg(f,a,b,i-1,j-1);
    end
    R = vpa(R);
end