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
        % case 5
        %     disp('Ejecutando Ejercicio 5');
        %     ejer5();
        % case 6
        %     disp('Ejecutando Ejercicio 6');
        %     ejer6();
        % case 7
        %     disp('Ejecutando Ejercicio 7');
        %     ejer7();
        % case 8
        %     disp('Ejecutando Ejercicio 8');
        %     ejer8();
        % case 9
        %     disp('Ejecutando Ejercicio 9');
        %     ejer9();
        case 5
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
    img_lena = imread('lena.bmp');
    img_lena_hist = imhist(img_lena);
    
    [img_lena_histeq, img_lena_histeq_hist] = histeq(img_lena, 256);
    %img_lena_histeq_hist = imhist(img_lena_histeq);
    
    img_lena_funcion = cumsum(img_lena_hist) ./ numel(img_lena);
    b = uint8(255 * img_lena_funcion(img_lena +1));
    img_lena_transf = uint8(double(max(img_lena(:))-min(img_lena(:))).* img_lena_funcion + double(min(img_lena(:))));
    img_lena_transf_hist = imhist(img_lena_transf);
    
    figure(1);
    subplot(3,2,1);
    imshow(img_lena);
    title('Imagen Original');
    subplot(3,2,2);
    bar(img_lena_hist);
    title('Histograma Original');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    
    subplot(3,2,3);
    imshow(img_lena_histeq);
    title('Imagen Histeq');
    subplot(3,2,4);
    imhist(img_lena_histeq_hist);
    title('Histograma histeq');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    
    subplot(3,2,5);
    imshow(b);
    title('Imagen Transferencia');
    subplot(3,2,6);
    bar(img_lena_transf_hist);
    title('Histograma histeq');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 2
function Ex2 = ejer2()
    img_lena = imread("lena.jpg");
    img_lena_r = img_lena(:,:,1);
    img_lena_g = img_lena(:,:,2);
    img_lena_b = img_lena(:,:,3);
    
    img_lena_r_his = imhist(img_lena_r);
    img_lena_g_his = imhist(img_lena_g);
    img_lena_b_his = imhist(img_lena_b);

    [img_lena_r_eq, img_lena_r_eq_his] = histeq(img_lena_r);
    [img_lena_g_eq, img_lena_g_eq_his] = histeq(img_lena_g);
    [img_lena_b_eq, img_lena_b_eq_his] = histeq(img_lena_b);

    img_lena_equalized = zeros([512, 512, 3]);
    img_lena_equalized(:,:,1) = img_lena_r_eq;
    img_lena_equalized(:,:,2) = img_lena_g_eq;
    img_lena_equalized(:,:,3) = img_lena_b_eq;

    figure(2);
    subplot(2,2,1);
    imshow(img_lena);
    title('Imagen Original');
    subplot(2,2,2);
    hold on;
    bar(img_lena_g_his, 'green');
    bar(img_lena_b_his, 'blue');
    bar(img_lena_r_his, 'red');
    hold off;
    title('Histograma de la imágen');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,2,3);
    imshow(uint8(img_lena_equalized));
    title('Imagen ecualizada con histeq');
    subplot(2,2,4);
    hold on;
    bar(img_lena_g_eq_his, 'green');
    bar(img_lena_b_eq_his, 'blue');
    bar(img_lena_r_eq_his, 'red');
    hold off;
    title('Histograma de la imágen ecualizada con histeq');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end

%% Ejercicio 3
% 1. Realiza la conversión RGB a YCbCrde la imagen "lena.jpg" y muestra en
% escala de grises la componente de intensidad. Use la función rgb2ycbcr.
% 2.Ecualiza  la  componente  de  luminancia (componente  1) en  el  modelo 
% YCbCrde  la  imagen  mostrando  en una escala de niveles de gris la componente resultante.
% 3.  Realiza  la  conversión  YCbCra  RGB (usa  la  función  ycbcr2rgb) de 
% la  imagencon  la  componente  de luminancia ecualizada y muestra la imagen
% RGB resultante.

function Ex3 = ejer3()
    img_lena = imread("lena.jpg");
    img_lena_r = img_lena(:,:,1);
    img_lena_g = img_lena(:,:,1);
    img_lena_b = img_lena(:,:,1);

    img_lena_ycbcr = rgb2ycbcr(img_lena);

    img_lena_ycbcr_y = img_lena_ycbcr(:,:,1);
    img_lena_ycbcr_cb = img_lena_ycbcr(:,:,2);
    img_lena_ycbcr_cr = img_lena_ycbcr(:,:,3);

    img_lena_hist = imhist(img_lena_ycbcr_y);

    img_lena_func = cumsum(img_lena_hist) ./ numel(img_lena_ycbcr_y);
    B = uint8(255 * img_lena_func(img_lena_ycbcr_y +1));
    img_lena_transf = uint8(double(max(img_lena_ycbcr_y(:))-min(img_lena_ycbcr_y(:))).* img_lena_func + double(min(img_lena_ycbcr_y(:))));
    img_lena_transf_hist = imhist(img_lena_transf);

    img_result = zeros([512, 512, 3]);
    img_result(:,:,1) = B;
    img_result(:,:,2) = img_lena_ycbcr_cb;
    img_result(:,:,3) = img_lena_ycbcr_cr;

    img_result_rgb = ycbcr2rgb(img_result);

    img_result_rgb_r = img_result_rgb(:,:,1);
    img_result_rgb_g = img_result_rgb(:,:,2);
    img_result_rgb_b = img_result_rgb(:,:,3);

    figure(3);
    subplot(2,4,1);
    imshow(img_lena_ycbcr_y);
    title('Imagen Lena gray');
    subplot(2,4,2);
    bar(img_lena_hist);
    title('Histograma de la imágen Lena gray');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,4,3);
    imshow(B);
    title('Imagen Lena gray ecualizada');
    subplot(2,4,4);
    bar(img_lena_transf_hist);
    title('Histograma de la imágen Lena gray ecualizada');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,4,5);
    imshow(img_lena);
    title('Imagen Lena original');
    subplot(2,4,6);
    hold on;
    bar(imhist(img_lena_r), 'red');
    bar(imhist(img_lena_g), 'green');
    bar(imhist(img_lena_b), 'blue');
    hold off;
    title('Histograma de la imágen Lena original RGB');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
    subplot(2,4,7);
    imshow(img_result_rgb);
    title('Imagen lena después de la ecualización');
    subplot(2,4,8);
    hold on;
    bar(imhist(img_result_rgb_r), 'red');
    bar(imhist(img_result_rgb_g), 'green');
    bar(imhist(img_result_rgb_b), 'blue');
    hold off;
    title('Histograma de la imágen Lena ecualizada RGB');
    xlabel('Valor del píxel');
    ylabel('Frecuencia');
end


