while true
    fprintf('\nMenú de Selección de Ejercicios:\n');
    fprintf('1. Ejercicio 1\n');
    fprintf('2. Ejercicio 2\n');
    fprintf('3. Ejercicio 3\n');
    fprintf('4. Ejercicio 4\n');
    fprintf('5. Ejercicio 5\n');
    fprintf('6. Ejercicio 6\n');
    fprintf('7. Ejercicio 7\n');
    fprintf('8. Ejercicio 8\n');
    fprintf('9. Ejercicio 9\n');
    fprintf('10. Ejercicio 10\n');
    fprintf('11. Ejercicio 11\n');
    fprintf('12. Salir\n');

    opcion = input('Ingrese el número del ejercicio que desea ejecutar: ');

    switch opcion
        case 1
            image_case_1 = imread('magrisuave.jpg');
            figure;
            subplot(1, 2, 1);
            imshow(image_case_1);
            title('Imagen Original');
            histograma = imhist(image_case_1);
            subplot(1, 2, 2);
            bar(histograma);
            xlabel('Niveles de intensidad');
            ylabel('Frecuencia');
            title('Histograma de la Imagen');
            ylim([0, max(histograma)]);
            min_out = 0;
            max_out = 100;
            imagen_ampliada = ampliarContraste(image_case_1, min_out, max_out);
            figure;
            subplot(1, 2, 1);
            imshow(image_case_1);
            title('Imagen original');
            subplot(1, 2, 2);
            imshow(imagen_ampliada);
            title('Imagen ampliación del contraste 1');
            clear all

        case 2
            image_case_2 = imread('magrisuave.jpg');
            figure;
            subplot(1, 2, 1);
            imshow(image_case_2);
            title('Imagen Original');
            histograma = imhist(image_case_2);
            subplot(1, 2, 2);
            bar(histograma);
            xlabel('Niveles de intensidad');
            ylabel('Frecuencia');
            title('Histograma de la Imagen');
            ylim([0, max(histograma)]);
            a = (255/173);
            [filas,columnas] = size(image_case_2);
            for i=1:filas
                for j=1:columnas
                    if(image_case_2(i,j)<=173)
                        image_res(i,j) = uint8(a*image_case_2(i,j));
                    else
                        image_res(i,j) = 255;
                    end
                end
            end
            figure;
            subplot(1, 2, 1);
            imshow(image_case_2);
            title('Imagen Original');
            subplot(1,2,2);
            imshow(image_res);
            title('Imagen ampliación del contraste 2');
            clear all

        case 3
            image_case_3 = imread('NB.bmp');
            figure;
            subplot(1, 2, 1);
            imshow(image_case_3);
            title('Imagen Original');
            histograma = imhist(image_case_3);
            subplot(1, 2, 2);
            bar(histograma);
            xlabel('Niveles de intensidad');
            ylabel('Frecuencia');
            title('Histograma de la Imagen');
            ylim([0, max(histograma)]);
            a = 0.5;
            c = 0.8627;
            image = mat2gray(image_case_3);
            [filas,columnas] = size(image);
            for i=1:filas
                for j=1:columnas
                    if( (image(i,j) >= 0) && (image(i,j) <= c))
                        image_res(i,j) = image(i,j)*a;
                    elseif( (image(i,j) > c) && (image(i,j) <= 1))
                        image_res(i,j) = (((1-(a*c))/(1-c))*(image(i,j)-c))+(a*c);
                    end
                end
            end
            figure;
            subplot(1, 2, 1);
            imshow(image_case_3);
            title('Imagen Original');
            subplot(1, 2, 2);
            imshow(image_res);
            title('Imagen ampliación del contraste 3');
            clear all

        case 4
            img_5 = imread("globulosRGB.jpg");
            if size(img_5, 3) == 3
                imagen_b = rgb2gray(img_5);
            end
            subplot(1, 2, 1);
            imshow(imagen_b);
            title("Imagen escala de grises");
            histograma = imhist(imagen_b);
            subplot(1, 2, 2);
            bar(histograma);
            xlabel('Niveles de intensidad');
            ylabel('Frecuencia');
            title('Histograma de la Imagen');
            ylim([0, max(histograma)]);
            [filas, columnas] = size(imagen_b);
            imag_binarizada = zeros(filas,columnas);
            for i = 1:filas
                for j = 1:columnas
                    if imagen_b(i,j) > 148
                        imag_binarizada(i,j) = 1;
                    else
                        imag_binarizada(i,j) = 0;
                    end
                end
            end
            figure;
            subplot(1,2,1);
            imshow(imagen_b);
            title("Imagen escala de grises");
            subplot(1,2,2);
            imshow(imag_binarizada);
            title("Imagen Binarizada");
            clear all

        case 5
            image_case_5 = imread('angibrain.gif');
            figure;
            subplot(1, 2, 1);
            imshow(image_case_5);
            title('Imagen Original');
            histograma = imhist(image_case_5);
            subplot(1, 2, 2);
            bar(histograma);
            xlabel('Niveles de intensidad');
            ylabel('Frecuencia');
            title('Histograma de la Imagen');
            ylim([0, max(histograma)]);
            imagen_negativa = 255 - image_case_5;
            figure;
            subplot(1, 2, 1);
            imshow(image_case_5);
            title('Imagen Original');
            subplot(1, 2, 2);
            imshow(imagen_negativa);
            title('Imagen Negativa');
            clear all

        case 6
            imagen_original = imread('Lena.bmp');
            gamma = 0.5;
            [filas, columnas] = size(imagen_original);
            imagen_corregida = uint8(zeros(filas, columnas));
            for i = 1:filas
                for j = 1:columnas
                    valor_corregido = imagen_original(i, j).^gamma;
                    valor_corregido = min(max(valor_corregido, 0), 255);
                    imagen_corregida(i, j) = valor_corregido;
                end
            end
            subplot(1, 2, 1);
            imshow(imagen_original);
            title('Imagen Original');
            subplot(1, 2, 2);
            imshow(imagen_corregida);
            title('Imagen Corregida');
            clear all

        case 7
            image_case_7 = imread("neuronarat.jpg");
            figure;
            subplot(1,2,1);
            imshow(image_case_7);
            title("Imagen original");
            histograma = imhist(image_case_7);
            subplot(1, 2, 2);
            bar(histograma);
            xlabel('Niveles de intensidad');
            ylabel('Frecuencia');
            title('Histograma de la Imagen');
            ylim([0, max(histograma)]);
            [filas, columnas] = size(image_case_7);
            imagen_transformada = uint8(zeros(filas,columnas));
            for i = 1:filas
                for j = 1:columnas
                    imagen_transformada(i,j) = 16 * log(double(image_case_7(i,j)) + 1);
                end
            end
            figure;
            subplot(1, 2, 1);
            imshow(image_case_7);
            title('Imagen Original');
            subplot(1, 2, 2);
            imshow(imagen_transformada);
            title("Transformacion log");
            clear all

        case 8
            width = 256;
            height = 256;
            imagen = zeros(height, width);
            squareSize = 120;
            x1 = (width - squareSize) / 2 + 1;
            y1 = (height - squareSize) / 2 + 1;
            x2 = x1 + squareSize - 1;
            y2 = y1 + squareSize - 1;
            imagen(y1:y2, x1:x2) = 255;
            imagen_2 = zeros(height, width);
            lineSpacing = 10;
            whiteLineWidth = 10;
            lineColor = 255;
            isWhiteLine = false;
            for y = 1:lineSpacing:height
                if isWhiteLine
                    imagen_2(y:y + whiteLineWidth - 1, :) = lineColor;
                end
                isWhiteLine = ~isWhiteLine;
            end
            imagen_2 = imresize(imagen_2, [height, width]);
            resultado_suma = imagen_2 + imagen;
            resultado_res = imagen_2 - imagen;
            resultado_mul = imagen_2 .* imagen;
            resultado_div = imagen_2 ./ imagen;
            resultado_and = imagen_2 & imagen;
            resultado_or = imagen_2 | imagen;
            resultado_com = ~imagen;
            figure;
            subplot(3,3,1);
            imshow(imagen, [0, 255]);
            title('Imagen Cuadrada ');
            subplot(3,3,2);
            imshow(imagen_2, [0, 255]);
            title('Imagen con líneas');
            subplot(3, 3, 3);
            imshow(resultado_suma, [0, 255]);
            title('Suma');
            subplot(3, 3, 4);
            imshow(resultado_res, [0, 255]);
            title('Resta');
            subplot(3, 3, 5);
            imshow(resultado_mul, [0, 255]);
            title('Multiplicación');
            subplot(3, 3, 6);
            imshow(resultado_div, [0, 255]);
            title('División');
            subplot(3, 3, 7);
            imshow(resultado_and, [0, 1]);
            title('AND');
            subplot(3, 3, 8);
            imshow(resultado_or, [0, 1]);
            title('OR');
            subplot(3, 3, 9);
            imshow(resultado_com, [0, 1]);
            title('Complemento');
            clear all
        case 9
            imagen_original = imread('fractal.bmp');
            if size(imagen_original, 3) == 3
                imagen = rgb2gray(imagen_original);
            else
                imagen = imagen_original;
            end
            [filas, columnas] = size(imagen);
            figure;
            planos_de_bits = zeros(filas, columnas, 8);
            for bit = 0:7
                valor_bit = 2^bit;
                for i = 1:filas
                    for j = 1:columnas
                        pixel_valor = double(imagen(i, j));
                        bit_actual = bitget(pixel_valor, bit + 1);
                        planos_de_bits(i, j, bit + 1) = bit_actual * valor_bit;
                    end
                end
                subplot(2, 4, bit + 1);
                imshow(uint8(squeeze(planos_de_bits(:,:,bit + 1))));
                title(['Bit ' num2str(bit)]);
            end
            nueva_imagen = sum(planos_de_bits(:,:,3:8), 3);
            nueva_imagen = uint8(nueva_imagen);
            nueva_imagen = bitset(nueva_imagen, 1, 0);
            nueva_imagen = bitset(nueva_imagen, 2, 0);
            figure;
            subplot(1, 2, 1);
            imshow(imagen_original);
            title('Imagen Original');
            subplot(1, 2, 2);
            imshow(nueva_imagen);
            title('Nueva Imagen');
            clear all
        case 10
            fprintf('Saliendo del programa. ¡Hasta luego!\n');
            break;

        otherwise
            fprintf('Opción no válida. Por favor, elija una opción válida.\n');
    end
end

function imagen_transformada = ampliarContraste(imagen, a, b)
if size(imagen, 3) == 3
    imagen = rgb2gray(imagen);
end
m = 255 / (a - b);
c = m * (-b) + 255;
imagen_transformada = m * double(imagen) + c;
imagen_transformada(imagen_transformada < 0) = 255;
imagen_transformada(imagen_transformada > 255) = 0;
imagen_transformada = uint8(imagen_transformada);
end