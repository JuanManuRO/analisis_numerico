function x = iterativos(a,b, x0, e, metodo)
    D = diag(diag(a));
    LU = D-a;
    L = tril(LU);
    U = triu(LU);
    aux = x0;
    if strcmp(metodo, 'jacobi')
        T = inv(D)*LU;
        c = inv(D)*b;
    elseif strcmp(metodo, 'gauss-siedel')
        T = inv(D-L)*U;
        c = inv(D-L)*b;
    end
    x = T*aux+c;
    while max(abs(x-aux))/max(abs(x)) > e
        aux = x;
        x = T*aux+c;
    end
end