function [t, u] = mirk4(t0, tfin, N, x0, f)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    m = size(x0, 1);
    
    K = zeros(m, 4); % K_i = K(:, i). Son vectores columna de m dimensiones.
    u = zeros(m, N + 1);
    u(:, 1) = x0;
    for n = 1:N
        K(:, 1) = feval(f, t(n), u(:, n));
        K(:, 2) = feval(f, t(n) + h / 2, u(:, n) + h / 2 * K(1));
        K(:, 3) = feval(f, t(n) + h / 2, u(:, n) + h / 2 * K(2));
        K(:, 4) = feval(f, t(n) + h, u(:, n) + h * K(3));
        
        u(:, n + 1) = u(:, n) + h / 6 * (K(:, 1) + 2 * K(:, 2) + 2 * K(:, 3) + K(:, 4));
    end
end
