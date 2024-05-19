function f = interpolacion_lagrange(xcoords, ycoords)
    syms x;
    f = 0;
    for i = 1:length(ycoords)
        term = ycoords(i);
        for j = 1:length(xcoords)
            if j ~= i
                term = term * (x-xcoords(j))/(xcoords(i)-xcoords(j));
            end
        end
        f = f + term;
    end
    f = vpa(f);
end