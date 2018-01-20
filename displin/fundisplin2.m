function v = fundisplin2(t, x, pq)
    % Problema homog�neo.
    p = pq{1};
    q = pq{2};
    pt = feval(p, t);
    qt = feval(q, t);
    v = [x(2);  pt*x(2) + qt*x(1)];
end
