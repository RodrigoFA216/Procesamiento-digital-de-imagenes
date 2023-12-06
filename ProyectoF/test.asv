% Tests


%Carga de una imagen
img = imread("IMG.jpg");
img_gray = rgb2gray(img);
a = 0.4; % depende del contraste, la frecuencia espacial, y la orientación de el objetivo
img_contrast = a * img_gray + (1/2) - (a/2);
% generación de los códigos temporales
count = 0;
[x,y] = size(img_contrast);
while count <= 450
    for i = 1 : x
        for j = 1 : y
            major = img_contrast(i,j) -0.5;
            = img_contrast(i,j) -0.5;
        end
    end
end


figure();
subplot(1,2,1);
imshow(img_gray);   
title('Imagen en escala de grises');
subplot(1,2,2);
imshow(img_contrast);
title('Imagen con contraste reducido');