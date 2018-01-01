function [t, u] = mirkf45(t0, tfin, x0, h0, hmin, TOL, f, hmax)
    facmax = 5; % Magic variables => heurística
    fac = 0.7;
    u(:, 1) = x0;
    t(1) = t0;
    h = h0;
    i = 1; % Los arrays empiezan en uno en esta mierda de lenguaje.
    
    m = size(x0, 1);
    orden = 4;
    c = [0, 1/4, 3/8, 12/13, 1, 1/2];
    A = [0, 0, 0, 0, 0, 0; ...
        1/4, 0, 0, 0, 0, 0; ...
        3/32, 9/32, 0, 0, 0, 0; ...
        1932/2197, -7200/2197, 7296/2197, 0, 0, 0; ...
        439/216, -8, 3680/513, -845/4104, 0, 0; ...
        -8/27, 2, -3544/2565, 1859/4104, -11/40, 0];
    b1 = [25/216, 0, 1408/2565, 2197/4104, -1/5, 0];
    b2 = [16/135, 0, 6656/12825, 28561/56430, -9/50, 2/55];
    
    K = zeros(m, 6);
    
    while (t(i) < tfin)
        for j = 1:6
            K(:, j) = feval(f, t(i) + h * c(j), u(:, i) + h * (K * A(j, :).'));
        end
        % Tentativo.
        phi1 = K * b1.';
        z = u(:, i) + h * phi1;
        
        % Cálculo del error.
        phi2 = K * b2.';
        ERR = norm(phi1 - phi2);
        
        if (ERR <= TOL)
            t = [t, t(i) + h]; % Usamos z que lo obtenemos con el método de menor orden.
            u = [u, z]; % Ampliamos el array uno por uno porque no sabemos cuál es el tamaño final.
            i = i + 1;
        end
        
        h = min([hmax, h * min([facmax, fac * (TOL / ERR) ^ (1 / orden)])]);
        
        if (h < hmin) % Aquí habrá seguramente una asíntota, así que paramos y hacemos return.
            disp('Error: el paso es más pequeño que hmin')
            return
        end
        
    end