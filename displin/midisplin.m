function [t, x] = midisplin(pqr, t0, T, N, a, b, C1, C2)
    if C1 == 0
        x10 = [a;0];
        x20 = [0;1];
    else
        x10 = [0;a];
        x20 = [1;0];
    end
    [t, v1] = mirk4(t0, T, N, x10, @fundisplin1, pqr);
    [~, v2] = mirk4(t0, T, N, x20, @fundisplin2, pqr);
    if C2 == 0
        cond = v2(1, N + 1);
    else
        cond = v2(2, N + 1);
    end
    if abs(cond) > eps % Existe solución única.
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
        if abs(cond) < eps % Infinitas soluciones v1 + s * v2. Devuelvo v1.
            x = v1;
        else % No hay solución
            t = [];
            x = [];
        end
    end
end