ffxfy={@(t,x,y) 2*x^3, @(t,x,y) 6*x^2, @(t,x,y) 0*t};
N = 10000;
t0 = 1;
T = 2;
a = 1/2;
b = 1/3;
TOL = 1e-6;
[t, u] = midispnolin(ffxfy, t0, T, N, a, b, TOL);
misgraficasdisp