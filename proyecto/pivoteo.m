function [x,con] = pivoteo(a,b,metodo, r, conteo)
    n = size(a);
    n = n(1);
    x = zeros(n,1);
    if conteo
        con = 0;
    end
    if strcmp(metodo, 'gaussiana')
        for i = 1:n
            for j = i+1:n
                m = a(j,i)/(a(i,i));
                a(j,:) = a(j,:) - m*a(i,:);
                b(j,:) = b(j,:) - m*b(i,:);
                if conteo
                    con = con + 5;
                end
            end
        end
    elseif strcmp(metodo, 'parcial')
        for i = 1:n
            [M, ind] = max(abs(a(i:end,i)));
            ind = ind+i-1;
            a([i,ind],:) = a([ind,i],:);
            b([i,ind],:) = b([ind,i],:);
            if conteo
                con = con + 2;
            end
            for j = i+1:n
                m = a(j,i)/(a(i,i));
                a(j,:) = a(j,:) - m*a(i,:);
                b(j,:) = b(j,:) - m*b(i,:);
                if conteo
                    con = con + 5;
                end
            end
        end
    elseif strcmp(metodo, 'escalado')
        S = max(abs(a), [], 2);
        for i = 1:n
            [M, ind] = max(abs(a(i:end,i))./abs(S(i:end)));
            if conteo
                con = con + length(ind);
            end
            ind = ind+i-1;
            a([i,ind],:) = a([ind,i],:);
            b([i,ind],:) = b([ind,i],:);
            S([i,ind],:) = S([ind,i],:);
            if conteo
                con = con + 3;
            end
            for j = i+1:n
                m = a(j,i)/(a(i,i));
                a(j,:) = a(j,:) - m*a(i,:);
                b(j,:) = b(j,:) - m*b(i,:);
                if conteo
                    con = con + 5;
                end
            end
        end
    elseif strcmp(metodo, 'redondeo')
        S = max(abs(a), [], 2);
        for i = 1:n
            [M, ind] = max(abs(a(i:end,i))./abs(S(i:end)));
            ind = ind+i-1;
            a([i,ind],:) = round(a([ind,i],:));
            b([i,ind],:) = round(b([ind,i],:));
            S([i,ind],:) = round(S([ind,i],:));
            for j = i+1:n
                m = round(round(a(j,i),r)/round(a(i,i),r),r);
                a(j,:) = round(round(a(j,:),r) - round(m*a(i,:),r),r);
                b(j,:) = round(round(b(j,:),r) - round(m*round(b(i,:),r),r),r);
            end
        end
        for i = n:-1:1
            num = round(b(i),r);
            for j = i+1:n
                num = round(num - round(round(a(i,j),r)*x(j),r),r);
            end
            x(i) = round(num/round(a(i,i),r),r);
        end
    end
    if ~strcmp(metodo, 'redondeo')
        for i = n:-1:1
            num = b(i);
            for j = i+1:n
                num = num - a(i,j)*x(j);
            end
            x(i) = num/a(i,i);
        end
    end
end