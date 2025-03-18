%% Task 1: Regresia Least-Squares pentru un set nou de date
clc; clear; close all;

% Date experimentale
x_data = [1; 2; 3; 4; 5];  % Vector coloană
y_data = [2.1; 2.9; 3.7; 4.6; 5.1];

% Construim matricea A pentru regresia liniară y = ax + b
A = [x_data, ones(size(x_data))]; % Coloana 1: x, Coloana 2: 1 (pentru termenul liber)

% Calculăm coeficienții folosind metoda Least-Squares
x_star = (A' * A) \ (A' * y_data);

% Extragem coeficienții a și b
a = x_star(1);
b = x_star(2);

% Afișăm rezultatele
fprintf('Coeficientul a: %.2f\n', a);
fprintf('Coeficientul b: %.2f\n', b);
fprintf('Ecuația dreptei de regresie: y = %.2fx + %.2f\n', a, b);

% Generăm puncte pentru plotarea dreptei
x_fit = linspace(min(x_data)-1, max(x_data)+1, 100);
y_fit = a * x_fit + b;

% Plotăm datele și dreapta de regresie
figure;
hold on;
scatter(x_data, y_data, 'ro', 'filled'); % Puncte experimentale (roșu)
plot(x_fit, y_fit, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Regresie liniară folosind metoda Least-Squares');
legend('Date experimentale', sprintf('y = %.2fx + %.2f', a, b), 'Location', 'best');
grid on;
hold off;

%% Task 2: Algoritmul Kaczmarz
clc; clear;

% Definirea sistemului Ax = b
A = [3, 2, 1; 1, -1, 2; 2, 1, 3];
b = [10; 5; 15];

% Soluția exactă folosind metoda directă
x_exact = A \ b;

% Inițializare
x = zeros(size(A,2), 1); % Soluție inițială
num_iterations = 10;

error_values = zeros(num_iterations, 1);

fprintf('Iterație | x1 | x2 | x3 | Eroare\n');
fprintf('------------------------------------------\n');

for k = 1:num_iterations
    for i = 1:size(A,1) % Iterăm prin fiecare ecuație
        a_i = A(i, :); % Selectăm o linie din A
        b_i = b(i);    % Selectăm componenta corespunzătoare din b
        x = x + (b_i - a_i * x) / (norm(a_i)^2) * a_i';
    end
    % Calculul erorii
    error_values(k) = norm(x - x_exact);
    fprintf('%4d | %.4f | %.4f | %.4f | %.6f\n', k, x(1), x(2), x(3), error_values(k));
end

% Reprezentare grafică a erorii
graph = figure;
plot(1:num_iterations, error_values, '-ko', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Iterația');
ylabel('Eroare ||x_k - x^*||');
title('Convergența erorii în algoritmul Kaczmarz');
grid on;

%% Task 3: Factorizarea LU și rezolvarea unui sistem
clc; clear;

% Definirea matricei A și a vectorului b
A = [4, 3, -1; 2, 1, 3; -6, -3, 4];
b = [5; 3; 2];

% Dimensiunea matricei A
n = size(A, 1);

% Inițializăm L ca matrice identitate și U ca A
L = eye(n);
U = A;

% Aplicăm eliminarea Gauss pentru factorizarea LU
for k = 1:n-1
    for i = k+1:n
        L(i, k) = U(i, k) / U(k, k);
        U(i, :) = U(i, :) - L(i, k) * U(k, :);
    end
end

% Afișăm rezultatele
disp('Matricea L:');
disp(L);
disp('Matricea U:');
disp(U);

disp('Verificare: L * U trebuie să fie egal cu A original:');
disp(L * U);

% Rezolvăm sistemul Ax = b folosind LU
% Ly = b prin substituție înainte
y = zeros(n,1);
for i = 1:n
y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
end

% Ux = y prin substituție înapoi
x = zeros(n,1);
for i = n:-1:1
x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
end

disp('Soluția sistemului Ax = b este:');
disp(x);
