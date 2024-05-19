function [M,x] = factorizacion(a,b)
    n = size(a);
    L = zeros(n);
    n = n(1);
    for i = 1:n
        L(i,i) = 1;
        for j = i+1:n
            m = a(j,i)/(a(i,i));
            a(j,:) = a(j,:) - m*a(i,:);
            L(j,i) = m;
        end
    end
    
    %y = L\b; % Reemplazar
    y = pivoteo(L,b,'escalado', 0, 0);
    %x = a\y; % Reemplazar
    x = pivoteo(a,y,'escalado', 0, 0);
    
    M = zeros(n);
    for i = 1:n
        c = zeros(n,1);
        c(i) = 1;
        %d = L\c; % Reemplazar
        d = pivoteo(L,c,'escalado', 0, 0);
        M(:,i) = a\d;
    end
end