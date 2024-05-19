x = [15.9 16 16.4 17.3 18 19.1 20 21 22 23 24 25 26 27 27.5 28 28.3 28.8 27.8 27  26 25 24 23 22 21 19.9 19 19.4 18.3]
y = [12.8 13.7 14.2 14.2 13.3 11.1 11.1 11.2 11.4 11.7 12.3 12.6 12.8 12.7 12.1 11.4 10.2 9.8 9.7 8.6 7.2 6.8 6.6 6.7 7.1 7.9 9.1 9.5 9.9 11]
scatter(x,y)
hold on

x3 = [x(5) x2(1) x2(3) x2(2) ]

splin1 = splines(x(1:18), y(1:18));
splin2 = splines(x(19:30), y(19:30));

%range1 = x(1):.01:x(2);
%range2 = x(2):.01:x(3);
%range2 = x(30):.01:x(8);

range = [];
cubic = [];
for i = 1:17
    aux = x(i):.01:x(i+1);
    range = [range aux];
    cubic = [cubic polyval(flip(splin1((i-1)*4+1:i*4)), aux-x(i))];
end


%cubic1 = polyval(flip(splin1(1:4)), range1-x(1));
%cubic2 = polyval(flip(splin1(5:8)), range2-x(2));

%plot(range1, cubic1)
plot(range, cubic)
x2 = x;
y2 = y;
x2 = flip(x2)
y2 = flip(y2)
range = [];
cubic = [];
for i = 18:30
    aux = x(i):.01:x(i+1);
    range = [range aux];
    cubic = [cubic polyval(flip(splin2((i-18)*4+1:(i-17)*4)), aux-x(i))];
end
plot(range, cubic)
hold off

%plot([range1, range2], [cubic1, cubic2])

sum_up = 0

f3c(x) = polyval(flip(splin2((i-18)*4+1:(i-17)*4)))
sum_up = sum_up + integracion_numerica(f3c, 18.3, 28, 'cerrado', 'simpson13', 2)

sum_down =0
f4c(x) = polyval(polyval(flip(splin2((i-18)*4+1:(i-17)*4)))
%sum_down = sum_down + integracion_numerica(f4c, 18.