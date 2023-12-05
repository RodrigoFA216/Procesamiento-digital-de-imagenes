% Crear dos matrices aleatorias de puntos
matriz1 = rand(2, 10);  % Matriz de puntos aleatorios
matriz2 = rand(2, 10) + 1.5;  % Asegurar separación lineal

% Graficar la primera matriz con puntos rojos
scatter(matriz1(1, :), matriz1(2, :), 'filled', 'r', 'Marker', 'o');
hold on;

% Graficar la segunda matriz con asteriscos verdes
scatter(matriz2(1, :), matriz2(2, :), 'filled', 'g', 'Marker', 'diamond');

% Configuración adicional del gráfico
title('Puntos Aleatorios Linealmente Separables');
xlabel('Eje X');
ylabel('Eje Y');
legend('Matriz 1', 'Matriz 2');
grid on;
hold off;
