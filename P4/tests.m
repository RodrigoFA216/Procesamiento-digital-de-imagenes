
% Paso 1: Visualizar imágenes y histogramas
mandrill = imread('mandrill.bmp');
boats = imread('boats.bmp');

% Mostrar imágenes
figure();
subplot(2, 2, 1);
imshow(mandrill);
title('Mandrill Image');

subplot(2, 2, 2);
imshow(boats);
title('Boats Image');

% Mostrar histogramas
subplot(2, 2, 3);
imhist(mandrill);
title('Histogram - Mandrill');

subplot(2, 2, 4);
h = imhist(boats);
plot(h);
title('Histogram - Boats');

% Paso 2: Ecualizar la imagen "mandrill.bmp" usando h
mandrill_ecualizada = histeq(mandrill, h);

% Mostrar la imagen original y la ecualizada
figure;
subplot(1, 2, 1);
imshow(mandrill);
title('Original Mandrill Image');

subplot(1, 2, 2);
imshow(mandrill_ecualizada);
title('Ecualized Mandrill Image');






% img_lena = imread('lena.bmp');
% img_lena_hist = imhist(img_lena);
% 
% [img_lena_histeq, img_lena_histeq_hist] = histeq(img_lena, 256);
% %img_lena_histeq_hist = imhist(img_lena_histeq);
% 
% img_lena_funcion = cumsum(img_lena_hist) ./ numel(img_lena);
% b = uint8(255 * img_lena_funcion(img_lena +1));
% img_lena_transf = uint8(double(max(img_lena(:))-min(img_lena(:))).* img_lena_funcion + double(min(img_lena(:))));
% img_lena_transf_hist = imhist(img_lena_transf);
% 
% figure;
% subplot(3,2,1);
% imshow(img_lena);
% title('Imagen Original');
% subplot(3,2,2);
% bar(img_lena_hist);
% title('Histograma Original');
% xlabel('Valor del píxel');
% ylabel('Frecuencia');
% 
% subplot(3,2,3);
% imshow(img_lena_histeq);
% title('Imagen Histeq');
% subplot(3,2,4);
% imhist(img_lena_histeq_hist);
% title('Histograma histeq');
% xlabel('Valor del píxel');
% ylabel('Frecuencia');
% 
% subplot(3,2,5);
% imshow(b);
% title('Imagen Transferencia');
% subplot(3,2,6);
% bar(img_lena_transf_hist);
% title('Histograma histeq');
% xlabel('Valor del píxel');
% ylabel('Frecuencia');