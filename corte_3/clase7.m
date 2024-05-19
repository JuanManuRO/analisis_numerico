x = [1 1/2 1/3 1/4;
    1/2 1/3 1/4 1/5;
    1/3 1/4 1/5 1/6;
    1/4 1/5 1/6 1/7];

b = [2/pi; 1/pi; (pi^2-4)/pi^3; (pi^2-6)/pi^3];

a = x\b
x = linspace(0,1, 100);
plot(x, sin(pi*x))
hold on
plot(x,polyval(flip(a),x))
hold off
%%

x = linspace(-1,1,100);
y = exp(x);
plot(x,y)
hold on
al = regresion(x,y);
al
plot(x, polyval(flip(al),x))

ap = regresion([x; x.^2],y);
plot(x, polyval(flip(ap),x))
hold off
legend('real', 'linea', 'parabola')

%%
syms t
x = linspace(1,2,100);
y = 1./x;
plot(x,y)
hold on
% t = 2x-3
% y = 2/(t+3)
aux0 = @(t) 2./(t+3);
aux1 = @(t) 2*t./(t+3);
a0 = integral(aux0,-1,1)/2
%aux1 = @(t)  2./(t+3).*(3*t.^2-1)/2
a1 = 3/2*integral(aux1,-1,1)

plot(x, polyval([a1 a0],2*x-3))
hold off
legend('real', 'linea', 'parabola')