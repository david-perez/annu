function [t, u] = mimetadap(t0, tfin, x0, h0, hmin, TOL, f, metodo, orden, hmax, par)
    % metodo es un puntero a una función que implemente el método numérico
    % para aproximar el PVI.
    % orden es el orden de ese método.
    
    % Factor que usaremos para impedir que el nuevo paso sea facmax veces
    % el paso antiguo (para que los cambios en el paso no sean muy
    % bruscos).
    facmax = 5;
    
    % Factor que multiplicará al paso óptimo (para quedarnos un poco por
    % debajo del paso óptimo y así aumentar la probabilidad de que el
    % cálculo del paso en el siguiente nodo se acepte).
    fac = 0.9;
    u(:, 1) = x0;
    t(1) = t0;
    h = h0; % Paso inicial.
    i = 1; % Los arrays empiezan en uno.
    
    while (t(i) < tfin)
        % Llamar al método en un único intervalo para obtener la estimación
        % de la solución en el siguiente nodo.
        [~, z] = feval(metodo, t(i), t(i) + h, 1, u(:, i), f, par);
        
        % Cálculo del error norm(dos saltos - un salto).
        [~, y] = feval(metodo, t(i), t(i) + h, 2, u(:, i), f, par);
        ERR = norm(z(:,2) - y(:,3)) / (h * (1 - 1 / (2 ^ orden))); % Esto debería hacerse con las phis.
        
        if (ERR <= TOL) % Aceptamos los cálculos.
            t = [t, t(i) + h];
            u = [u, z(:, 2)]; % Ampliamos el array uno por uno porque no sabemos cuál es el tamaño final.
            i = i + 1;
        end
        
        % En cualquier caso, actualizamos el tamaño del paso para el
        % siguiente nodo. Si hemos aceptado los cálculos ERR <= TOL y por
        % tanto TOL / ERR >= 1, así que h crecerá.
        % En caso contrario habíamos rechazado, ERR > TOL, y por tanto h
        % decrecerá; obtendremos una mejor estimación en la siguiente
        % iteración.
        h = min([hmax, h * min([facmax, fac * (TOL / ERR) ^ (1 / orden)])]);
        
        if (h < hmin) % Aquí habrá seguramente una asíntota, así que paramos y hacemos return.
            disp('Error: el paso es más pequeño que hmin.')
            return
        end
    end
end
