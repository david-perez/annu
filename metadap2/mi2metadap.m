function [t, u] = mi2metadap(t0, tfin, x0, h0, hmin, TOL, f, metodo1, orden1, metodo2, orden2, hmax)
    facmax = 5; % Magic variables => heurística
    fac = 0.7;
    u(:, 1) = x0;
    t(1) = t0;
    h = h0;
    i = 1; % Los arrays empiezan en uno en esta mierda de lenguaje.
    
    while (t(i) < tfin)
        % Tentativo.
        [~, z] = feval(metodo1, t(i), t(i) + h, 1, u(:, i), f);
        
        % Cálculo del error norm(dos métodos de distinto orden).
        [~, y] = feval(metodo2, t(i), t(i) + h, 1, u(:, i), f);
        ERR = norm(z(:,2) - y(:,2)) / h; % Esto debería hacerse con las phis.
        
        if (ERR <= TOL)
            t = [t, t(i) + h]; % Usamos z que lo obtenemos con el método de menor orden.
            u = [u, z(:, 2)]; % Ampliamos el array uno por uno porque no sabemos cuál es el tamaño final.
            i = i + 1;
        end
        
        h = min([hmax, h * min([facmax, fac * (TOL / ERR) ^ (1 / orden1)])]);
        
        if (h < hmin) % Aquí habrá seguramente una asíntota, así que paramos y hacemos return.
            disp('Error: el paso es más pequeño que hmin')
            return
        end
        
    end