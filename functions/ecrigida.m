function f = ecrigida(t, x, ~)
    % Ejemplo de ecuaci�n r�gida 2.8. 
    % Comp�rese el resultado de rk4 (expl�cito) con el m�todo del trapecio
    % (impl�cito) para t \in [0, pi/2] y x0 = 0 y N = 25, 40, 50, 100...
    f = [-50 * (x(1) - cos(t))];
end
