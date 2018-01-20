mispracticas
h0 = 1e-4;
hmin = 1e-5;
TOL = 1e-3;
metodo = @mieuler;
orden = 1;
hmax = 3;
[t, u] = mimetadap(tinic, tfin, x0, h0, hmin, TOL, fun, metodo, orden, hmax, []);
misgraficas
