% Tests

%Carga de una imagen
img = imread("IMG.jpg");
img_gray = rgb2gray(img);
img_gray = mat2gray(img_gray);
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

%For an exact 8-bit representation of the target image, n = 256 frames are required.
n = 256;

%Dither Matrix
dit = imread("Escudo.png");
%dit = mat2gray(dit);
dit = imresize(dit,[(filas/5),(columnas/5)]);
%dit = mat2gray(dit);
figure;
imshow(dit);

%Repeated dither matrix
dithered = repmat(dit,5);
dithered = mat2gray(dithered);
figure;
imshow(dithered);

ti = zeros(filas,columnas,n);
ti(:,:,1) = dithered;

%Animated repeated dither matrix
for f=2:n
    for y=1:filas
        for x=1:columnas
           ti(y,x,f) = ti(filas,columnas,f-1);
           if((y<=filas-1)&&(x<=columnas-1))
            ti(y,x,f) = ti(y,x+1,f-1);
            
           end
           ti(y,columnas,f) = ti(y,1,f-1);
           
        end
    end
end

figure;
for f=1:n
    imshow(ti(:,:,f));
    pause(0.01);
end

%ratio rwb of white to black pixel
rwb = (img_contrast)./(1-img_contrast);
%Number w of white pixels
w = floor((rwb.*n)./(1 + rwb));

Nti = zeros(filas,columnas,n);

for y=1:filas
    for x=1:columnas;
        for f=1:n
            Tresh(f) = ti(y,x,f);
        end
        [sortedTresh,indx] = sort(Tresh);
        sortedTresh(1:w(y,x)) = 1;
        sortedTresh(w(y,x)+1:n) = 0;
        for f=1:n
            Nti(y,x,indx(f)) = sortedTresh(f);
        end
    end
end

for f=1:n
    imshow(Nti(:,:,f));
    hold on
    pause(0.03);
end

indice = 1;
frames = 350;
% CÓDIGO QUE DEMUESTRA MI ESTUPIDEZ
while indice <= frames;
    for y=1:filas
        for x=1:columnas
            a = img_contrast(y,x) - 0.8;
            b = img_contrast(y,x) + 0.8;
            r = a + (b - a).*rand(1,1)>0.5;
            In(y,x) = r;
        end
    end
    I(indice) = {In};

    imshow(In);
    hold on;
    pause(0.03);

    if(indice == 1)
        prom = In;
        figure;
        imshow(prom);
        hold on;
    else

        prom = (prom + (I(indice - 1)))./2;
        imshow(prom(1,1));
        pause(0.03);
    end
    indice = indice + 1;
end
