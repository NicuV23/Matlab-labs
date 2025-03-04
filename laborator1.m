% 1. Derivare simbolică
syms x;
f = x^2 - 4*x + 5;
df1 = diff(f, x);  % Derivata lui f

% ------------------------------------------

% 2. Minimizare folosind fminbnd (optimizare fără constrângeri)
f = @(x) x.^2 - 4*x + 5;
[x_min1, f_min] = fminbnd(f, -10, 10);

% ------------------------------------------

% 3. Programare liniară folosind linprog
c = [-1; -2]; % Funcția obiectiv (maximizare → se pune minus)
A = [1 1; -1 2]; % Matricea coeficienților inegalităților
b = [4; 2]; % Termenii din dreapta ai inegalităților
x1 = linprog(c, A, b);

% ------------------------------------------

% 4. Optimizare neliniară cu fmincon
f = @(x) x(1)^2 + x(2)^2;
x0 = [1, 1]; % Punct inițial
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0, 0]; % Limite inferioare
ub = [2, 2]; % Limite superioare
x_min = fmincon(f, x0, A, b, Aeq, beq, lb, ub);

% ------------------------------------------

% 5. Identificarea variabilelor simbolice într-o expresie
clc; clear; close all;
syms x y z;
f = x^2 + y*z + sin(x*y);
vars = symvar(f);
disp('Variabilele simbolice din expresie sunt:');
disp(vars);

% ------------------------------------------

% 6. Reprezentarea grafică a unei funcții de o variabilă
clc; clear; close all;
x = linspace(-2, 6, 100);
y = x.^2 - 4*x + 5;
figure;
plot(x, y, 'b', 'LineWidth', 2);
grid on;
xlabel('x'); ylabel('f(x)');
title('Graficul functiei f(x) = x^2 - 4x + 5');

% ------------------------------------------

% 7. Reprezentarea grafică a unei funcții de două variabile (3D)
clc; clear; close all;
[X, Y] = meshgrid(-3:0.1:3, -3:0.1:3);
Z = X.^2 + Y.^2 - 3*X.*Y;
figure;
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('f(x, y)');
title('Grafic 3D al functiei f(x, y)');
colorbar;

% ------------------------------------------

% 8. Crearea unei expresii simbolice și evaluarea ei
syms x;
f = x^2 + 2*x + 1;
val = subs(f, x, 3);
disp('Valoarea expresiei pentru x = 3 este:');
disp(val);

% ------------------------------------------

% 9. Manipularea expresiilor simbolice - Expansiune și simplificare
syms x;
f = (x + 1)^2;
expanded_f = expand(f);
disp('Expresia expandată:');
disp(expanded_f);
simplified_f = simplify(expanded_f);
disp('Expresia simplificată:');
disp(simplified_f);

% ------------------------------------------

% 10. Derivarea și integrarea simbolică
syms x;
f = x^3 + 2*x^2 - 5*x + 4;
df = diff(f, x);
disp('Derivata f(x) este:');
disp(df);

syms x;
f = x^2 + 3*x + 2;
int_f = int(f, x);
disp('Integrala f(x) este:');
disp(int_f);
