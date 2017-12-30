function f = funcdeppresa(t, x)
    % x'(t) = ax(t) - bx(t)y(t)
    % y'(t) = -cy(t) + dx(t)y(t)
    % con a, b, c, d >= 0, t \in [0, 10], x0 = 30, y0 = 50
    a = 0.4;
    b = 0.01;
    c = 0.3;
    d = 0.005;
    f = [a * x(1) - b * x(1) * x(2); - c * x(2) + d * x(1) * x(2)];
end
