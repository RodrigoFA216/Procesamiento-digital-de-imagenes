% Práctica 2
% Flores Avalos Rodrigo Emmanuel

%% Inicialización de variables
opcion = 0;

% Bucle para mostrar el menú de selección hasta que el usuario elija salir
while opcion ~= 12
    % Mostrar el menú
    %clc
    disp('Menú de selección:');
    disp('1. Leer y desplegar la imagen del archivo “corte.bmp”.');
    disp('2. Leer la imagen del archivo "rxcerv.pcx” y desplegarla.');
    disp('3. Leer y desplegar la imagen “abdomen.png”.');
    disp('4. Abrir y visualizar la imagen RGB “magriclonRGB.jpg”');
    disp('5. Abrir y visualizar la imagen RGB “retinaRGB.jpg” y sus componentes');
    disp('6. Convertir la imagen RGB “retinaRGB.jpg” a niveles de gris. Apoyarse en el uso de la función rgb2gray.');
    disp('7. Visualizar la imagen “intestinoRGB.jpg” con diferentes paletas de colores predefinidas de MatLab.');
    disp('8. Realiza un script que lea de manera automática todo el conjunto de imágenes y se muestren en una misma ventana para observar de manera automática toda la secuencia de video.');
    disp('9. Construye la matriz vinculada');
    disp('10. Extrae de la imagen de la figura A la región de interés');
    disp('11. Representación de imágenes digitales monocromáticas');
    disp('12. Salir');
    
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
        case 4
            disp('Ejecutando Ejercicio 4');
            ejer4();
        case 5
            disp('Ejecutando Ejercicio 5');
            ejer5();
        case 6
            disp('Ejecutando Ejercicio 6');
            ejer6();
        case 7
            disp('Ejecutando Ejercicio 7');
            ejer7();
        case 8
            disp('Ejecutando Ejercicio 8');
            ejer8();
        case 9
            disp('Ejecutando Ejercicio 9');
            ejer9();
        case 10
            disp('Ejecutando Ejercicio 10');
            ejer10();
        case 11
            disp('Ejecutando Ejercicio 11');
            ejer11();
        case 12
            disp('Chachau diría el peso pluma');
        otherwise
            disp('Opción no válida. Por favor, elija una opción válida.');
    end
end

disp('¡Gracias por usar el programa!');

%% Ejercicio 1
% Leer y desplegar la imagen del archivo "corte.bmp".
function Ex1 = ejer1()
    img_corte = imread('C:\Users\ThinkPad\Documents\Maestría\SEMESTRES\1\Procesamiento de imágenes\files\corte.bmp');
    figure(1);
    imshow(img_corte);
end

%% Ejercicio2
% Leer la imagen del archivo "rxcerv.pcx" y desplegarla usando primero el 
% comando image y  posteriormente el comando imshow. Explica las diferencias 
% del uso de ambas funciones, puedes apoyarte en  la ayuda de ambas funciones.
function Ex2 = ejer2()
    img_rx = imread("files\rxcerv.pcx");
    figure(2);
    subplot(1,2,1);
    image(img_rx);
    title('Función image');
    subplot(1,2,2);
    imshow(img_rx);
    title('Función imshow');
end
%% Ejercicio 3
% Leer y desplegar la imagen “abdomen.png” usando el comando image y usando 
% posteriormente el comando imagesc. Explica las diferencias del uso de 
% ambas funciones, puedes apoyarte en la ayuda de ambas funciones.
function Ex3 = ejer3()
    img_abd = imread("files\abdomen.png");
    figure(3);
    subplot(1,2,1);
    image(img_abd);
    title('Función image');
    subplot(1,2,2);
    imagesc(img_abd);
    title('Función imagesc');
end
%% Ejercicio 4
% Abrir y visualizar la imagen RGB “magriclonRGB.jpg”.
function Ex4 = ejer4()
    img_corte = imread('files\magriclonRGB.jpg');
    figure(4);
    subplot(1,3,1);
    imshow(img_corte);
    title('Funcion imshow');
    subplot(1,3,2);
    image(img_corte);
    title('Funcion image');
    subplot(1,3,3);
    imagesc(img_corte);
    title('Funcion imagesc');
