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