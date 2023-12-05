% Tests
% añadir las funciones necesarias
addpath("lptoolbox\");


%Carga de una imagen
img = imread("IMG.jpg");
img_gray = rgb2gray(img);
a = 0.4; % depende del contraste, la frecuencia espacial, y la orientación de el objetivo
img_contrast = a * img_gray + (1/2) - (a/2);
%división de frecuencias
img_freq = lpdecn(double(img_contrast),'9/7', 7);


figure();
subplot(1,2,1);
imshow(img_gray);   
title('Imagen en escala de grises');
subplot(1,2,2);
imshow(img_contrast);
title('Imagen con contraste reducido');