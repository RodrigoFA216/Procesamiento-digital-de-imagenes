% Tests

%Carga de una imagen
img = imread("IMG.jpg");
img_gray = rgb2gray(img);
img_gray = mat2gray(img_gray);
a = 0.4; % depende del contraste, la frecuencia espacial, y la orientación de el objetivo
img_contrast = a * img_gray + (1/2) - (a/2);
[filas, columnas]=size(img_contrast);

figure(2);
hold on;
subplot(1,2,1);
imshow(img_gray);
title('Imagen en escala de grises');
subplot(1,2,2);
imshow(img_contrast);
title('Imagen con contraste reducido');
hold off;

indice = 1;
frames = 30;
figure(3);
hold on;
while indice <= frames
    for y=1:filas
        for x=1:columnas
            a = img_contrast(y,x) - 0.8;
            b = img_contrast(y,x) + 0.8;
            r = a + (b - a).*rand(1,1)>0.5;
            In(y,x) = r;
        end
    end
    I(indice) = {In};
    subplot(1,2,1);
    imshow(In);
    hold on;
    if(indice == 1)
        prom = cell2mat(I(indice));
        subplot(1,2,2);
        imshow(prom);
        hold on;
        pause(0.03);
    else
        aux = cell2mat(I(indice));
        prom = (prom + aux)./2;
        subplot(1,2,2);
        imshow(prom);
        hold on;
        pause(0.03);
    end
    indice = indice + 1;
end

hold off;
