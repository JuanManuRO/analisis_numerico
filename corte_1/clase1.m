x = 0.5;
real = exp(x);
aprox = 0;

n = 4;

for i = 0:n
    aprox = aprox + x^i/factorial(i); 
end


abs((real-aprox)/real)*100

%%
x = 1.37;
y = x^3-5*x^2+6*x+0.55;

yround = round(x*round(x^2,3),3)-5*round(x^2,3)+round(6*x,3)+0.55;

yanid = round((round((x-5)*x,3)+6)*x,3)+0.55;


erro = abs(y-yround);
eran = abs(y-yanid);

rero = abs((y-yround)/y)*100;
rean = abs((y-yanid)/y)*100;

%%
multd = [37];
multn = [12];
count = 1;
while multd(end) > 1
    multd(count) = floor(multd(count-1)/2);
    multd(count) = floor(multd(count-1)/2);
    count = count + 1;
end
