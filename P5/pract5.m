% Práctica 5
% Flores Avalos Rodrigo Emmanuel

%% Inicialización de variables
opcion = 0;

% Bucle para mostrar el menú de selección hasta que el usuario elija salir
while opcion ~= 10
    % Mostrar el menú
    %clc
    disp('Menú de selección:');
    disp('1. Filtro promedio'); %Y
    disp('2. Filtro Gaussiano');%Y
    disp('3. Emborronamiento de imagenes');
    disp('4. Máscara Unsharp'); %Y
    disp('5. Aclaramiento laplaciano'); %Y
    disp('6. Gradiente para aclaración de imágenes');%Y
    disp('7. Filtrado no lineal');%Y

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
        % case 8
        %     disp('Ejecutando Ejercicio 8');
        %     ejer8();
        % case 9
        %     disp('Ejecutando Ejercicio 9');
        %     ejer9();
        case 10
            disp('Chauchau diria el peso pluma');
        
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
% Define un filtro promediotipo bloque (normalizado) de 3x3, 5x5, 7x7y 11x11 elementos. 
% 2.-Agrega ruido del tipo Gaussiano (M=0, σ2=0.02) a la imagen LENA.BMP(https://la.mathworks.com/help/images/ref/imnoise.html) 
% 3.-Realiza la operación de convolucióncon las imágenes sin ruido y con ruido respectivamente usando cada filtro hpromedio(usa el comando conv2y la opción  same ) 
% 4.-Visualiza las imágenes resultantes.
function Ex1 = ejer1()
    bloq3 = ones(3, 3) / 9; bloq5 = ones(5, 5) / 25; 
    bloq7 = ones(7, 7) / 49; bloq11 = ones(11, 11) / 121;
    img_lena = imread('LENA.BMP');
    m = 0; var = 0.02;
    img_lena_blur = imnoise(img_lena, "gaussian", m, var);
    
    imagen_conv_3x3 = uint8(conv2(img_lena, bloq3, 'same'));
    imagen_conv_5x5 = uint8(conv2(img_lena, bloq5, 'same'));
    imagen_conv_7x7 = uint8(conv2(img_lena, bloq7, 'same'));
    imagen_conv_11x11 = uint8(conv2(img_lena, bloq11, 'same'));

    imagen_conv_3x3_b = uint8(conv2(img_lena_blur, bloq3, 'same'));
    imagen_conv_5x5_b = uint8(conv2(img_lena_blur, bloq5, 'same'));
    imagen_conv_7x7_b = uint8(conv2(img_lena_blur, bloq7, 'same'));
    imagen_conv_11x11_b = uint8(conv2(img_lena_blur, bloq11, 'same'));

    figure(1);
    subplot(2,5,1);
    imshow(img_lena);
    title('Imagen original');
    subplot(2,5,2);
    imshow(imagen_conv_3x3);
    title('Convolución 3x3');
    subplot(2,5,3);
    imshow(imagen_conv_5x5);
    title('Convolución 5x5');
    subplot(2,5,4);
    imshow(imagen_conv_7x7);
    title('Convolución 7x7');
    subplot(2,5,5);
    imshow(imagen_conv_11x11);
    title('Convolución 11x11');
    subplot(2,5,6);
    imshow(img_lena_blur);
    title('Imagen con ruido gaussiano');
    subplot(2,5,7);
    imshow(imagen_conv_3x3_b);
    title('Convolución 3x3');
    subplot(2,5,8);
    imshow(imagen_conv_5x5_b);
    title('Convolución 5x5');
    subplot(2,5,9);
    imshow(imagen_conv_7x7_b);
    title('Convolución 7x7');
    subplot(2,5,10);
    imshow(imagen_conv_11x11_b);
    title('Convolución 11x11');
end

%% Ejercicio 2
function Ex2 = ejer2()
    hG3 = fspecial('gaussian', [3 3], 0.5);
    hG5 = fspecial('gaussian', [5 5], 1);
    hG7 = fspecial('gaussian', [7 7], 1.5);
    hG11 = fspecial('gaussian', [11 11], 2);
    
    imagen = imread('LENA.BMP');
    ruido = 0.02 * randn(size(imagen));
    imagen_con_ruido = double(imagen) + ruido;
    
    imagen_sin_ruido_conv_G3 = conv2(imagen, hG3, 'same');
    imagen_con_ruido_conv_G3 = conv2(imagen_con_ruido, hG3, 'same');
    
    imagen_sin_ruido_conv_G5 = conv2(imagen, hG5, 'same');
    imagen_con_ruido_conv_G5 = conv2(imagen_con_ruido, hG5, 'same');
    
    imagen_sin_ruido_conv_G7 = conv2(imagen, hG7, 'same');
    imagen_con_ruido_conv_G7 = conv2(imagen_con_ruido, hG7, 'same');
    
    imagen_sin_ruido_conv_G11 = conv2(imagen, hG11, 'same');
    imagen_con_ruido_conv_G11 = conv2(imagen_con_ruido, hG11, 'same');
    
    figure;
    subplot(2, 4, 1); imshow(imagen); title('Imagen Original');
    subplot(2, 4, 2); imshow(imagen_con_ruido, []); title('Imagen con Ruido');
    subplot(2, 4, 3); imshow(imagen_sin_ruido_conv_G3, []); title('Sin Ruido - Filtro 3x3');
    subplot(2, 4, 4); imshow(imagen_con_ruido_conv_G3, []); title('Con Ruido - Filtro 3x3');
    subplot(2, 4, 5); imshow(imagen_sin_ruido_conv_G5, []); title('Sin Ruido - Filtro 5x5');
    subplot(2, 4, 6); imshow(imagen_con_ruido_conv_G5, []); title('Con Ruido - Filtro 5x5');
    subplot(2, 4, 7); imshow(imagen_sin_ruido_conv_G7, []); title('Sin Ruido - Filtro 7x7');
    subplot(2, 4, 8); imshow(imagen_con_ruido_conv_G7, []); title('Con Ruido - Filtro 7x7');
end

%% Ejercicio 3
function Ex3 = ejer3()
    imagen = imread('blur.jpeg');
    
    inicio_x_1 = 1;
    fin_x_1 = 400;
    inicio_y_1 = 1;
    fin_y_1 = 480;
    
    mascara1 = zeros(size(imagen, 1), size(imagen, 2));
    mascara1(inicio_y_1:fin_y_1, inicio_x_1:fin_x_1) = 1;
    
    filtro_desenfoque1 = fspecial('gaussian', [15, 15], 5);
    
    imagen_desenfocada1 = imagen;
    for canal = 1:size(imagen, 3)
        canal_actual = imagen(:, :, canal);
        canal_desenfocado1 = imfilter(canal_actual, filtro_desenfoque1);
        imagen_desenfocada1(:, :, canal) = uint8((1 - mascara1) .* double(canal_actual) + mascara1 .* double(canal_desenfocado1));
    end
    
    inicio_x_2 = 600;
    fin_x_2 = 845;
    inicio_y_2 = 1;
    fin_y_2 = 480;
    
    mascara2 = zeros(size(imagen, 1), size(imagen, 2));
    mascara2(inicio_y_2:fin_y_2, inicio_x_2:fin_x_2) = 1;
    
    filtro_desenfoque2 = fspecial('gaussian', [15, 15], 3); % Puedes ajustar el tamaño y la desviación estándar según tus necesidades
    
    imagen_desenfocada2 = imagen_desenfocada1;
    for canal = 1:size(imagen, 3)
        canal_actual = imagen_desenfocada1(:, :, canal);
        canal_desenfocado2 = imfilter(canal_actual, filtro_desenfoque2);
        imagen_desenfocada2(:, :, canal) = uint8((1 - mascara2) .* double(canal_actual) + mascara2 .* double(canal_desenfocado2));
    end
    
    figure;
    subplot(1, 2, 1);
    imshow(imagen);
    title('Imagen Original');
    subplot(1, 2, 2);
    imshow(imagen_desenfocada2);
    title('Desenfoque');
end

%% Ejercicio 4
% 1.- Leer la imagen “boatsc.bmp”
% 2.- Difuminar la imagen del punto anterior usando un filtro pasó bajas (box filter) de ventana 5x5.
% 3.- Obtener 4 imágenes con mejoramiento de nitidez haciendo uso del proceso unsharp masking “high-boost” 
% con los siguientes tipos de filtro pasa bajas:
% a) Filtro paso bajas de bloque con tamaño de ventana 3x3 y 7x7.
% b) Filtro paso bajas binomial (orden 0) de ventana 3x3 y 7x7.

