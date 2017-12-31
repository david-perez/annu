function f = funcduffing(t, x)
    % x''(t) + alfa * x'(t) + x(t)^3  - x(t) = 0
    alfa = 1;
    f = [x(2); x(1) - x(1)^3 - alfa * x(2)];
end
