%% Este archivo contiene los datos necesarios de entrada a los solvers
%% de las ecuaciones diferenciales.
%%
%% Cada bloque de código establece un PVI
%%      x'(t) = f(t, x(t))
%%      x(0) = x0
%% 
%% , con f : R x R^m ---> R^m.
%% 
%% Establece además el inicio (tinic) y el fin (tfin) del mallado, y
%% el número de pasos N.
%%
%% Coméntese y descoméntese al gusto.

fun = @funccorazon;
x0 = [0;2];
tinic = 0;
tfin = 2*pi;
N = 1000;

% e^t
% fun = @funceuler;
% x0 = 1;
% tinic = 0;
% tfin = 4;
% N = 100;
