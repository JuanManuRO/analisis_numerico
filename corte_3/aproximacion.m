function as = aproximacion(f, a, b, metodo, grado, n)
    syms x
    if strcmp(metodo, 'polinomio')
        aux = ones(grado+1,grado+1);
        aux2 = ones(grado+1,1);
        for i = 1:grado+1
            for j = 1:grado+1
                g(x) = x^(i+j-2);
                aux(i,j) = integracion_numerica(g, a, b, 'cerrado', 'boole', 4*n);
            end
            h(x) = f*x^(i-1);
            aux2(i) = integracion_numerica(h, a, b, 'cerrado', 'boole', 4*n);
        end
        as = pivoteo(aux,aux2,'escalado', 0, 0);
    elseif strcmp(metodo, 'polinomio_discreto')
        auxx = f(1,a:b);
        auxy = f(2,a:b);
        aux = ones(grado+1,grado+1);
        aux2 = ones(grado+1,1);

        deltax = auxx(a+1:end)-auxx(a:b-1);
        avgx = (auxx(a+1:end)+auxx(a:b-1))/2;
        avgy = (auxy(a+1:end)+auxy(a:b-1))/2;
        for i = 1:grado+1
            for j = 1:grado+1
                %g(x) = x^(i+j-2);
                aux(i,j) = sum(avgx.^(i+j-2).*deltax);
                %aux(i,j) = integracion_numerica(g, a, b, 'cerrado', 'boole', 4*n);
            end
            %h(x) = f*x^(i-1);
            aux2(i) = sum(avgy.*avgx.^(i-1).*deltax);
            %aux2(i) = integracion_numerica(h, a, b, 'cerrado', 'boole', 4*n);
        end
        as = pivoteo(aux,aux2,'escalado', 0, 0);

    elseif strcmp(metodo, 'legendre') % a = -1 y b = 1 si no adaptar
        as = ones(grado+1,1);
        p1 = 0;
        p0(x) = x^0;
        for i = 1:grado+1
            aux(x) = f*p0;
            as(i) = (2*(i-1)+1)/2 * integracion_numerica(aux, a, b, 'cerrado', 'boole', 4*n);
            p2 = p1;
            p1 = p0;
            p0(x) = ((2*(i-1)+1)*x*p1-(i-1)*p2)/i;
        end

    elseif strcmp(metodo, 'legendre_discreto') % a = -1 y b = 1 si no adaptar
        auxx = f(1,a:b);
        auxy = f(2,a:b);
        deltax = auxx(a+1:end)-auxx(a:b-1);
        avgx = (auxx(a+1:end)+auxx(a:b-1))/2;
        avgy = (auxy(a+1:end)+auxy(a:b-1))/2;

        as = ones(grado+1,1);
        p1 = 0;
        p0(x) = x^0;
        for i = 1:grado+1
            as(i) = (2*(i-1)+1)/2 * sum(avgy.*p0(avgx).*deltax);
            %as(i) = (2*(i-1)+1)/2 * integracion_numerica(aux, a, b, 'cerrado', 'boole', 4*n);
            p2 = p1;
            p1 = p0;
            p0(x) = ((2*(i-1)+1)*x*p1-(i-1)*p2)/i;
        end

    elseif strcmp(metodo, 'fourier continua')
        T = b-a;
        as = zeros(grado+1,2);
        L = T/2;
        as(1,1) = 1/L*integracion_numerica(f, a, b, 'cerrado', 'boole', 4*n);
        w = 2*pi/T;
        for i = 1:grado
            aux(x) =  f*cos(i*w*x);
            as(i+1,1) = 1/L*integracion_numerica(aux, a, b, 'cerrado', 'boole', 4*n);
            aux(x) =  f*sin(i*w*x);
            as(i+1,2) = 1/L*integracion_numerica(aux, a, b, 'cerrado', 'boole', 4*n);
        end
    elseif strcmp(metodo, 'fourier discreta')
        auxx = f(1,a:b);
        auxy = f(2,a:b);
        T = b; % b debe ser par
        as = zeros(grado+1,2);
        L = T/2;
        for i = 1:grado+1
            as(i,1) =1/L*sum(auxy.*cos((i-1)*auxx));
            as(i,2) =1/L*sum(auxy.*sin((i-1)*auxx));
        end
    end
end