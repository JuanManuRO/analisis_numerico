function a = regresion(x, y)
    n = length(x);
    x = [ones(1,n); x];
    X = zeros(height(x));
    for i = 1:height(x)
        X(i,:) = x*transpose(x(i,:));
    end
    Y = x*transpose(y);
    a = X\Y;
end