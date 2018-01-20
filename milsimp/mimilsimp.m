function [t, u, numfun] = mimilsimp(t0, tfin, N, x0, f, J, par)
    h = (tfin - t0) / N;
    t = [t0:h:tfin];
    numfun = 0; % TODO
    m = size(x0, 1);
    
    % Inicializar con RK. Obtenemos 4 puntos con los que inicializar el
    % método: x0, x1, x2 y x3. Por tanto hay que llamar a RK en el
    % intervalo [t0, t3] con 3 intervalos. Recuerda que t(4) = t3.
    [~, uaux] = mirk4(t0, t(4), 3, x0, f, par); % 
    
    u = zeros(m, N + 1);
    u(:, 1:4) = uaux;
    
    for n = 4:N
        % Predigo.
        v1 = 2 * feval(f, t(n), u(:, n), par);
        v2 = -feval(f, t(n - 1), u(:, n - 1), par);
        v3 = 2 * feval(f, t(n - 2), u(:, n - 2), par);
        
        z = u(:, n - 3) + (4 * h / 3) * (v1 + v2 + v3);
        
        for j = 1:J % Corrijo.
            z = u(:, n - 1) + h / 3 * (feval(f, t(n + 1), z, par) ...
                                     + 2 * v1 ... % + 4 * feval(f, t(n), u(:, n), par)...
                                     - v2); % + feval(f, t(n - 1), u(:, n - 1), par));
        end
        u(:, n + 1) = z;
    end
end
