% Cargar una imagen
imagen = imread('boats.bmp');

% Aplicar la transformada rápida de Fourier bidimensional (fft2)
fft_resultado = fft2(imagen);

% Centrar las frecuencias utilizando fftshift
fft_resultado_shifted = fftshift(fft_resultado);

% Obtener las dimensiones de la imagen
[m, n] = size(imagen);

% Crear la máscara H
matrix_size = 7;
element_value = 1/49; % 1 dividido por el número total de elementos (7x7)
block_filter = ones(matrix_size) * element_value;
matrix_zeros = zeros(m,n);

% Crear las coordenadas de frecuencia en los ejes X e Y
freq_x = linspace(-1, 1, n);
freq_y = linspace(-1, 1, m);

% Crear la cuadrícula 2D para las frecuencias
[Freq_X, Freq_Y] = meshgrid(freq_x, freq_y);

% Graficar en 3D con colores basados en la magnitud
figure;
surf(Freq_X, Freq_Y, abs(fft_resultado_shifted), 'EdgeColor', 'none', 'FaceColor', 'interp');
title('Transformada de Fourier 2D centrada en 3D con colores');
xlabel('Frecuencia X');
ylabel('Frecuencia Y');
zlabel('Magnitud');
colormap('jet');

% Añadir una barra de color
colorbar;

% Visualizar la imagen original
figure;
imshow(imagen);
title('Imagen Original');
