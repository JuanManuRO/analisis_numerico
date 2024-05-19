function resp = extrapolacion_richardson(f, x, j, h, method)
    if j  == 1
        if strcmp(method,'definition')
            resp = vpa((f(x+h)-f(0.5))/h);
        elseif strcmp(method,'3point-extremes')
            resp = vpa(1/(2*h)*(-3*f(x)+4*f(x+h)-f(x+2*h)));
        elseif strcmp(method,'3point-middle')
            resp = vpa(1/(2*h)*(f(x+h)-f(x-h)));
        elseif strcmp(method,'5point-extremes')
            resp = vpa(1/(12*h)*(-25*f(x)+48*f(x+h)-36*f(x+2*h)+16*f(x+3*h)-3*f(x+4*h)));
        elseif strcmp(method,'5point-middle')
            resp = vpa(1/(12*h)*(f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h)));
        end
    else
        resp = vpa(extrapolacion_richardson(f, x,j-1, h/2, method) + (extrapolacion_richardson(f, x, j-1, h/2, method) - extrapolacion_richardson(f, x, j-1, h, method))/(4^(j-1)-1));
    end
end
