function f = ecrigida(t, x)
    % Ejemplo de ecuación rígida 2.8. 
    % Compárese el resultado de rk4 (explícito) con el método del trapecio
    % (implícito) para t \in [0, pi/2] y x0 = 0 y N = 25, 40, 50, 100...
    f = [-50 * (x(1) - cos(t))];
end