function Ex4 = ejer4()
    imagen = imread('boatsc.bmp');
    
    % Filtro paso bajo de bloque 3x3
    kernel_block_3x3 = ones(3) / 9;  
    imagen_block_3x3 = imfilter(imagen, kernel_block_3x3);
    
    % Filtro paso bajo de bloque 7x7
    kernel_block_7x7 = ones(7) / 49; 
    imagen_block_7x7 = imfilter(imagen, kernel_block_7x7);
    
    % Filtro paso bajo binomial (orden 0) 3x3
    kernel_binomial_3x3 = [1 2 1; 2 4 2; 1 2 1] / 16; 
    imagen_binomial_3x3 = imfilter(imagen, kernel_binomial_3x3);
    
    % Filtro paso bajo binomial (orden 0) 7x7
    kernel_binomial_7x7 = conv2(kernel_binomial_3x3, kernel_binomial_3x3);
    imagen_binomial_7x7 = imfilter(imagen, kernel_binomial_7x7);
    
    % Unsharp masking (high-boost) para cada imagen filtrada
    K = 1.5;
    
    imagen_sharp_block_3x3 = imagen + K * (imagen - imagen_block_3x3);
    imagen_sharp_block_7x7 = imagen + K * (imagen - imagen_block_7x7);
    imagen_sharp_binomial_3x3 = imagen + K * (imagen - imagen_binomial_3x3);
    imagen_sharp_binomial_7x7 = imagen + K * (imagen - imagen_binomial_7x7);
    
    figure(4);
    subplot(2, 3, 1);
    imshow(imagen), title('Imagen Original');
    subplot(2, 3, 2);
    imshow(imagen_sharp_block_3x3), title('Block 3x3 High-Boost');
    subplot(2, 3, 3);
    imshow(imagen_sharp_block_7x7), title('Block 7x7 High-Boost');
    subplot(2, 3, 5);
    imshow(imagen_sharp_binomial_3x3), title('Binomial 3x3 High-Boost');
    subplot(2, 3, 6);
    imshow(imagen_sharp_binomial_7x7), title('Binomial 7x7 High-Boost');
