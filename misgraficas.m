m = size(x0, 1);
figure(1)
if m == 1
    plot(t, u(1, :), 'r') 
    title('Solución en R x(t)')
elseif m == 2
    % Plottear x(t), y(t).
    subplot(2, 1, 1)
    plot(t, u(1, :), 'r')
    title('Componente x(t) de la solución')
    legend('x(t)')
    
    subplot(2, 1, 2);
    plot(t, u(2, :), 'b')
    title('Componente y(t) de la solución')
    legend('y(t)')
    
    % Plottear (x(t), y(t)) en otro gráfico aparte.
    figure(2)
    plot(u(1, :), u(2, :))
    title('Solución en R^2 (x(t), y(t))')
elseif m == 3
    % TODO
end
