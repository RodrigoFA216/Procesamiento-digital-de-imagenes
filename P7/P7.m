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
    disp('1. Filtro inverso'); %Y
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
% 

function Ex1 = ejer1()
    % Cargar la imagen
    imagen = imread('Bicicleta.jpg');
    % Calcular la transformada de Fourier 2D de la imagen
    imagen_fft = fft2(imagen);
    % Crear el filtro de movimiento en el dominio frecuencial
    longitud = 25;
    angulo = -15;
    filtro = fspecial('motion', longitud, angulo);
    % Ajustar el tamaño del filtro para que coincida con las dimensiones de la imagen
    filtro = fft2(filtro, size(imagen, 1), size(imagen, 2));
    % Aplicar el filtro multiplicándolo con la transformada de Fourier de la imagen
    imagen_filtrada_fft = imagen_fft .* filtro;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen filtrada
    imagen_filtrada = uint8(ifft2(imagen_filtrada_fft));
    % Redondear los valores de la imagen a enteros
    imagen_filtrada = round(imagen_filtrada);
    % Mostrar la imagen original y la imagen filtrada
    figure(1);
    subplot(1, 2, 1);
    imshow(imagen);
    title('Imagen Original');
    
    subplot(1, 2, 2);
    imshow(imagen_filtrada);
    title('Imagen Filtrada');
    figure(2);
    % Generar matriz Hcut
    n = 0.001;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 1);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.001');
    % Generar matriz Hcut
    n = 0.01;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 2);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.01');
    % Generar matriz Hcut
    n = 0.05;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 3);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.05');
    % Generar matriz Hcut
    n = 0.5;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 4);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.5');
end

%% Ejercicio 2

function Ex2 = ejer2()
    % Cargar la imagen
    imagen = imread('Bicicleta.jpg');
    % Calcular la transformada de Fourier 2D de la imagen
    imagen_fft = fft2(imagen);
    % Crear el filtro de movimiento en el dominio frecuencial
    longitud = 25;
    angulo = -15;
    filtro = fspecial('motion', longitud, angulo);
    % Ajustar el tamaño del filtro para que coincida con las dimensiones de la imagen
    filtro = fft2(filtro, size(imagen, 1), size(imagen, 2));
    % Aplicar el filtro multiplicándolo con la transformada de Fourier de la imagen
    imagen_filtrada_fft = imagen_fft .* filtro;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen filtrada
    imagen_filtrada = uint8(ifft2(imagen_filtrada_fft));
    % Redondear los valores de la imagen a enteros
    imagen_filtrada = round(imagen_filtrada);
    % Añadir el ruido gaussiano con media 0 y varianza 0.0001
    imagen_gaussiana = imnoise(imagen_filtrada, "gaussian", 0, 0.0001);
    % Mostrar la imagen original y la imagen filtrada
    figure(1);
    subplot(2, 2, 1);
    imshow(imagen);
    title('Imagen Original');
    subplot(2, 2, 3);
    imshow(imagen_filtrada);
    title('Imagen Filtrada');
    subplot(2,2,4);
    imshow(imagen_gaussiana);
    title('Imagen con ruido');

    % Ajuste para realizar el mismo proceso pero con la imagen emborronada
    imagen_filtrada_fft = fft2(imagen_gaussiana);
    figure(2);
    % Generar matriz Hcut
    n = 0.001;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 1);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.001');
    % Generar matriz Hcut
    n = 0.01;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 2);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.01');
    % Generar matriz Hcut
    n = 0.05;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 3);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.05');
    % Generar matriz Hcut
    n = 0.5;
    Hcut = zeros(size(filtro));
    for u = 1:size(filtro, 1)
        for v = 1:size(filtro, 2)
            if norm(filtro(u, v)) > n
                Hcut(u, v) = norm(filtro(u, v));
            else
                Hcut(u, v) = -n;
            end
        end
    end
    % Dividir la FFT de la imagen filtrada entre Hcut
    imagen_sin_filtro_fft = imagen_filtrada_fft ./ Hcut;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen sin filtro
    imagen_sin_filtro = uint8(ifft2(imagen_sin_filtro_fft));
    % Redondear los valores de la imagen sin filtro a enteros
    imagen_sin_filtro = round(imagen_sin_filtro);
    % Mostrar la imagen sin filtro
    subplot(2, 2, 4);
    imshow(imagen_sin_filtro);
    title('Imagen n=0.5');
end

%% Ejercicio 3

function Ejer3 = ejer3()
   % Cargar la imagen
    imagen = imread('Bicicleta.jpg');
    % Calcular la transformada de Fourier 2D de la imagen
    imagen_fft = fft2(imagen);
    % Crear el filtro de movimiento en el dominio frecuencial
    longitud = 25;
    angulo = -15;
    filtro = fspecial('motion', longitud, angulo);
    % Ajustar el tamaño del filtro para que coincida con las dimensiones de la imagen
    filtro = fft2(filtro, size(imagen, 1), size(imagen, 2));
    % Aplicar el filtro multiplicándolo con la transformada de Fourier de la imagen
    imagen_filtrada_fft = imagen_fft .* filtro;
    % Calcular la inversa de la transformada de Fourier para obtener la imagen filtrada
    imagen_filtrada = uint8(ifft2(imagen_filtrada_fft));
    % Redondear los valores de la imagen a enteros
    imagen_filtrada = round(imagen_filtrada);
    % Añadir el ruido gaussiano con media 0 y varianza 0.0001
    imagen_gaussiana = imnoise(imagen_filtrada, "gaussian", 0, 0.0001);
    % Ajuste para realizar el mismo proceso pero con la imagen emborronada
    imagen_filtrada_fft = fft2(imagen_gaussiana);
    imagen_fft = fft2(imagen_gaussiana);
    % Valores de SNR
    snr_values = [2, 4, 8, 12];
    % Mostrar la imagen original
    figure;
    subplot(1, length(snr_values)+1, 1);
    imshow(imagen_gaussiana);
    title('Imagen emborronada y filtrada');
    for i = 1:length(snr_values)
        % Crear el filtro Wiener con el valor de SNR correspondiente
        filtro_wiener = wiener2(imagen, [5, 5], snr_values(i));
        % Aplicar el filtro Wiener multiplicándolo con la transformada de Fourier de la imagen
        imagen_filtrada_fft = imagen_fft .* fft2(filtro_wiener);
        % Calcular la inversa de la transformada de Fourier para obtener la imagen filtrada
        imagen_filtrada = uint8(ifft2(imagen_filtrada_fft));
        % Redondear los valores de la imagen a enteros
        imagen_filtrada = round(imagen_filtrada);
        % Mostrar la imagen filtrada con filtro Wiener
        subplot(1, length(snr_values)+1, i+1);
        imshow(imagen_filtrada);
        title(['SNR = ' num2str(snr_values(i))]);
    end
end
