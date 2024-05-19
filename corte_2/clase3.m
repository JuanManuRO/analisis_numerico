syms x
f(x) = x^2;
true = vpa(int(f, 0, 2))

x0 = 0;
x1 = 2;
h = x1-x0;

trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson

%%
syms x
f(x) = x^4;
true = vpa(int(f, 0, 2))

x0 = 0;
x1 = 2;
h = x1-x0;

trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson


%%
syms x
f(x) = (x+1)^(-1);
true = vpa(int(f, 0, 2))

x0 = 0;
x1 = 2;
h = x1-x0;

trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson

%%
syms x
f(x) = sqrt(1+x^2);
true = vpa(int(f, 0, 2))

x0 = 0;
x1 = 2;
h = x1-x0;

trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson

%%
syms x
f(x) = sin(x);
true = vpa(int(f, 0, 2))

x0 = 0;
x1 = 2;
h = x1-x0;

trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson

%%
syms x
f(x) = exp(x);
true = vpa(int(f, 0, 2))

x0 = 0;
x1 = 2;
h = x1-x0;

trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson

%%
syms x
f(x) = sin(x);
true = vpa(int(f, 0, pi/4))

x0 = 0;
x1 = pi/4;
h = x1-x0;

% cerradas
trapez = vpa(h/2*(f(x0)+f(x1)))
true-trapez

h = (x1-x0)/2;

simpson = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson

h = (x1-x0)/3;

simpson38 = vpa(3*h/8*(f(x0)+3*f(x0+h)+3*f(x0+2*h)+f(x1)))
true - simpson38

h = (x1-x0)/4;

boole = vpa(2*h/45*(7*f(x0)+32*f(x0+h)+12*f(x0+2*h)+32*f(x0+3*h)+7*f(x1)))
true - boole

% abiertas
h = (x1-x0)/2
trapez = vpa(2*h*f(x0+h))
true-trapez

h = (x1-x0)/3;

simpson = vpa(3*h/2*(f(x0+h)+f(x0+2*h)))
true - simpson

h = (x1-x0)/4;

simpson38 = vpa(4*h/3*(2*f(x0+h)-f(x0+2*h)+2*f(x0+3*h)))
true - simpson38

h = (x1-x0)/5;

boole = vpa(5*h/24*(11*f(x0+h)+f(x0+2*h)+f(x0+3*h)+11*f(x0+4*h)))
true - boole

%%
syms x
f(x) = exp(x);
true = vpa(int(f, 0, 4))

x0 = 0;
x1 = 4;
h = (x1-x0)/2;

simpson1 = vpa(h/3*(f(x0)+4*f(x0+h)+f(x1)))
true - simpson1

h = (x1-x0)/4;

simpson2 = vpa(h/3*(f(x0)+4*f(x0+h)+f(x0+2*h))) + vpa(h/3*(f(x0+2*h)+4*f(x0+3*h)+f(x1)))
true - simpson2

h = (x1-x0)/8;

simpson3 = vpa(h/3*(f(x0)+4*f(x0+h)+f(x0+2*h))) + vpa(h/3*(f(x0+2*h)+4*f(x0+3*h)+f(x0+4*h))) + vpa(h/3*(f(x0+4*h)+4*f(x0+5*h)+f(x0+6*h))) + vpa(h/3*(f(x0+6*h)+4*f(x0+7*h)+f(x1)))
true - simpson3