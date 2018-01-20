figure(1)
subplot(2, 1, 1)
plot(t, u(1, :), 'r')
title('Componente x(t) de la soluci�n')
legend('x(t)')
    
subplot(2, 1, 2);
plot(t, u(2, :), 'g')
% En la ventana se imprimirá x'(t), hay que hacer un escape del carácter '.
title('Componente x''(t) de la soluci�n')
legend('x''(t)')
