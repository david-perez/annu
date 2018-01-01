function f = funcvanderpol(t, x, ~)
    alfa = 1;
    beta = 1;
    f = [x(2); -x(1) - alfa*(x(1)*x(1) - beta)*x(2)];
end
