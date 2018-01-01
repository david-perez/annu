function [t, u] = mimilne(t0, tfin, N, x0, f, par)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    m = size(x0, 1);
    
    [taux, uaux] = mirk4(t0, t(4), 3, x0, f, par);
    
    u = zeros(m, N + 1);
    u(:, 1:4) = uaux;
    for n = 4:N
        v1 = 2 * feval(f, t(n), u(:, n), par);
        v2 = - feval(f, t(n - 1), u(:, n - 1), par);
        v3 = 2 * feval(f, t(n - 2), u(:, n - 2), par);
        
        u(:, n + 1) = u(:, n - 3) + (4*h / 3) * (v1 + v2 + v3);
    end
end
