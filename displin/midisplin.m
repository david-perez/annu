function [t, x] = midisplin(pqr, t0, T, N, a, b, C1, C2)
    % Con C1 y C2 establecemos las condiciones de contorno en los extremos.
    % C1 controla la condición en t0.
    % Si C1 == 0, imponemos x(t0) = a. Si C1 == 1, imponemos x'(t0) = a.
    % C2 controla la condición en t_N = T.
    % Si C2 == 0, imponemos x(T) = b. Si C1 == 1, imponemos x'(T) = b.
    
    if C1 == 0
        x10 = [a;0];
        x20 = [0;1];
    else
        x10 = [0;a];
        x20 = [1;0];
    end
    % El mallado generado al resolver ambos PVIs será el mismo, lo asigno
    % solamente al resolver uno de ellos.
    [t, v1] = mirk4(t0, T, N, x10, @fundisplin1, pqr); % v1 resuelve PVI no homogéneo.
    [~, v2] = mirk4(t0, T, N, x20, @fundisplin2, pqr); % v2 resuelve PVI homogéneo.
    if C2 == 0
        cond = v2(1, N + 1);
    else
        cond = v2(2, N + 1);
    end
    if abs(cond) > eps % Existe soluci�n �nica.
        if C2 == 0
            s = ((b - v1(1, N + 1)) / v2(1, N + 1));
        else
            s = ((b - v1(2, N + 1)) / v2(2, N + 1));
        end
        x = v1 + s * v2;
    else 
        if C2 == 0
            cond = v1(1, T + 1) - b;
        else
            cond = v1(2, T + 1) - b;
        end
        if abs(cond) < eps % eps está globalmente definido en MATLAB.
            % Infinitas soluciones v1 + s * v2. Devolvemos v1.
            x = v1;
        else % No hay soluci�n.
            t = [];
            x = [];
        end
    end
end
