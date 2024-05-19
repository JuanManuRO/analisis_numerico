% y1 = y - t²+1
syms y
syms t
f(t,y) = y - t ^2 +1;

N = 10;
h = 2/N;
t2 = 0:h:2;
w = [0.5];

for i = 2:N+1
    T = f(t2(i-1)+h/2, w(i-1)+h/2*f(t2(i-1), w(i-1)));
    w(i) = w(i-1) + h*T;
end

real = (t2+1).^2-0.5*exp(t2)
w


w2 = [0.5];
for i = 2:N+1
    w2(i) = w2(i-1) + h/2*(f(t2(i-1),w2(i-1))+f(t2(i),w2(i-1)+h*f(t2(i-1),w2(i-1))));
end
w2

w3 = [0.5];
for i = 2:N+1
    w3(i) = w3(i-1) + h/4*(f(t2(i-1),w3(i-1)) + 3*f(t2(i-1)+2*h/3, w3(i-1)+2*h/3*f(t2(i-1)+h/3,w3(i-1)+h/3*f(t2(i-1),w3(i-1)))));
end
w3

w4 = [0.5];
for i = 2:N+1
    k1 = h*f(t2(i-1), w4(i-1));
    k2 = h*f(t2(i-1)+h/2, w4(i-1)+k1/2);
    k3 = h*f(t2(i-1)+h/2, w4(i-1)+k2/2);
    k4 = h*f(t2(i), w4(i-1)+k3);
    w4(i) = w4(i-1) + 1/6*(k1+2*k2+2*k3+k4);
end
w4