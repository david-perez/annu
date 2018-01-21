function v = fundispnolin(t, x, ffxfy)
    % v'(t) = w(t)
    % w'(t) = f(t, v(t), w(t))
    % z'(t) = u(t)
    % u'(t) = f_y(t, v(t), w(t)) * u(t) + f_x(t, v(t), w(t)) * z(t)

    f = ffxfy{1};
    fx = ffxfy{2};
    fy = ffxfy{3};
    ft = feval(f, t, x(1), x(2));
    fxt = feval(fx, t, x(1), x(2));
    fyt = feval(fy, t, x(1), x(2));
    v = [x(2);  ft; x(4); fyt * x(4) + fxt * x(3)];
end