end

%% Ejercicio 5
% 

function Ex5 = ejer5()
    imagen = imread('lenac.bmp'); 
    imagen_gris = rgb2gray(imagen); 
    
    filtro_emborronar = fspecial('average', [5 5]);
    imagen_emborronada = imfilter(imagen_gris, filtro_emborronar);
    
    laplaciano_A = [0,1,0;1,-4,1;0,1,0];
    laplaciano_C = [1,1,1,1,-8,1,1,1,1];
    
    imagen_aclarada_A = imfilter(imagen_gris, laplaciano_A);
    imagen_aclarada_C = imfilter(imagen_gris, reshape(laplaciano_C, [3 3]));
    
    figure;
    subplot(2, 2, 1);
    imshow(imagen_gris);
    title('Original');
    subplot(2, 2, 2);
    imshow(imagen_emborronada);
    title('Emborronada');
    subplot(2, 2, 3);
    imshow(imagen_aclarada_A);
    title('Operación con Laplaciano A');
    subplot(2, 2, 4);
    imshow(imagen_aclarada_C);
    title('Operación con Laplaciano C');
    
    figure;
    subplot(2,3,1);
    imshow(uint8(imagen_emborronada-(0.3*imagen_aclarada_A)));
    title('Aclaración con Laplaciano A 0.3');
    subplot(2,3,2);
    imshow(uint8(imagen_emborronada-(0.5*imagen_aclarada_A)));
    title('Aclaración con Laplaciano A 0.5');
    subplot(2,3,3);
    imshow(uint8(imagen_emborronada-(0.7*imagen_aclarada_A)));
    title('Aclaración con Laplaciano A 0.7');
    subplot(2,3,4);
    imshow(uint8(imagen_emborronada-(0.3*imagen_aclarada_C)));
    title('Aclaración con Laplaciano C 0.3');
    subplot(2,3,5);
    imshow(uint8(imagen_emborronada-(0.5*imagen_aclarada_C)));
    title('Aclaración con Laplaciano C 0.5');
    subplot(2,3,6);
    imshow(uint8(imagen_emborronada-(0.7*imagen_aclarada_C)));
    title('Aclaración con Laplaciano C 0.7');
