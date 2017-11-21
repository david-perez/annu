function [t, u, numfun] = miab4am3(t0, tfin, N, x0, f, J)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    numfun = 0; % TODO
    m = size(x0, 1);
    
    % Inicializar con RK.
    [~, uaux] = mirk4(t0, t(4), 3, x0, f);
    
    u = zeros(m, N + 1);
    u(:, 1:4) = uaux;
    
    for n = 1:N - 3
        % Predigo
        z = u(:, n + 3) + h * (55 / 24 * feval(f, t(n + 3), u(:, n + 3))...
                            - 59 / 24 * feval(f, t(n + 2), u(:, n + 2))...
                            + 37 / 24 * feval(f, t(n + 1), u(:, n + 1))...
                            - 9 / 24 * feval(f, t(n), u(:, n)));
        
        for j = 1:J % Corrijo
            z = u(:, n + 3) + h / 24 * (9 * feval(f, t(n + 4), z)...
                                     + 19 * feval(f, t(n + 3), u(:, n + 3))...
                                     - 5 * feval(f, t(n + 2), u(:, n + 2))...
                                     + feval(f, t(n + 1), u(:, n + 1)));
        end
        u(:, n + 4) = z;
    end
end