end
%% Ejercicio 5
% Abrir y visualizar la imagen RGB “retinaRGB.jpg” así como cada una de sus
% componentes por separado usando la paleta de color roja, verde y azul,
% para ello se deberá mantener “encendido” un canal y los otros dos se
% deberán “apagar”
function Ex5 = ejer5()
    img_retina = imread("files\retinaRGB.jpg");
    [alto, ancho, ~] = size(img_retina);
    rojo = zeros(alto, ancho, 3);
    verde = zeros(alto, ancho, 3);
    azul = zeros(alto, ancho, 3);
    rojo(:, :, 1) = img_retina(:, :, 1);
    verde(:, :, 2) = img_retina(:, :, 2);
    azul(:, :, 3) = img_retina(:, :, 3);
    figure(5)
    subplot(2,2,1);
    imshow(img_retina);
    title('Imagen original');
    subplot(2,2,2);
    imshow(uint8(rojo));
    title('canal 1');
    subplot(2,2,3);
    imshow(uint8(verde));
    title('canal 2');
    subplot(2,2,4);
    imshow(uint8(azul));
    title('canal 3');
end
%% Ejercicio 6
% Convertir la imagen RGB “retinaRGB.jpg” a niveles de gris. Apoyarse en el uso de la función rgb2gray
function Ex6 = ejer6()
    img_retina = imread("files\retinaRGB.jpg");
    img_retina_gray = rgb2gray(img_retina);
    figure(6)
    subplot(1,2,1);
    imshow(img_retina);
    title('Imagen Original')
    subplot(1,2,2);
    imshow(img_retina_gray);
    title('Imagen en escala de grises')
end
%% Ejercicio 7
% Visualizar la imagen “intestinoRGB.jpg” con diferentes paletas de colores predefinidas de MatLab.
function Ex7 = ejer7()
    img_intestino = imread("files\intestinoRGB.jpg");
    img_intestino = rgb2gray(img_intestino);
    figure(7);
    subplot(2,2,1);
    imshow(img_intestino, [], Colormap = spring);
    title('Imagen spring')
    subplot(2,2,2);
    imshow(img_intestino, [], Colormap = colorcube);
    title('Imagen colorcube')
    subplot(2,2,3);
    imshow(img_intestino, [], Colormap = hsv);
    title('Imagen hsv')
    subplot(2,2,4);
    imshow(img_intestino, [], Colormap = jet);
    title('Imagen jet')
end
%% Ejercicio 8 
% Se cuenta con un conjunto de frames de video en formato png (carpeta news):
% Realiza un script que lea de manera automática todo el conjunto de imágenes y se muestren en una misma 
% ventana para observar de manera automática toda la secuencia de video
function Ex8 = ejer8()
    carpeta = 'files\news';
    archivos = dir(fullfile(carpeta, '*.png')); 
    imagenes = cell(1, numel(archivos));
    for i = 1:numel(archivos)
        nombre_archivo = fullfile(carpeta, archivos(i).name);
        imagenes{i} = imread(nombre_archivo);
    end
    figure;
    i = 0;
    while i < 8
        for i = 1:numel(imagenes)
            imshow(imagenes{i});
            pause(0.3);
            clf;
        end
        i=i+1;
    end
end
%% Ejercicio 9
% Construye la matriz vinculada a la imagen de la siguiente figura.
% Las dimensiones de la imagen son 300x300 y las dimensiones del rectángulo negro son a consideración del estudiante.
function Ex9 = ejer9()
    Img_base = ones(300,300);
    for i = 0 : 300
        for j = 0 : 300
            if i > 50 && i < 250
                if j > 100 && j < 200
                    Img_base(i,j) = 0;
                end
            end
        end
    end
    figure(9)
    imshow(Img_base);
    title('Imagen resultante');
end
%% Ejercicio 10
% Extrae de la imagen de la figura A la región de interés mostrada en la figura B.
function Ex10 = ejer10()
    img_barbara = imread('files\barbarag.bmp');
    img_crop = img_barbara(27:250,248:452);
    figure(10)
    subplot(1,2,1);
    imshow(img_barbara)
    title('Imagen original')
    subplot(1,2,2);
    imshow(img_crop);
    title('Región deseada')
end
%% Ejercicio 11
function Ex11 = ejer11()
    matrix = zeros([300,300]);
    for i = 1 : 300
        for j = 1 : 300
            matrix(i,j) = (255-sqrt(((i-150)^2)+((j-150)^2)))/255;
        end
    end
    figure(11)
    imshow(matrix)
end

