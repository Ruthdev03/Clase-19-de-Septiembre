% Definir la matriz A y el vector b
A = [8, 4, -1; -2, 5, 1; 2, -1, 6];
b = [11; 4; 7];
% Realizar la descomposición LU sin pivoteo
[L, U] = lu(A, 'vector');
% Resolver el sistema L * y = b (sustitución hacia adelante)
y = L \ b;
% Resolver el sistema U * x = y (sustitución hacia atrás)
x = U \ y;
% Mostrar la solución
disp('La solución del sistema es:');
disp(x);
% Graficar los planos de cada ecuación
[X, Y] = meshgrid(-10:1:10, -10:1:10); % Rango de valores para X y Y
% Ecuación 1: 8x1 + 4x2 - x3 = 11
Z1 = (11 - 8*X - 4*Y) / (-1);
% Ecuación 2: -2x1 + 5x2 + x3 = 4
Z2 = (4 + 2*X - 5*Y) / 1;
% Ecuación 3: 2x1 - x2 + 6x3 = 7
Z3 = (7 - 2*X + Y) / 6;
% Crear la figura
figure;
hold on;
grid on;
% Graficar cada plano
surf(X, Y, Z1, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'r'); % Plano rojo
surf(X, Y, Z2, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'g'); % Plano verde
surf(X, Y, Z3, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'b'); % Plano azul
% Marcar la solución
plot3(x(1), x(2), x(3), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
% Etiquetas y leyenda
xlabel('x_1');
ylabel('x_2');
zlabel('x_3');
title('Intersección de los planos del sistema de ecuaciones');
legend('8x_1 + 4x_2 - x_3 = 11', '-2x_1 + 5x_2 + x_3 = 4', '2x_1 - x_2 + 6x_3 = 7', 'Solución');
view(3);
hold off;