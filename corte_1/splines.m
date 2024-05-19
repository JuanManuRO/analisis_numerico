function p = splines(x, y)
    n = length(x)-1;

    matrix = zeros(4*n);
    mat_y = zeros(4*n,1);
    
    % cond uno
    for i  = 1:n
        matrix(i,4*i-3) = 1;
        mat_y(i) = y(i);
    end
    for i = 0:3
        matrix(n+1,4*n-3+i) = (x(end)-x(n))^i;
    end
    mat_y(n+1) = y(end);
    
    % cond dos
    for i = 1:n-1
        for j = 0:3
            matrix(n+1+i, 4*i-3+j) = (x(i+1)-x(i))^j;
        end
        matrix(n+1+i, 4*i+1) = -1;
    end
    
    % cond tres
    for i  = 1:n-1
        for j = 0:2
            matrix(i+2*n,j+4*i-2) = (j+1)*(x(i+1)-x(i))^j;
        end
        matrix(i+2*n,4*i+2) = -1;
    end
    
    % cond cuatro
    for i  = 1:n-1
        for j = 0:1
            matrix(3*n+i-1,j+4*i-1) = (j+1)*(j+2)*(x(i+1)-x(i))^j;
        end
        matrix(3*n+i-1,4*i+3) = -2;
    end
    
    % cond cinco
    matrix(4*n-1, 3) = 1;
    matrix(4*n, 4*n-1) = 2;
    matrix(4*n, 4*n) = 6*(x(end)-x(n));

    p = matrix \ mat_y;

end