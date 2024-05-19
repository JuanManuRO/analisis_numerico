function x = refinamiento(a,b, x0, e, t)
    r = b-a*x0;
    %y = a\r; % Reemplazar por gauss
    y = pivoteo(a,r,'redondeo',t , false);
    x = x0+y;
    K = max(abs(y))*max(abs(x));

    while K*max(abs(r))/max(abs(a),[],"all") > e
        x0 = x;
        r = b-a*x0;
        %y = a\r; % Reemplazar por gauss
        y = pivoteo(a,r,'redondeo',t, false);
        x = x0+y;
    end
end