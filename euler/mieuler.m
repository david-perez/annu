function [t, u] = mieuler(t0, tfin, N, x0, f, par)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    m = size(x0, 1);
    
    % El mallado tiene N + 1 puntos donde hay que aproximar la solución
    % Estos son t0, ..., tN. En MATLAB los arrays empiezan en 1, así que
    % se encuentran en t(1), ..., t(N + 1).
    u = zeros(m, N + 1);
    u(:, 1) = x0; % u(:, 1) guarda la aproximación en t(1) = t0.
    for n = 1:N
        u(:, n + 1) = u(:, n) + h * feval(f, t(n), u(:, n), par);
    end
end
