syms x
f(x) = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;
h = 0.5;
n1 = vpa((f(0.5+h/2)-f(0.5))/(h/2))
n2 = n1 + (n1 - vpa((f(0.5+h)-f(0.5))/h))/(4-1)
f1(x) = diff(f);
vpa(f1(0.5))

%%

syms x
f(x) = 1/2*atan(sqrt(x));
xans = vpa(f(0.5))

h = 0.5;
n1 = vpa((f(0.5+h/2)-f(0.5))/(h/2))
n2 = n1 + (n1 - vpa((f(0.5+h)-f(0.5))/h))/(4-1)
f1(x) = diff(f);
vpa(f1(0.5))

%%
syms x
f(x) = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;

extrapolacion_richardson(f,2,0.5)

f1(x) = diff(f);
vpa(f1(0.5))

%%
syms x
f(x) = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;

extrapolacion_richardson(f, 0.5, 8, 0.5, 'definition')

f1(x) = diff(f);
vpa(f1(0.5))