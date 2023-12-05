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
    disp('1. Filtro suavizador'); %Y
    disp('2. Filtro pasa-altas');%Y
    disp('3. Filtro pasa-bajas');
    disp('4. Filtro Butterworth'); %Y

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
        case 4
            disp('Ejecutando Ejercicio 4');
            ejer4();
        case 10
            disp('Chauchau diria el peso pluma');
        otherwise
            disp('Opción no válida. Por favor no sea sapo, elija una opción válida.');
    end
end

disp('¡Gracias por usar el programa!');

%% Ejercicio 1
% 

function Ex1 = ejer1()
    imagen = imread('boats.bmp');
    filtro_tam = 7;
    filtro = ones(filtro_tam) / (filtro_tam^2);
    filtered_image = conv2(imagen, filtro, 'same');
    filtro_fft = fft2(filtro, size(imagen, 1), size(imagen, 2));
    image_fft = fft2(filtered_image);
    image_ne = ifftshift(image_fft);
    image_new = ifft2(image_ne);

    figure(1);
    subplot(2, 3, 1);
    surf(log(1 + abs(fftshift(filtro_fft))));
    shading interp;
    title('Espectro de Fourier del filtro 2D');
    colormap('jet');
    colorbar;
    subplot(2, 3, 2);
    imshow(log(1 + abs(fftshift(filtro_fft))));
    title('Espectro Imagen Original');
    subplot(2, 3, 4);
    surf(log(1 + abs(fftshift(image_fft))));
    shading interp;
    title('Espectro de Fourier de la imagen filtrada');
    colormap('jet');
    colorbar;
    subplot(2, 3, 5);
    imshow(log(1 + abs(fftshift(image_fft))),[]);
    title('Espectro Imagen Filtrada');
    colormap('jet');
    subplot(2, 3, 3);
    imshow(imagen);
    title("Imagen original");
    subplot(2, 3, 6);
    imshow(uint8((image_new)));
    title("Imagen filtrada");
end

%% Ejercicio 2

function Ex2 = ejer2()
    imagen = imread('boats.bmp');
    filtro = [0 1 0; 1 -4  1; 0 1 0];
    imagen_filtrada = conv2(imagen, filtro, 'same');
    filtro_fft = fft2(filtro, size(imagen, 1), size(imagen, 2));
    imagen_fft = fft2(imagen_filtrada);
    img_n = ifftshift(imagen_fft);
    nueva_img = ifft2(img_n);
    

    figure;
    subplot(2, 3, 1);
    surf(log(1 + abs(fftshift(filtro_fft))));
    shading interp;
    title('Espectro de Fourier del filtro 2D');
    colormap('jet');
    colorbar;
    subplot(2, 3, 2);
    imshow(log(1 + abs(fftshift(filtro_fft))));
    title('Espectro Imagen Original');
    subplot(2, 3, 4);
    surf(log(1 + abs(fftshift(imagen_fft))));
    shading interp;
    title('Espectro de Fourier de la imagen filtrada');
    colormap('jet');
    colorbar;
    subplot(2, 3, 5);
    imshow(log(1 + abs(fftshift(imagen_fft))),[]);
    title('Espectro Imagen Filtrada');
    colormap('jet');
    subplot(2, 3, 3);
    imshow(imagen);
    title("Imagen original");
    subplot(2, 3, 6);
    imshow(uint8((nueva_img)));
    title("Imagen filtrada");
end

%% Ejercicio 3

function Ejer3 = ejer3()
    I = imread("lena.bmp");
    [m, n] = size(I);
    orden = 2; 
    D0 = 0.125;
    mm = m;
    nn = n;
    xr = (-nn/2:(nn/2)-1) / nn;
    yr = (-mm/2:(mm/2)-1) / mm;
    [u, v] = meshgrid(xr, yr);
    D = sqrt(u.^2 + v.^2);
    butter = 1.0 ./ (1.0 + (D ./ D0).^(2*orden));
    
    M = fft2(I);
    IF = fftshift(M).*butter;
    imagen_n = ifftshift(IF);
    nueva_img = ifft2(imagen_n);

    figure(3);
    subplot(2,3,1);
    imshow(butter);
    title('Espectro del filtro Butterworth pasa-bajas');
    subplot(2,3,2);
    mesh(abs(butter));
    title('Espectro del filtro Butterworth pasa-bajas (3D)');
    colorbar;
    subplot(2,3,4);
    imshow(uint8(abs(IF)),[]);
    title('Espectro del filtro Butterworth pasa-bajas');
    subplot(2,3,5);
    mesh(log(1+abs(IF)));
    title('Espectro del filtro Butterworth pasa-bajas (3D)');
    colorbar;
    subplot(2,3,3);
    imshow(I);
    title("Imagen Original")
    subplot(2,3,6);
    imshow(uint8(nueva_img));
    title("Imagen Modificada")
end

%% Ejercicio 4

function Ex4 = ejer4()
    I = imread("lena.bmp");
    [m, n] = size(I);
    orden = 2;
    D0 = 0.125;
    mm = m;
    nn = n;
    xr = (-nn/2:(nn/2)-1) / nn;
    yr = (-mm/2:(mm/2)-1) / mm;
    [u, v] = meshgrid(xr, yr);
    D = sqrt(u.^2 + v.^2);
    butter = 1.0 ./ (1.0 + (D0 ./ D).^(2*orden));

    M = fft2(I);
    IF = fftshift(M).*butter;
    imagen_n = ifftshift(IF);
    nueva_img = ifft2(imagen_n);

    figure(4);
    subplot(2,3,1);
    imshow(butter);
    title('Espectro del filtro Butterworth pasa-bajas');
    subplot(2,3,2);
    mesh(abs(butter));
    title('Espectro del filtro Butterworth pasa-bajas (3D)');
    colorbar;
    subplot(2,3,4);
    imshow(abs(IF),[]);
    title('Espectro del filtro Butterworth pasa-bajas');
    subplot(2,3,5);
    mesh(abs(IF));
    title('Espectro del filtro Butterworth pasa-bajas (3D)');
    colorbar;
    subplot(2,3,3);
    imshow(I);
    title("Imagen Original")
    subplot(2,3,6);
    imshow(uint8(nueva_img));
    title("Imagen Modificada")
end