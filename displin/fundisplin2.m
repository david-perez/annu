function v = fundisplin2(t, x, pqr)
    % Problema homogéneo.
    p = pqr{1};
    q = pqr{2};
    pt = feval(p, t);
    qt = feval(q, t);
    v = [x(2);  pt*x(2) + qt*x(1)];
end
