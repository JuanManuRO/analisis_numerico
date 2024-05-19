y = [6.495 6.595 6.615 6.635 6.485 6.555 6.665 6.505 6.435 6.625 6.715 6.655 6.755 6.625 6.715 6.575 6.655 6.605 6.565 6.515 6.555 6.395 6.775 6.685];

n = length(y)

ymed = sum(y)/n

sy = sqrt(sum((y-ymed).^2)/(n-1))

s2y = sum((y-ymed).^2)/(n-1)

cv = sy/ymed*100

%%
x = [1 2 3 4 5 6 7];
y = [0.5 2.5 2 4 3.5 6 5.5];

n = length(x);

a1 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)^2)
a0 = (sum(y)-a1*sum(x))/n

plot(x,y)
hold on
xl = 1:0.1:7;
plot(xl,polyval([a1 a0],xl))
hold off

Sr = sum((y-a0-a1*x).^2);
Syx = sqrt(Sr^2/(n-2))

Sr

St = sum((y-sum(y)/n).^2);
r = sqrt((St-Sr)/St)
%%

x = [1 2 3 4 5];
y = [0.5 1.7 3.4 5.7 8.4];
syms t

n = length(x);

plot(x,y)
hold on

ly = log(y);
a1 = (n*sum(x.*ly)-sum(x)*sum(ly))/(n*sum(x.^2)-sum(x)^2)
a0 = (sum(ly)-a1*sum(x))/n
fplot(exp(a0)*exp(a1*t))

lx = log(x);
a1 = (n*sum(lx.*ly)-sum(lx)*sum(ly))/(n*sum(lx.^2)-sum(lx)^2)
a0 = (sum(ly)-a1*sum(lx))/n
fplot(exp(a0)*t^(a1))

iy = 1./y;
ix = 1./x;
a1 = (n*sum(ix.*iy)-sum(ix)*sum(iy))/(n*sum(ix.^2)-sum(ix)^2)
a0 = (sum(iy)-a1*sum(ix))/n
fplot(1/a0*t/(a1/a0+t))

xlim([1 5])
hold off
legend('real', 'exponencial', 'potencial', 'fracional')

%%
x = [0 1 2 3 4 5];
y = [2.1 7.7 13.6 27.2 40.9 61.1];

x2 = x.^2;
n = length(x);

a = [n sum(x) sum(x2);
    sum(x) sum(x2) sum(x.^3);
    sum(x2) sum(x.^3) sum(x.^4)];
b = [sum(y); sum(x.*y); sum(x2.*y)];

as = a\b;

scatter(x,y)
hold on
xl = 0:0.1:5;
plot(xl,polyval(flip(as),xl))
hold off

%%
x1 = [0 2 2.5 1 4 7];
x2 = [0 1 2 3 6 2];
y = [5 10 9 0 3 27];
n = length(x);

a = [n sum(x1) sum(x2);
    sum(x1) sum(x1.^2) sum(x1.*x2);
    sum(x2) sum(x1.*x2) sum(x2.^2)];
b = [sum(y); sum(x1.*y); sum(x2.*y)];

as = a\b;
as

scatter3(x1,x2,y)
hold on
xl1 = 0:7/100:7;
xl2 = 0:6/100:6;
plot3(xl1,xl2,as(1)+as(2)*xl1+as(3)*xl2)
hold off

%%
x = [0.25 0.75 1.25 1.75 2.25]
y = [0.28 0.57 0.68 0.74 0.79]

syms xv a0 a1
f(xv,a0,a1) = a0*(1-exp(-a1*x));
