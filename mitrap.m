function [t, u, numfun] = mitrap(t0, tfin, N, x0, f, jac, itmax, par)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    numfun = 0; % TODO
    m = size(x0, 1);
    
    u = zeros(m, N + 1);
    u(:, 1) = x0;
    for n = 1:N
        z = u(:, n);
        const = u(:, n) + h / 2 * feval(f, t(n), u(:, n), par);
        for it = 1:itmax
            Gn = z - const - h / 2 * feval(f, t(n + 1), z, par);
            DGn = eye(m) - h / 2 * feval(jac, t(n + 1), z, par);
            w = DGn \ Gn;
            z = z - w;
            
            if (norm(w) < h^3)
                break
            end
        end
        
        u(:, n + 1) = z;
    end
end
