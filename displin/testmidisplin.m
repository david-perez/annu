pqr = {@(t) 0*t, @(t) 4 + 0*t, @(t) -4*t};
N = 10000;
t0 = 0;
T = 10;
a = 5;
b = 10;
C1 = 0;
C2 = 0;
[t, u] = midisplin(pqr, t0, T, N, a, b, C1, C2);
misgraficasdisp