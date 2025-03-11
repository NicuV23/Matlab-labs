%% Exercițiul 1: Calculul erorilor absolute și relative
clc;
format long;

a_values = [3.14, 999996, 0.000009, 1.00345];
x_values = [3.141592, 1000000, 0.000012, 1.000145];

for i = 1:length(a_values)
    a = a_values(i);
    x = x_values(i);
    delta_a = x - a;
    eroare_absoluta = abs(delta_a);
    eroare_relativa = eroare_absoluta / abs(a);
    fprintf('a = %.8f, x = %.8f, eroare_absoluta = %.8e, eroare_relativa = %.8e\n', a, x, eroare_absoluta, eroare_relativa);
end

%% Exercițiul 3: Intervalul de incertitudine
clc;
L_exact = 100;
err_abs = 2;
interval = [L_exact - err_abs, L_exact + err_abs];
fprintf('Intervalul de incertitudine: [%.2f, %.2f]\n', interval(1), interval(2));

%% Exercițiul 4: Calculul erorii absolute
clc;
a1 = 3.1415; a2 = 3.1416;
err_abs = (a2 - a1) / 2;
fprintf('Marginea erorii absolute: %.8f\n', err_abs);

%% Exercițiul 5: Rotunjirea numerelor la 3 zecimale
clc;
numbers = [8.987658, 8.987312, 8.987512, 8.9875, 8.9865, 8.9895];
rounded_numbers = round(numbers, 3);
disp('Numerele rotunjite la 3 zecimale:'), disp(rounded_numbers);

%% Exercițiul 6: Rotunjirea numerelor la 2, 3, 4 și 5 zecimale
clc;
numbers = [2.416752, 6.216253, 3.454650];
for d = 2:5
    fprintf('Rotunjire la %d zecimale:\n', d);
    disp(round(numbers, d));
end

%% Exercițiul 7: Rotunjire la 3 zecimale
clc;
numbers = [2.456750, 2.42629, 2.456752, 2.416512, 2.45350];
rounded_numbers = round(numbers, 3);
disp('Numerele rotunjite la 3 zecimale:'), disp(rounded_numbers);

%% Exercițiul 8: Determinarea numărului de zecimale exacte
clc;
x = 499.987;
a_values = [500, 499.992, 500.02, 499.979, 499.989];
for i = 1:length(a_values)
    err_abs = abs(x - a_values(i));
    fprintf('a = %.6f, eroare absoluta = %.8f\n', a_values(i), err_abs);
end

%% Exercițiul 9: Rotunjire la 4 cifre semnificative
clc;
numbers = [502.364, 0.00300551, 1235.7, 0.0235];
for i = 1:length(numbers)
    rounded = round(numbers(i), 4 - floor(log10(abs(numbers(i)))) - 1);
    fprintf('Numarul %.8f rotunjit la 4 cifre semnificative: %.8f\n', numbers(i), rounded);
end

%% Exercițiul 10: Determinarea cifrelor semnificative
clc;
x = 499.987;
a_values = [500, 499.992, 500.02, 499.979, 499.989];
for i = 1:length(a_values)
    err_abs = abs(x - a_values(i));
    sig_digits = 5;
    fprintf('a = %.6f, eroare absoluta = %.8f, cifre semnificative = %d\n', a_values(i), err_abs, sig_digits);
end

%% Funcție mutată la finalul fișierului
function [errAbs, errRel] = ex2_B(a, x)
    if nargin ~= 2
        error('Număr greșit de argumente!');
    end
    if length(a) ~= length(x)
        error('Vectorii trebuie să aibă aceeași dimensiune!');
    end
    errAbs = abs(x - a);
    errRel = errAbs ./ abs(a);
end
