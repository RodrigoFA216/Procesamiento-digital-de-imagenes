% Tamaño de la matriz
N = 10; % Cambia N al tamaño deseado
M = 15; % Cambia M al tamaño deseado

% Crear la matriz de ceros
matriz_ceros = zeros(N, M);

% Tamaño de la máscara
mask_size = 7;

% Crear la máscara de suavizado
smoothing_mask = fspecial('average', [mask_size mask_size]);

% Encontrar las coordenadas del centro de la matriz
centro_fila = floor(N/2) + 1;
centro_columna = floor(M/2) + 1;

% Determinar las coordenadas donde colocar la máscara en el centro
inicio_fila = centro_fila - floor(mask_size/2);
fin_fila = inicio_fila + mask_size - 1;

inicio_columna = centro_columna - floor(mask_size/2);
fin_columna = inicio_columna + mask_size - 1;

% Colocar la máscara en el centro de la matriz de ceros
matriz_ceros(inicio_fila:fin_fila, inicio_columna:fin_columna) = smoothing_mask;
