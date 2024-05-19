x0 = 1.5;
x1 = 4-exp(x0);
x2 = 4-exp(x1);
x3 = 4-exp(x2);
x4 = 4-exp(x3);
x5 = 4-exp(x4);
x6 = 4-exp(x5);


%%
aux1 = 1.5;
aux2 = exp(aux1)-4+2*aux1;

n = 2;

for i = 1:n
    aux1 = aux2;
    aux2 = exp(aux1)-4+2*aux1;
end
aux2

%%
aux1 = 0.5;
aux2 = 0.2*sin(x0)+ 0.5;

n = 10;

for i = 1:n
    aux1 = aux2;
    aux2 = 0.2*sin(aux1)+0.5;
end
aux2
abs(aux2-aux1)

%%
syms x
f(x) = 0.2*sin(x) + 0.5;
a = 0;
b = 1;
aux1 = 0.5;
aux2 = f(aux1);
e = abs(aux2 - aux1);

f1 = diff(f);
if (f1(a)<=1) && (f1(b)<=1)
    while e > 10^(-7)
        aux1 = aux2;
        aux2 = 0.2*sin(aux1)+0.5;
        e = abs(aux2 - aux1);
    end
end

vpa(aux2)

%%
syms x
f(x) = 0.2*sin(x) + 0.5;
a = 0;
b = 1;
alpha = 

iter_punto_fijo(f, a, b, alpha)