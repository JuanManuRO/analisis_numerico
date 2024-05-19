syms x
f(x) = -1.386294/6*(x^2-7*x+6)+1.791759/10*(x^2-5*x+4);
vpa(f(2))

%%
syms x
f(x) = exp(x);

x_a = [-1 0 1 2 3 ];
y_a = f(x_a);

p1 = y_a(1)+(y_a(2)-y_a(1))*(x-x_a(1))/(x_a(2)-x_a(1));

p2 = y_a(1)+(y_a(2)-y_a(1))*(x-x_a(1))/(x_a(2)-x_a(1));

fplot(f)
hold on
fplot(p1)

%%
syms x
f(x) = exp(x);
x_a = [-1 0 1 2 3 ];
y_a = f(x_a);

fplot(f)
hold on
for i = 2:length(x_a)
    fplot(interpolacion_lagrange(x_a(1:i),y_a(1:i)))
end

