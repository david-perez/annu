function [t, x] = midispnolin(ffxfy, t0, T, N, a, b, TOL, C1, C2)
    % Para condiciones tipo Dirichlet en ambos extremos, queremos resolver
    % el PVI (que en realidad son dos PVIs de dim. 2 juntados en uno de
    % dim. 4,
    %
    % v'(t) = w(t)
    % w'(t) = f(t, v(t), w(t))
    % z'(t) = u(t)
    % u'(t) = f_y(t, v(t), w(t)) * u(t) + f_x(t, v(t), w(t)) * z(t)
    %
    % Las primeras dos ecuaciones son nuestro problema de contorno,
    % las segundas dos ecuaciones son ecuaciones que tiene que verificar la
    % derivada de la solución, v, respecto de s (la pendiente), y que
    % llamamos z.
    %
    % Con condiciones iniciales:
    % v(t0) = a
    % w(t0) = s_k
    % z(t0) = 0
    % u(t0) = 1
    %
    % De la solución, nos interesan la primera componente (la solución del
    % método de disparo con pendiente inicial s_k), y la tercera componente
    % (la derivada de la solución con respecto al parámetro s).
    % Entonces podemos hacer Newton y meterlas en la ecuación
    %
    % s_{k + 1} = s_k - (v(T, s_k) - b) / z(T, s_k)
    %
    % Para obtener un nuevo punto.
    % Iteramos este proceso hasta obtener un punto fijo de la ecuación
    % anterior (o hasta agotar un número máximo de iteraciones).
    %
    % Si encontramos un punto fijo, entonces hemos encontrado una pendiente
    % inicial de la solución tal que v(T) = b.

    itmax = 10000;
    if C1 == 0 && C2 ==0
        sk = (b - a) / (T - t0);
    elseif C1 == 0 && C2 == 1
        sk = b;
    else
        sk = b - a * (T - t0);
    end
    for k = 1:itmax
        if C1 == 0
            x0 = [a;sk;0;1];
        else
            x0 = [sk;a;0;1];
        end
        [t, xk] = mirk4(t0, T, N, x0, @fundispnolin, ffxfy);
        if C2 == 0
            cond = xk(1, N + 1) - b;
        else
            cond = xk(2, N + 1) - b;
        end
        if norm(cond) < TOL
            x = xk(1:2, :);
            break;
        end
        if C2 == 0
            sk = sk - (xk(1, N + 1) - b) / xk(3, N + 1);
        else
            sk = sk - (xk(2, N + 1) - b) / xk(4, N + 1);
        end
    end
end
