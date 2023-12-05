%Practica 6

while true
    % Mostrar el menú de selección
    fprintf('\nMenú de Selección de Ejercicios:\n');
    fprintf('1. Filtro suavisador\n');
    fprintf('2. Filtro pasa-altas\n');
    fprintf('3. Filtro Butterworth paso-bajas\n');
    fprintf('4. Filtro Butterworth paso-altas\n');
    fprintf('5. Salir\n');

    % Leer la selección del usuario
    opcion = input('Ingrese el número del ejercicio que desea ejecutar: ');

    % Ejecutar el ejercicio seleccionado
    switch opcion
        case 1
            image = imread('boats.bmp');
            filter_size = 7;
            filter = ones(filter_size) / (filter_size^2);
            filtered_image = conv2(image, filter, 'same');
            filter_fft = fft2(filter, size(image, 1), size(image, 2));
            image_fft = fft2(filtered_image);
            image_ne = ifftshift(image_fft);
            image_new = ifft2(image_ne);

            figure;
            subplot(2, 2, 1);
            surf(log(1 + abs(fftshift(filter_fft))));
            shading interp;
            title('Espectro de Fourier del filtro 2D');
            colormap('jet');
            subplot(2, 2, 2);
            imshow(log(1 + abs(fftshift(filter_fft))));
            title('Espectro Imagen Original');
            subplot(2, 2, 3);
            surf(log(1 + abs(fftshift(image_fft))));
            shading interp;
            title('Espectro de Fourier de la imagen filtrada');
            colormap('jet');
            subplot(2, 2, 4);
            imshow(log(1 + abs(fftshift(image_fft))),[]);
            title('Espectro Imagen Filtrada');
            

            figure;
            subplot(1, 2, 1);
            imshow(image);
            title("Imagen original");
            subplot(1, 2, 2);
            imshow(uint8((image_new)));
            title("Imagen original");
            
        case 2
            image = imread('boats.bmp');
            filter_size = 7;
            filter = [0 1 0; 1 -4  1; 0 1 0];
            filtered_image = conv2(image, filter, 'same');
            filter_fft = fft2(filter, size(image, 1), size(image, 2));
            image_fft = fft2(filtered_image);
            image_ne = ifftshift(image_fft);
            image_new = ifft2(image_ne);
            

            figure;
            subplot(2, 2, 1);
            surf(log(1 + abs(fftshift(filter_fft))));
            shading interp;
            title('Espectro de Fourier del filtro 2D');
            colormap('jet');
            subplot(2, 2, 2);
            imshow(log(1 + abs(fftshift(filter_fft))));
            title('Espectro Imagen Original');
            subplot(2, 2, 3);
            surf(log(1 + abs(fftshift(image_fft))));
            shading interp;
            title('Espectro de Fourier de la imagen filtrada');
            colormap('jet');
            subplot(2, 2, 4);
            imshow(log(1 + abs(fftshift(image_fft))),[]);
            title('Espectro Imagen Filtrada');

            figure;
            subplot(1, 2, 1);
            imshow(image);
            title("Imagen original");
            subplot(1, 2, 2);
            imshow(uint8((image_new)));
            title("Imagen original");


            clear;

        case 3
            I = imread("lena.bmp");
            [m, n] = size(I);
            orden = 2; % Orden del filtro Butterworth
            D0 = 0.125;
            mm = m;
            nn = n;
            % Frecuencias normalizadas entre 0 y 0.5, positivas ((nn/2)-1) y negativas (-nn/2)
            xr = (-nn/2:(nn/2)-1) / nn;
            yr = (-mm/2:(mm/2)-1) / mm;
            [u, v] = meshgrid(xr, yr);
            D = sqrt(u.^2 + v.^2);
            butter = 1.0 ./ (1.0 + (D ./ D0).^(2*orden));
            
            M = fft2(I);
            IF = fftshift(M).*butter;
            image_ne = ifftshift(IF);
            image_new = ifft2(image_ne);

            figure;
            subplot(2,2,1);
            imshow(butter);
            title('Espectro del filtro Butterworth pasa-bajas');
            subplot(2,2,2);
            mesh(abs(butter));
            title('Espectro del filtro Butterworth pasa-bajas (3D)');
            subplot(2,2,3);
            imshow(uint8(abs(IF)),[]);
            title('Espectro del filtro Butterworth pasa-bajas');
            subplot(2,2,4);
            mesh(log(1+abs(IF)));
            title('Espectro del filtro Butterworth pasa-bajas (3D)');
            
            figure;
            subplot(1,2,1);
            imshow(I);
            title("Imagen Original")
            subplot(1,2,2);
            imshow(uint8(image_new));
            title("Imagen Modificada")
            % Guardar la imagen filtrada
            % imwrite(uint8(filtered_image), 'LENA_Filtrada.bmp');

            clear;
        case 4
            I = imread("lena.bmp");
            [m, n] = size(I);
            orden = 2; % Orden del filtro Butterworth
            D0 = 0.125;
            mm = m;
            nn = n;
            % Frecuencias normalizadas entre 0 y 0.5, positivas ((nn/2)-1) y negativas (-nn/2)
            xr = (-nn/2:(nn/2)-1) / nn;
            yr = (-mm/2:(mm/2)-1) / mm;
            [u, v] = meshgrid(xr, yr);
            D = sqrt(u.^2 + v.^2);
            butter = 1.0 ./ (1.0 + (D0 ./ D).^(2*orden));

            M = fft2(I);
            IF = fftshift(M).*butter;
            image_ne = ifftshift(IF);
            image_new = ifft2(image_ne);

            figure;
            subplot(2,2,1);
            imshow(butter);
            title('Espectro del filtro Butterworth pasa-bajas');
            subplot(2,2,2);
            mesh(abs(butter));
            title('Espectro del filtro Butterworth pasa-bajas (3D)');
            subplot(2,2,3);
            imshow(abs(IF),[]);
            title('Espectro del filtro Butterworth pasa-bajas');
            subplot(2,2,4);
            mesh(abs(IF));
            title('Espectro del filtro Butterworth pasa-bajas (3D)');
            
            
            figure;
            subplot(1,2,1);
            imshow(I);
            title("Imagen Original")
            subplot(1,2,2);
            imshow(uint8(image_new));
            title("Imagen Modificada")

            clear ;

        case 5
            % Salir del programa
            fprintf('Saliendo del programa. ¡Hasta luego!\n');
            break;

        otherwise
            fprintf('Opción no válida. Por favor, elija una opción válida.\n');
    end
end