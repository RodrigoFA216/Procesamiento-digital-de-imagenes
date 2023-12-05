% Práctica 2
% Flores Avalos Rodrigo Emmanuel

%% Inicialización de variables
opcion = 0;

% Bucle para mostrar el menú de selección hasta que el usuario elija salir
while opcion ~= 10
    % Mostrar el menú
    %clc
    disp('Menú de selección:');
    disp('1. Transformación lineal (ampliación del contraste 1)'); %Y
    disp('2. Transformación lineal (ampliación del contraste 2)');
    disp('3. Transformación lineal (ampliación del contraste 3)');
    disp('4. Binarización de una imagen'); %Y
    disp('5. Abre la imagen  angibrain.gif" y su negativo'); %Y
    disp('6. Transformación de Potencia (Corrección Gamma)');
    disp('7. Transformación logarítmica');%Y
    disp('8. Operaciones lógico aritméticas');%Y
    disp('9. Rebanadas de planos de bits');

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
            disp('Chachau diría el peso pluma');
        % case 11
        %     disp('Ejecutando Ejercicio 11');
        %     ejer11();
        % case 12
        %     disp('Chachau diría el peso pluma');
        otherwise
            disp('Opción no válida. Por favor, elija una opción válida.');
    end
end

disp('¡Gracias por usar el programa!');
%% Ejercicio 1
% a) Visualiza la imagen “magrisuave.jpg” y su histograma. Para visualizar el histograma, puedes apoyarte de la función imhist.
% b) Gráfica la función de transformación para ampliar el contraste de la imagen y aplica la función de transformación a la imagen, visualiza la imagen resultante y su histograma
function Ex1 = ejer1()
    img_corte = imread('magrisuave.jpg');
    img_corte = double(img_corte);
    img_min = min(min(img_corte));
    img_max = max(max(img_corte));
    m = 254 / (img_max-img_min);
    img_size = size(img_corte);
    img_result = zeros(img_size);
    for i = 1 : img_size(1)
        for j = 1 : img_size(2)
            value = img_corte(i,j);
            if value < 71
                img_result(i,j) = 0;
            elseif value > 189
                img_result(i,j) = 255;
            else
                img_result(i,j) = round((2.1610*(value-189))+255);
            end
        end
    end
    figure(1);
    subplot(2,2,1);
    img_corte = uint8(img_corte);
    imshow(img_corte);
    title('Imagen');
    subplot(2,2,2);
    img_hist = imhist(img_corte);
    bar(img_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,3);
    img_result = uint8(img_result);
    imshow(img_result);
    title('Imagen resultante');
    subplot(2,2,4);
    img_result_hist = imhist(img_result);
    bar(img_result_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 2
function Ex2 = ejer2()
    img_corte = imread('magrisuave.jpg');
    img_corte_db = double(img_corte);
    m = 254 / 173;
    img_size = size(img_corte);
    img_result = zeros(img_size);
    for i = 1 : img_size(1)
        for j = 1 : img_size(2)
            value = img_corte(i,j);
            if value <= 173
                img_result(i,j) = uint8(m*img_corte(i,j));
            else
                img_result(i,j) = 255;
            end
        end
    end
    figure(1);
    subplot(2,2,1);
    img_corte = uint8(img_corte);
    imshow(img_corte);
    title('Imagen');
    subplot(2,2,2);
    img_hist = imhist(img_corte);
    bar(img_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,3);
    img_result = uint8(img_result);
    imshow(img_result);
    title('Imagen resultante');
    subplot(2,2,4);
    img_result_hist = imhist(img_result);
    bar(img_result_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 3
function Ex3 = ejer3()
    img_nb = imread("NB.bmp");
    image_proc = mat2gray(img_nb);
    img_size = size(image_proc);
    a = 0.5;
    c = 0.8627;
    img_res = ones(img_size);
    for i = 1 : img_size(1)
        for j = 1 : img_size(2)
            if((image_proc(i,j) >= 0) && (image_proc(i,j) <= c))
                img_res(i,j) = image_proc(i,j)*a;
            elseif((image_proc(i,j) > c) && (image_proc(i,j) <= 1))
                img_res(i,j) = (((1 - (a * c)) / (1 - c))*(image_proc(i,j) - c)) + (a * c);
            end
        end
    end
    figure(3);
    subplot(2,2,1);
    imshow(img_nb);
    title('imagen original');
    img_nb_hist= imhist(img_nb);
    subplot(2,2,2);
    bar(img_nb_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,3);
    imshow(img_res);
    title('imagen procesada');
    img_nb_hist= imhist(img_res);
    subplot(2,2,4);
    bar(img_nb_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 4
% a) Abre la imagen “globulosRGB.jpg”.
% b) Cambia la representación de color a escala de grises y visualiza su histograma.
% c) En base al histograma, determina un umbral óptimo de manera subjetiva para binarizar la imagen del punto 
% b), usando el umbral óptimo encontrado.
% d) Muestra la imagen binarizada tantas veces sea necesario de modo que se logre tener una aproximación a la
% binarización mostrada a continuación.
function Ex4 = ejer4()
    img_glob = imread("globulosRGB.jpg");
    img_glob_gr = rgb2gray(img_glob);
    img_size = size(img_glob_gr);
    img_hist = imhist(img_glob_gr);
    img_bin = ones(img_size);
    for i = 1 : img_size(1)
        for j = 1 : img_size(2)
            value = img_glob_gr(i,j);
            if value > 150
                img_bin(i,j) = 1;
            else
                img_bin(i,j) = 0;
            end
        end
    end
    img_bin_hist = imhist(img_bin);
    figure(4);
    subplot(2,2,1);
    imshow(img_glob_gr);
    title('Imagen Gris')
    subplot(2,2,2);
    bar(img_hist);
    title('Histograma');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,3);
    imshow(img_bin);
    title('Imagen binaria');
    subplot(2,2,4);
    bar(img_bin_hist);
    title('Histograma imagen binaria');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 5
