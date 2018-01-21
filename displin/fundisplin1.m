function v = fundisplin1(t, x, pqr)
    % Problema no homogéneo.
    p = pqr{1};
    q = pqr{2};
    r = pqr{3};
    pt = feval(p, t);
    qt = feval(q, t);
    rt = feval(r, t);
    v = [x(2);  pt*x(2) + qt*x(1) + rt];
end
