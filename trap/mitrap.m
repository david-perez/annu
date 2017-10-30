function [t, u, numfun] = mitrap(t0, tfin, N, x0, f, jac, itmax)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    numfun = 0; % TODO
    m = size(x0, 1);
    
    u = zeros(m, N + 1);
    u(:, 1) = x0;
    for n = 1:N
        z = u(:, n);
        for it = 1:itmax
            Gn = z - (u(:, n) + h / 2 * feval(f, t(n), u(:, n))) - h / 2 * feval(f, t(n + 1), z);
            DGn = eye(m) - h / 2 * feval(jac, t(n + 1), z);
            w = DGn \ Gn;
            z = z - w;
            
            if (norm(w) < h^3)
                break
            end
        end
        
        u(:, n + 1) = z;
    end
end