% a) Abre la imagen “angibrain.gif” y visualiza su histograma.
% b) Visualiza la función de transformación para obtener el negativo de la imagen.
% c) Muestra el negativo de la imagen y visualiza su histograma.
function Ex5 = ejer5()
    img_brain = imread("angibrain.gif");
    img_size = size(img_brain);
    img_brain_inv = zeros(img_size);
    img_brain_hist = imhist(img_brain);
    for i = 1 : img_size(1)
        for j = 1 : img_size(2)
            value = img_brain(i,j);
            img_brain_inv(i,j) = 254 - value;
        end
    end
    figure(5);
    subplot(2,2,1);
    imshow(img_brain);
    colormap(gray);
    title('Imagen original');
    subplot(2,2,2);
    bar(img_brain_hist);
    title('Histograma original');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,3);
    img_brain_inv = uint8(img_brain_inv);
    imshow(img_brain_inv);
    title('Imagen negativa');
    subplot(2,2,4);
    img_brain_inv_hist = imhist(img_brain_inv);
    bar(img_brain_inv_hist);
    title('Histograma negativo');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 6
% a) Aplica la corrección Gamma a la imagen “lena.bmp” con t igual a 0.5.
% b) Aplica la corrección Gamma a la imagen “lena.bmp” con t igual a 2.
function Ex6 = ejer6()
    img_lena = imread("Lena.bmp");
    img_lena_db = double(img_lena);
    
    figure(6);
    subplot(1,2,1);
    img_lena = uint8(img_lena);
    imshow(img_lena);
    subplot(1,2,2);
    img_gamma = uint8(img_gamma);
    imshow(img_gamma);
end

%% Ejercicio 7
% a) Despliega la imagen “neuronarat.jpg” (usar el comando “imshow”) y visualiza su histograma
% b) Aplica la transformación logarítmica a la imagen (la función de MatLab que calcula el logaritmo es “log”), 
% y encuentra el valor óptimo de “c” a prueba y error, de modo que en la imagen transformada se descubran 
% detalles que no se vean claramente en la imagen original.
function Ex7 = ejer7()
    img_neur = imread("neuronarat.jpg");
    img_neur_hist = imhist(img_neur);
    img_neur = double(img_neur);
    c = 40;
    img_neur_log = c * log(img_neur + 1);
    figure(7);
    subplot(2,2,1);
    img_neur = uint8(img_neur);
    imshow(img_neur);
    title('imagen original');
    subplot(2,2,3);
    img_neur_log = uint8(img_neur_log);
    img_neur_log_hist = imhist(img_neur_log);
    imshow(img_neur_log);
    title('imagen corrección logaritmica');
    subplot(2,2,2);
    bar(img_neur_hist);
    title('Histograma imagen original');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,4);
    bar(img_neur_log_hist);
    title('Histograma logarítmico');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 8
