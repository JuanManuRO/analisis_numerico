%y1 = y-t^2+1;
n = 10; 
h = 2/n;
t = 0:h:2;
y0 = 0.5;
w = zeros(1,n);
w(1) = y0;
for i = 2:n
    w(i) = w(i-1) + h*(w(i-1)-t(i-1)^2+1);
end
M = 1.694528;
L = 1;
e = h*M/(2*L)*(exp(t)-1);

%% y1 = 1 + y/t
n = 10; 
h = 1/n;
t = 1:h:2;
y0 = 2;
w = zeros(1,n);
w(1) = y0;
for i = 2:n
    w(i) = w(i-1) + h*(1+w(i-1)/t(i-1));
end
% calcular M y L
M = 1.694528;
L = 1;
e = h*M/(2*L)*(exp(t)-1);

%% y1 = y-t^2+1;
% y2 = y-t^2-2t+1

n = 10; 
h = 2/n;
t = 0:h:2;
y0 = 0.5;
w = zeros(1,n);
w(1) = y0;
for i = 2:n
    T = w(i-1)+h/2*(w(i-1)-t(i-1)^2-2*t(i-1)+1);
    w(i) = w(i-1) + h*T;
end

% y3 = -2t-2 + 1(y-t^2-2t+1)
% y3 = y - t^2 - 4t -1
% y4 = -2t-4 + 1(y-t^2-4t-1)
% y4 = y - t^2 - 6t -5

n = 10; 
h = 2/n;
t = 0:h:2;
y0 = 0.5;
w2 = zeros(1,n);
w2(1) = y0;
for i = 2:n
    T = w2(i-1)+h/2*(w2(i-1)-t(i-1)^2-2*t(i-1)+1) + h^2/6*(w2(i-1)-t(i-1)^2-4*t(i-1)-1) + h^3/24*(w2(i-1)-t(i-1)^2-6*t(i-1)-5) ;
    w2(i) = w2(i-1) + h*T;
end


