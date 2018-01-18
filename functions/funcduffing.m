function f = funcduffing(t, x, ~)
    % Práctica 2.10.4
    % x''(t) + alfa * x'(t) + x(t)^3  - x(t) = 0
    % Los puntos de equilibrio son (0, 0), (1, 0) y (-1, 0).
    alfa = 1;
    f = [x(2); x(1) - x(1)^3 - alfa * x(2)];
end
