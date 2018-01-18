function f = funcdeppresa(t, x, ~)
    % Práctica 2.10.1
    % Sistema de Lotka-Volterra.
    % x'(t) = ax(t) - bx(t)y(t)
    % y'(t) = -cy(t) + dx(t)y(t)
    % con a, b, c, d >= 0, t \in [0, 100], x0 = 30, y0 = 50
    % x son las presas.
    % y son los depredadores.
    %
    % x' = ax - bxy
    % Se asume que las presas tienen comida ilimitada, de ahí el factor ax
    % de crecimiento.
    % La tasa a la cual disminuye la población viene dada por el factor
    % bxy, que representa cuándo presa y depredador se encuentran (factor
    % de depredación). Sin presa o depredador, no hay depredación.
    %
    % y' = -cy + dxy
    % dxy representa el crecimiento de la población depredadora.
    % -cy representa la disminución de la población debido a muerte natural
    % o emigración, lleva a un decrecimiento exponencial en ausencia de
    % presa.
    a = 0.4;
    b = 0.01;
    c = 0.3;
    d = 0.005;
    f = [a * x(1) - b * x(1) * x(2); - c * x(2) + d * x(1) * x(2)];
end
