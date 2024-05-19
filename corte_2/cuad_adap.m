function  S = cuad_adap(f, a, b, fase, epsilon)
    if strcomp(fase, 'final')
        h = (b-a)/2;
        S = h/3*(f(a)+4*f(a+h)+f(b));
    elseif strcomp(fase, 'iter')
        h = (b-a)/2;
        S = cuad_adap(f,a,b,'final',epsilon);
        S1 = cuad_adap(f,a,b,'final',epsilon);
        S2 = cuad_adap(f,a,b,'final',epsilon);
        if abs(S-S1-S2) > epsilon
            S = cuad_adap(f,a,b,'iter',epsilon) + cuad_adap(f,a,b,'iter',epsilon);
        end
    end
    S = vpa(S);
end