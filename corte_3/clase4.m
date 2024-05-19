a = [10 -1 2 0;
    -1  11 -1 3;
    2 -1 10 -1;
    0 3 -1 8];
b = [6; 25; -11; 15];

D = diag(diag(a));

LU = a-D;

x1 = [3/5; 25/11; -11/10; 15/8];

T = inv(D)*LU;
c = inv(D)*b;

x2 = T*x1+c;

max(abs(x2-x1))/max(abs(x2))

x3 = T*x2+c;

max(abs(x3-x2))/max(abs(x3))

x4 = T*x3+c;

max(abs(x4-x3))/max(abs(x4))

x5 = T*x4+c;

max(abs(x5-x4))/max(abs(x5))

x6 = T*x5+c;

max(abs(x6-x5))/max(abs(x6))

x7 = T*x6+c;

max(abs(x7-x6))/max(abs(x7))

x8 = T*x7+c;

max(abs(x8-x7))/max(abs(x8))

x9 = T*x8+c;

max(abs(x9-x8))/max(abs(x9))

x9

iterativos(a, b, x1, 10^(-3), 'jacobi')
iterativos(a, b, x1, 10^(-3), 'gauss-siedel')

%%
a = [3 -0.1 -0.2;
    0.1  7 -0.3;
    0.3 -0.2 10];
b = [7.85; -19.3; 71.4];

x1 = [7.85/3; -19.3/7; 71.4/10];

iterativos(a, b, x1, 10^(-3), 'jacobi')
iterativos(a, b, x1, 10^(-3), 'gauss-siedel')