end

%% Ejercicio 6
% 

function Ex6 = ejer6()
    imagen = imread('airplanef16c.bmp');
    imagen = rgb2gray(imagen);
    
    filtro_pasabajas = fspecial('average', [5 5]);
    imagen_emborronada = imfilter(imagen, filtro_pasabajas);
    
    operador_gradiente_x = [-1, 0; 1, 0];
    operador_gradiente_y = [-1, 1; 0, 0];
    gradiente_x = conv2(imagen_emborronada, operador_gradiente_x, 'same');
    gradiente_y = conv2(imagen_emborronada, operador_gradiente_y, 'same');
    gradiente_total = gradiente_x + gradiente_y;
    
    operador_robert_x = [-1, 0; 0, 1];
    operador_robert_y = [0, -1; 1, 0];
    robert_x = conv2(imagen_emborronada, operador_robert_x, 'same');
    robert_y = conv2(imagen_emborronada, operador_robert_y, 'same');
    robert_total = robert_x + robert_y;
    
    operador_sobel_x = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
    operador_sobel_y = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
    sobel_x = conv2(imagen_emborronada, operador_sobel_x, 'same');
    sobel_y = conv2(imagen_emborronada, operador_sobel_y, 'same');
    sobel_total = sobel_x + sobel_y;
    
    K = 0.5;
    imagen_normal = uint8(double(imagen_emborronada) + (K * gradiente_total));
    imagen_robert = uint8(double(imagen_emborronada) + (K * robert_total));
    imagen_sobel = uint8(double(imagen_emborronada) + (K * sobel_total));
    
    figure;
    subplot(2, 3, 1), imshow(imagen), title('Imagen Original');
    subplot(2, 3, 2), imshow(imagen_emborronada), title('Imagen Emborronada');
    subplot(2, 3, 4), imshow(imagen_normal), title('Gradiente normal');
    subplot(2, 3, 5), imshow(imagen_robert), title('Gradiente robert');
    subplot(2, 3, 6), imshow(imagen_sobel), title('Gradiente sobel');

end


%% Ejercicio 7
% 

function Ex7 = ejer7()
    imagen = imread('airplanef16.bmp');
    imagen_con_ruido = imnoise(imagen, 'salt & pepper', 0.1);
    filtro_3x3 = medfilt2(imagen_con_ruido, [3, 3]);
    filtro_5x5 = medfilt2(imagen_con_ruido, [5, 5]);
    filtro_7x7 = medfilt2(imagen_con_ruido, [7, 7]);
    
    figure(7);
    subplot(2, 3, 1), imshow(imagen), title('Imagen Original');
    subplot(2, 3, 4), imshow(imagen_con_ruido), title('Imagen con Ruido');
    subplot(2, 3, 2), imshow(filtro_3x3), title('Filtro Mediana 3x3');
    subplot(2, 3, 3), imshow(filtro_5x5), title('Filtro Mediana 5x5');
    subplot(2, 3, 5), imshow(filtro_7x7), title('Filtro Mediana 7x7');
end