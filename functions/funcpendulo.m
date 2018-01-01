function f = funcpendulo(t, x, ~)
    % theta''(t) + 2*beta*theta'(t) + (g/l)*sin(theta(t)) = 0
    beta = 0; % Parámetro de resistencia.
    g = 9.8; % Gravedad.
    l = 1; % Longitud del péndulo.
    M = 0;
    f = [x(2); M - (g / l) * sin(x(1)) - 2 * beta * x(2)];
end