function Ex8 = ejer8()
    img_1 = ones(256,256);
    img_2 = img_1;
    
    for i = 1 : 256
        for j = 1 : 256
            if i < 64 || i > 192
                img_1(i,j) = 0;
            end
            if j < 64 || j > 192
                img_1(i,j) = 0;
            end
        end
    end
    
    for i = 1 : 256
        for j = 1 : 256
            if (i >= 1 && i < 16) || (i >= 32 && i < 48) || (i >= 64 && i < 80) || (i >= 96 && i < 112) || (i >= 128 && i < 144) || (i >= 160 && i < 176) || (i >= 192 && i < 208) || (i >= 224 && i < 240)
                img_2(i,j) = 0;
            end
        end
    end
    img_sum = ones(256,256);
    img_res = img_sum;
    img_mul = img_1(:,:) * img_2(:,:);
    img_div = img_sum;
    img_and = img_1(:,:) & img_2(:,:);
    img_or = img_sum;
    img_com = not(img_1);
    
    for i = 1 : 256
        for j = 1 : 256
            img_sum(i,j) = img_1(i,j) + img_2(i,j);
            img_res(i,j) = img_1(i,j) - img_2(i,j);
            %img_mul(i,j) = img_1(i,j) * img_2(i,j);
            img_div(i,j) = img_1(i,j) / img_2(i,j);
            %img_and(i,j) = img_1(i,j) & img_2(i,j);
            img_or(i,j) = img_1(i,j) | img_2(i,j);
        end
    end
    
    figure;
    subplot(3,3,1);
    imshow(img_1);
    title('Imagen 1');
    subplot(3,3,2);
    imshow(img_2);
    title('Imagen 2');
    subplot(3,3,3);
    imshow(img_sum);
    title('Imagen sum');
    subplot(3,3,4);
    imshow(img_res);
    title('Imagen res');
    subplot(3,3,5);
    imshow(img_mul);
    title('Imagen mul');
    subplot(3,3,6);
    imshow(img_div);
    title('Imagen div');
    subplot(3,3,7);
    imshow(img_and);
    title('Imagen and');
    subplot(3,3,8);
    imshow(img_or);
    title('Imagen or');
    subplot(3,3,9);
    imshow(img_com);
    title('Imagen com');
end

%% Ejercicio 9
function Ex9 = ejer9()
    img_fract = imread('fractal.bmp');
    if size(img_fract, 3) == 3
        img_proc = rgb2gray(img_fract);
    else
        img_proc = img_fract;
    end
    img_size = size(img_proc);
    figure(9);
    planos_de_bits = zeros(img_size(1), img_size(2), 8);
    for bit = 0:7
        val_bit = 2^bit;
        for i = 1:img_size(1)
            for j = 1:img_size(2)
                pix_val = double(img_proc(i, j));
                bit_act = bitget(pix_val, bit + 1);
                planos_de_bits(i, j, bit + 1) = bit_act * val_bit;
            end
        end
        subplot(2, 4, bit + 1);
        imshow(uint8(squeeze(planos_de_bits(:,:,bit + 1))));
        title(['Bit número: ' num2str(bit)]);
    end
    img_result = sum(planos_de_bits(:,:,3:8), 3);
    img_result = uint8(img_result);
    img_result = bitset(img_result, 1, 0);
    img_result = bitset(img_result, 2, 0);
    figure(10);
    subplot(1, 2, 1);
    imshow(img_fract);
    title('Imagen Original');
    subplot(1, 2, 2);
    imshow(img_result);
    title('Imagen Resultante');
end

%% Funciones auxiliares

