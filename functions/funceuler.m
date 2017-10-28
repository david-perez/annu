% La ecuación diferencial x'(t) = x(t) tiene como solución x(t) = ce^t.
function f = funceuler(~, x) % La t se declara como ~ porque no la usamos.
    f = x(1);
end
