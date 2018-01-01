function v = fundispnolin(t, x, ffxfy)
    f = ffxfy{1};
    fx = ffxfy{2};
    fy = ffxfy{3};
    ft = feval(f, t, x(1), x(2));
    fxt = feval(fx, t, x(1), x(2));
    fyt = feval(fy, t, x(1), x(2));
    v = [x(2);  ft; x(4); fyt * x(4) + fxt * x(3)];
end
