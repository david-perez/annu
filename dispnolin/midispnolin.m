function [t, x] = midispnolin(ffxfy, t0, T, N, a, b, TOL, C1, C2)
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