syms x;
f(x)= exp(x)*cos(x)-x^2+3*x;

f1 = diff(f);

x0 = 2;
x1 = x0 - (f(x0)/f1(x0));

e = abs(x1-x0);
alpha = 10^(-5);
counter = 0;
while e > alpha
    x1 = x0 - (f(x0)/f1(x0));
    e = abs(x1-x0);
    x0 = vpa(x1);
    counter = counter + 1;
end
counter = counter - 1;
vpa(x0)
counter

%% von Mises
syms x;
f(x)= exp(x)*cos(x)-x^2+3*x;

f1 = diff(f);

x0 = 2;
aux = f1(x0);
x1 = x0 - (f(x0)/aux);

e = abs(x1-x0);
alpha = 10^(-5);
counter = 0;
while e > alpha
    x1 = x0 - (f(x0)/aux);
    e = abs(x1-x0);
    x0 = vpa(x1);
    counter = counter + 1;
end
counter = counter - 1;
vpa(x0)
counter

%% Secante
syms x;
f(x)=x^3+2*x^2+10*x-20;

x0 = 1;
x1 = 2;
e = abs(x1-x0);
alpha = 10^(-5);

while e > alpha
    c = x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
    x0 = x1;
    x1 = c;
    e = abs(x1-x0);
end

vpa(x1)

