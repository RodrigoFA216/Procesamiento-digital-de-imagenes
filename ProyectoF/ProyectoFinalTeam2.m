% Proyecto Final
% Flores Avalos Rodrigo Emmanuel
% Sergio Huesca Flores
% Miguel Camargo

% Tests

%Carga de una imagen

clear;
close all;

img = imread("IMG.jpg");
img_gray = rgb2gray(img);
img_gray = mat2gray(img_gray);
a = 0.4; % depende del contraste, la frecuencia espacial, y la orientación de el objetivo
img_contrast = a * img_gray + (1/2) - (a/2);
[filas, columnas]=size(img_contrast);



indice = 1;
frames = 300;
figure(WindowState="maximized");
while indice <= frames
    for y=1:filas
        for x=1:columnas
            k = img_contrast(y,x) - 0.8;
            l = img_contrast(y,x) + 0.8;
            r = k + (l - k).*rand(1,1)>0.5;
            In(y,x) = r;
        end
    end
    I(indice) = {In};
    subplot(1,2,1);
    imshow(In);
    if indice == 1
        prom = cell2mat(I(indice));
        subplot(1,2,2);
        imshow(prom);
        hold on;
        pause(0.0001);
    else
        prom = prom + cell2mat(I(indice));
        Ic = prom./indice;
        subplot(1,2,2);
        hold on;
        imshow(Ic);
        pause(0.0001);
    end
    %subplot(1,2,2);
    %imshow(prom/frames);
    indice = indice + 1;
end
hold off;
Ir = (Ic + (a/2)-(1/2))/a;

figure();
hold on;
subplot(1,4,1);
imshow(img_gray);
title('Imagen en escala de grises');
subplot(1,4,2);
imshow(img_contrast);
title('Imagen con contraste reducido');
subplot(1,4,3);
imshow(Ic);
title('Imagen recuperada con contraste reducido');
subplot(1,4,4);
imshow(Ir);
title('Imagen recuperada con contraste restaurado');
hold off;