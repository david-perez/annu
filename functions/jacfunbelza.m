function J = jacfunbelza(t, x)
    % Tienes que usar los mismo parámetros que en funbelza.m
    alfa = 2e4;
    beta = 8e-4;
    gamma = 5000;
    delta = 0.75;
    J = [alfa * (-x(2) + 1 - 2 * beta * x(1)), alfa * (1 - x(1)), 0; ...
        (1 / alfa) * (-x(2)), (1 / alfa) * (-1 - x(1)), gamma / alfa; ...
        delta, 0, -delta];
end
