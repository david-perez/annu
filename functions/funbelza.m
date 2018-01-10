function f = funbelza(t, x, ~)
    % Práctica 2.12
    % Ecuación de Belousov-Zhabotinsky.
    % x_1' = alfa * (x_2 ? x_1 * x_2 + x_1 ? beta * x_1^2)
    % x_2' = (gamma * x_3 - x_2 - x_1 * x_2) / alfa
    % x_3' = delta * (x_1 ? x_3)
    % Prueba con x0 = 0.25, y0 = 0.75, z0 = 0.25, t \in [0, 100]
    % Es un sistema muy rígido
    alfa = 2e4;
    beta = 8e-4;
    gamma = 5000;
    delta = 0.75;
    f = [alfa * (x(2) - x(1) * x(2) + x(1) - beta * x(1)^2); ...
        (1 / alfa) * (gamma * x(3) - x(2) - x(1) * x(2)); ...
        delta * (x(1) - x(3))];
end
