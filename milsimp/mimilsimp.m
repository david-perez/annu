function [t, u, numfun] = mimilsimp(t0, tfin, N, x0, f, J)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    numfun = 0; % TODO
    m = size(x0, 1);
    
    % Inicializar con RK.
    [~, uaux] = mirk4(t0, t(4), 3, x0, f);
    
    u = zeros(m, N + 1);
    u(:, 1:4) = uaux;
    
    for n = 4:N
        % Predigo
        v1 = 2 * feval(f, t(n), u(:, n));
        v2 = - feval(f, t(n - 1), u(:, n - 1));
        v3 = 2 * feval(f, t(n - 2), u(:, n - 2));
        
        z = u(:, n - 3) + (4*h / 3) * (v1 + v2 + v3);
        
        for j = 1:J % Corrijo
            z = u(:, n - 1) + h / 3 * (feval(f, t(n + 1), z) ...
                                     + 2 * v1 ... % + 4 * feval(f, t(n), u(:, n))...
                                     - v2); % + feval(f, t(n - 1), u(:, n - 1)));
        end
        u(:, n + 1) = z;
    end
end
