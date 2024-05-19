x = [1 2 3];
y = [2 3 5];

n = length(x)-1;

matrix = zeros(3*n);
mat_y = zeros(3*n,1);

% cond uno
for i  = 1:n-1
    for j = 0:2
        matrix(2*i-1,j+3*i-2) = x(i+1)^j;
        matrix(2*i,j+3*i+1) = x(i+1)^j;
    end
    mat_y(2*i-1) = y(i+1);
    mat_y(2*i) = y(i+1);
end

% cond dos
for j = 0:2
    matrix(2*n-1,j+1) = x(1)^j;
    matrix(2*n,j+3*n-2) = x(end)^j;

    mat_y(2*n-1) = y(1);
    mat_y(2*n) = y(end);
end

% cond tres
for i  = 1:n-1
    for j = 0:1
        matrix(i+2*n,j+3*i-1) = (j+1)*x(i+1)^j;
        matrix(i+2*n,j+3*i+2) = -(j+1)*x(i+1)^j;
    end
end

% cond cuatro
matrix(end,3) = 1;


p = matrix \ mat_y;

scatter(x,y)
hold on

range1 = x(1):.01:x(2);
range2 = x(2):.01:x(3);
plot(range1,polyval(flip(p(1:3)), range1))
plot(range2,polyval(flip(p(4:6)), range2))
hold off

%%

x = [3 4.5 7 9];
y = [2.5 1 2.5 0.5];

n = length(x)-1;

matrix = zeros(4*n);
mat_y = zeros(4*n,1);

% cond uno
for i  = 1:n
    matrix(i,4*i-3) = 1;
    mat_y(i) = y(i);
end
for i = 0:3
    matrix(n+1,4*n-3+i) = (x(end)-x(n))^i;
end
mat_y(n+1) = y(end);

% cond dos
for i = 1:n-1
    for j = 0:3
        matrix(n+1+i, 4*i-3+j) = (x(i+1)-x(i))^j;
    end
    matrix(n+1+i, 4*i+1) = -1;
end

% cond tres
for i  = 1:n-1
    for j = 0:2
        matrix(i+2*n,j+4*i-2) = (j+1)*(x(i+1)-x(i))^j;
    end
    matrix(i+2*n,4*i+2) = -1;
end

% cond cuatro
for i  = 1:n-1
    for j = 0:1
        matrix(3*n+i-1,j+4*i-1) = (j+1)*(j+2)*(x(i+1)-x(i))^j;
    end
    matrix(3*n+i-1,4*i+3) = -2;
end

% cond cinco
matrix(4*n-1, 3) = 1;
matrix(4*n, 4*n-1) = 2;
matrix(4*n, 4*n) = 6*(x(end)-x(n));

p = matrix \ mat_y;

scatter(x,y)
hold on

range1 = x(1):.01:x(2);
range2 = x(2):.01:x(3);
range3 = x(3):.01:x(4);
plot(range1,polyval(flip(p(1:4)), range1-x(1)))
plot(range2,polyval(flip(p(5:8)), range2-x(2)))
plot(range3,polyval(flip(p(9:12)), range3-x(3)))
hold off

%%
x = [3 4.5 7 9];
y = [2.5 1 2.5 0.5];

p = splines(x,y);

scatter(x,y)
hold on

range1 = x(1):.01:x(2);
range2 = x(2):.01:x(3);
range3 = x(3):.01:x(4);
plot(range1,polyval(flip(p(1:4)), range1-x(1)))
plot(range2,polyval(flip(p(5:8)), range2-x(2)))
plot(range3,polyval(flip(p(9:12)), range3-x(3)))
hold off

%%
x = [0 1 2 3];
y = [1 exp(1) exp(2) exp(3)];

p = splines(x,y);

scatter(x,y)
hold on

range1 = x(1):.01:x(2);
range2 = x(2):.01:x(3);
range3 = x(3):.01:x(4);
plot(range1,polyval(flip(p(1:4)), range1-x(1)))
plot(range2,polyval(flip(p(5:8)), range2-x(2)))
plot(range3,polyval(flip(p(9:12)), range3-x(3)))
hold off