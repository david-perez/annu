function f = funclorenz(t, x, ~)
    % Práctica 2.10.5
    % x'(t) = sigma*(y(t) - x(t))
    % y'(t) = ro*x(t) - y(t) - x(t)z(t)
    % z'(t) = x(t)y(t) - beta*z(t)
    % Prueba con unos tripis x0 = 0, y0 = 5, z0 = 75, t \in [0, 100]
    sigma = 10;
    beta = 8/3;
    ro = 100.5;
    f = [sigma * (x(2) - x(1)); ro * x(1) - x(2) - x(1) * x(3); x(1) * x(2) - beta * x(3)];
end
