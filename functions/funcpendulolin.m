function f = funcpendulolin(t, x, ~)
    % theta''(t) + 2*beta*theta'(t) + (g/l)*theta(t) = 0
    beta = 0; % Par�metro de resistencia.
    g = 9.8; % Gravedad.
    l = 1; % Longitud del p�ndulo.
    f = [x(2); - (g / l) * x(1) - 2 * beta * x(2)];
end
