function [t, u, numfun] = mieulertr(t0, tfin, N, x0, f, J, par)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    numfun = 0; % TODO
    m = size(x0, 1);
    
    u = zeros(m, N + 1);
    u(:, 1) = x0;
    for n = 1:N
        % Predigo
        z = u(:, n) + h * feval(f, t(n), u(:, n), par);
        for j = 1:J % Corrijo
            z = u(:, n) + h / 2 * (feval(f, t(n), u(:, n), par) ...
                + feval(f, t(n + 1), z, par));
        end
        u(:, n + 1) = z;
    end
end
