mispracticas

% ode45 devuelve dos cosas:
%   - t es un vector columna con los puntos del mallado.
%   - u es una matriz de m columnas, en la que cada fila es el valor de
%     de la solución (x_1(t(j)), ..., x_m(t(j))) evaluada en el punto t(j)
[t, u] = ode45(fun, [tinic:(tfin - tinic) / N:tfin], x0);

% misgraficas necesita los valores de la solución evaluada en el mallado
% en forma de matriz con m filas, de manera que la columna j es la solución
% evaluada en t(j). Por ello trasponemos u.
u = u.';
misgraficas
