syms x
f(x) = sin(x);
a = 0;
b = pi/4;
R = romberg(f, a, b, 5, 5)

%%