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

iterativos(a, b, x1, 10^(-3), 'jacobi')
iterativos(a, b, x1, 10^(-3), 'gauss-siedel')
refinamiento(a,b,x2, 10^(-3) , 5)

%%
a = [3 -0.1 -0.2;
    0.1  7 -0.3;
    0.3 -0.2 10];
b = [7.85; -19.3; 71.4];

x1 = [7.85/3; -19.3/7; 71.4/10];

D = diag(diag(a));
LU = a-D;
T = inv(D)*LU;
c = inv(D)*b;
x2 = T*x1+c;

iterativos(a, b, x1, 10^(-3), 'jacobi')
iterativos(a, b, x1, 10^(-3), 'gauss-siedel')
refinamiento(a,b,x2, 10^(-3) , 5)