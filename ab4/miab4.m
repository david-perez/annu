function [t, u] = miab4(t0, tfin, N, x0, f, par)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    m = size(x0, 1);
    
    [taux, uaux] = mirk4(t0, t(3), 2, x0, f, par);
    
    u = zeros(m, N + 1);
    u(:, 1:3) = uaux;
    for n = 4:N
        v1 = 55 * feval(f, t(n), u(:, n), par);
        v2 = -59 * feval(f, t(n - 1), u(:, n - 1), par);
        v3 = 37 * feval(f, t(n - 2), u(:, n - 2), par);
        v4 = -9 * feval(f, t(n - 3), u(:, n - 3), par);
        
        u(:, n + 1) = u(:, n) + (h / 24) * (v1 + v2 + v3 + v4);
    end
end
