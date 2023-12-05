% Práctica 6
% Flores Avalos Rodrigo Emmanuel

%% Inicialización de variables

clear;
clc;
opcion = 0;
% Bucle para mostrar el menú de selección hasta que el usuario elija salir
while opcion ~= 10
    % Mostrar el menú
    %clc
    disp('Menú de selección:');
    disp('1. Erosión de una imágen'); %Y
    disp('2. Filtro inverso con ruido');%Y
    disp('3. Filtro Wiener');

    disp('10. Salir');
    
    % Solicitar al usuario que ingrese la opción
    opcion = input('Ingrese el número de la opción deseada: ');

    switch opcion
        case 1
            disp('Ejecutando Ejercicio 1');
            ejer1();
        case 2
            disp('Ejecutando Ejercicio 2');
            ejer2();
        case 3
            disp('Ejecutando Ejercicio 3');
            ejer3();
        case 10
            disp('Chauchau diria el peso pluma');
        otherwise
            disp('Opción no válida. Por favor no sea sapo, elija una opción válida.');
    end
end

disp('¡Gracias por usar el programa!');

%% Ejercicio 1

function Ejer1 = ejer1()
    % Declarar la imagen binaria
    imagen_binaria = [0,0,1,1,0;0,1,1,1,0;1,1,1,1,0;0,1,1,1,0;0,0,0,0,0];
    % Declarar patrón para la creación del elemento estructural
    pat = [1,0;0,1];
    % Declarar el elemento estructural
    se = strel("arbitrary", pat);
    % Erosión de la imagen binaria según el elemeno estructural
    salida = imerode(imagen_binaria, se);
    
    % Visualización de las imágenes
    figure;
    subplot(1,3,1);
    imshow(imagen_binaria, 'InitialMagnification', 'fit');
    title('Matriz Binaria');
    subplot(1,3,2);
    imshow(se.Neighborhood, 'InitialMagnification', 'fit');
    title('Elemento estructural');
    subplot(1,3,3);
    imshow(salida, 'InitialMagnification', 'fit');
    title('Matriz erosionada');
end

%% Ejercicio 2

function Ejer2 = ejer2()
    % Leer la imagen
    img = imread("Brain.png");
    % Binarizar la imagen
    umbral = 50;
    img_bin = imbinarize(img, umbral/255);
    % Operar la imágen
    se = strel('disk',3);
    img_fill = imfill(img_bin, "holes");
    eros = imerode(img_fill, se);
    
    se2 = strel("square", 2);
    eros2 = bwmorph(eros, "dilate");
    
    figure;
    subplot(2,2,1);         
    imshow(img);
    title('Imagen Original');
    subplot(2,2,2);
    imshow(img_bin);
    title('Imagen Binaria');
    subplot(2,2,4);
    imshow(imoverlay(img, (img_bin - eros2), 'red'));
    title('Superposición de borde');
    subplot(2,2,3);
    imshow(img_bin - eros2);
    title('Borde');
end

function Ej3 = ejer3()
im1=imread("Textil1.png");
im2=imread("Textil2.png");
[w1, w2]=size(im1);
[w3, w4]=size(im2);
SE1=strel("disk",3);
im1ap=imopen(im1,SE1);
im1cl=imclose(im1ap, SE1);
for i =1 : w1
    for j = 1 : w2
        if (im1cl(i,j)<=79)
            imo(i,j)=255;
        else
            imo(i,j)=0;
        end
    end
end
figure;
subplot(2,2,1);
imshow(im1)
title("imagen original")
subplot(2,2,2);
imshow(im1ap);
title("imagen aperturada");
subplot(2,2,3);
imshow(im1cl);
title("imagen cerrada");
subplot(2,2,4);
imshow(imo);
title("imagen umbralizada")

end
