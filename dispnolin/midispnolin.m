function [t, x] = midispnolin(ffxfy, t0, T, N, a, b, TOL)
    itmax = 10000;
    sk = (b - a) / (T - t0);
    for k = 1:itmax
        x0 = [a;sk;0;1];
        [t, xk] = mirk4(t0, T, N, x0, @fundispnolin, ffxfy);
        if norm(xk(1, N + 1) - b) < TOL
            x = xk(1:2, :);
            break;
        end
        sk = sk - (xk(1, N + 1) - b) / xk(3, N + 1);
    end
   
end