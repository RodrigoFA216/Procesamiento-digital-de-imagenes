% Tests

%Carga de una imagen
img = imread("IMG.jpg");
img_gray = rgb2gray(img);
a = 0.4; % depende del contraste, la frecuencia espacial, y la orientación de el objetivo
img_contrast = a * img_gray + (1/2) - (a/2);
[filas, columnas]=size(img_contrast);
%división de frecuencias



figure();
subplot(1,2,1);
imshow(img_gray);
title('Imagen en escala de grises');
subplot(1,2,2);
imshow(img_contrast);
title('Imagen con contraste reducido');

dit = imread("Escudo.png");
dit = mat2gray(dit);
dit = imresize(dit,[(filas/5),(columnas/5)]);
imshow(dit);

dithered=repmat(dit,5);

frames = zeros(filas,columnas,256);
frames(:,:,1) = dithered;

for f=2:256
    for y=1:filas
        for x=1:columnas
           frames(y,x,f) = frames(filas,columnas,f-1);
           if((y<=filas-1)&&(x<=columnas-1))
            frames(y,x,f) = frames(y,x+1,f-1);
            
           end
           frames(y,columnas,f) = frames(y,1,f-1);
           
        end
    end
end

figure;
imshow(dithered);

figure;
for f=1:256
    imshow(frames(:,:,f));
    pause(0.02);
end
    


