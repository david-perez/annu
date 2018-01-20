function [t, u] = mimetadap(t0, tfin, x0, h0, hmin, TOL, f, metodo, orden, hmax, par)
    facmax = 5; % Magic variables => heur�stica
    fac = 0.7;
    u(:, 1) = x0;
    t(1) = t0;
    h = h0;
    i = 1; % Los arrays empiezan en uno en esta mierda de lenguaje.
    
    while (t(i) < tfin)
        % Tentativo.
        [~, z] = feval(metodo, t(i), t(i) + h, 1, u(:, i), f, par);
        
        % C�lculo del error norm(dos saltos - un salto).
        [~, y] = feval(metodo, t(i), t(i) + h, 2, u(:, i), f, par);
        ERR = norm(z(:,2) - y(:,3)) / (h * (1 - 1 / (2 ^ orden))); % Esto deber�a hacerse con las phis.
        
        if (ERR <= TOL)
            t = [t, t(i) + h];
            u = [u, z(:, 2)]; % Ampliamos el array uno por uno porque no sabemos cu�l es el tama�o final.
            i = i + 1;
        end
        
        h = min([hmax, h * min([facmax, fac * (TOL / ERR) ^ (1 / orden)])]);
        
        if (h < hmin) % Aqu� habr� seguramente una as�ntota, as� que paramos y hacemos return.
            disp('Error: el paso es m�s peque�o que hmin')
            return
        end
        
    end