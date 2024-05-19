syms t
syms y
f(t,y) = y - t^2 + 1;
[w, w2, tv] = RKF(f,0,2,0.5,0.01,0.25, 10^(-5));
real(t) = (t+1)^2-0.5*exp(t);

plot(w,tv)
hold on
plot(w2,tv)
plot(vpa(real(tv)), tv)
legend('Primer metodo', 'Segundo metodo', 'Real')
hold off
