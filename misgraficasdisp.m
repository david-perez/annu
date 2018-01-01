figure(1)
subplot(2, 1, 1)
plot(t, u(1, :), 'r')
title('Componente x(t) de la solución')
legend('x(t)')
    
subplot(2, 1, 2);
plot(t, u(2, :), 'g')
title('Componente x''(t) de la solución')
legend('x''(t)')


