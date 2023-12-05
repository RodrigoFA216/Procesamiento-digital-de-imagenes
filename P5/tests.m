imagen = imread('blur.jpeg');

inicio_x_1 = 1;
fin_x_1 = 400;
inicio_y_1 = 1;
fin_y_1 = 480;

mascara1 = zeros(size(imagen, 1), size(imagen, 2));
mascara1(inicio_y_1:fin_y_1, inicio_x_1:fin_x_1) = 1;

filtro_desenfoque1 = fspecial('gaussian', [15, 15], 5);

imagen_desenfocada1 = imagen;
for canal = 1:size(imagen, 3)
    canal_actual = imagen(:, :, canal);
    canal_desenfocado1 = imfilter(canal_actual, filtro_desenfoque1);
    imagen_desenfocada1(:, :, canal) = uint8((1 - mascara1) .* double(canal_actual) + mascara1 .* double(canal_desenfocado1));
end

inicio_x_2 = 600;
fin_x_2 = 845;
inicio_y_2 = 1;
fin_y_2 = 480;

mascara2 = zeros(size(imagen, 1), size(imagen, 2));
mascara2(inicio_y_2:fin_y_2, inicio_x_2:fin_x_2) = 1;

filtro_desenfoque2 = fspecial('gaussian', [15, 15], 3); % Puedes ajustar el tamaño y la desviación estándar según tus necesidades

imagen_desenfocada2 = imagen_desenfocada1;
for canal = 1:size(imagen, 3)
    canal_actual = imagen_desenfocada1(:, :, canal);
    canal_desenfocado2 = imfilter(canal_actual, filtro_desenfoque2);
    imagen_desenfocada2(:, :, canal) = uint8((1 - mascara2) .* double(canal_actual) + mascara2 .* double(canal_desenfocado2));
end

figure;
subplot(1, 2, 1);
imshow(imagen);
title('Imagen Original');
subplot(1, 2, 2);
imshow(imagen_desenfocada2);
title('Desenfoque');

