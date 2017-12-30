function f = funccompet(t, x)
    % x'(t) = ax(t) - bx(t)y(t) - ex(t)^2
    % y'(t) = -cy(t) + dx(t)y(t) - gy(t)^2
    % con a, b, c, d, e, g >= 0, t \in [0, 10], x0, y0 > 0 
    a = 1;
    b = 1;
    c = 1;
    d = 0.2;
    e = 0.4;
    g = 0.0001;
    f = [a * x(1) - b * x(1) * x(2) - e * x(1) * x(1); - c * x(2) + d * x(1) * x(2) - g * x(2) * x(2)];
end
