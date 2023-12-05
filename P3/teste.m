%% tests

    img_lena = imread("Lena.bmp");
    img_lena_db = double(img_lena);
    img_size = size(img_lena_db);
    img_gamma = ones(img_size);
    for i = 1 : img_size(1)
        for j = 1 : img_size(2)
            value = img_lena_db(i,j);
            img_gamma(i,j) = value^(1/0.5);
        end
    end
    figure(6);
    subplot(1,2,1);
    imshow(img_lena);
    subplot(1,2,2);
    img_gamma = double(img_gamma);
    imshow(img_gamma);



% img_corte = imread('magrisuave.jpg');
%     img_corte = double(img_corte);
%     img_min = min(min(img_corte));
%     img_max = max(max(img_corte));
%     m = 254 / (img_max-img_min);
%     img_size = size(img_corte);
%     img_result = zeros(img_size);
%     for i = 1 : img_size(1)
%         for j = 1 : img_size(2)
%             value = img_corte(i,j);
%             if value < 173
%                 img_result(i,j) = 255;
%             elseif value >= 173
%                 img_result(i,j) = round((1.4739884393063583815028901734104*(value-173))+255);
%             end
%         end
%     end
%     figure(1);
%     subplot(2,2,1);
%     img_corte = uint8(img_corte);
%     imshow(img_corte);
%     title('Imagen');
%     subplot(2,2,2);
%     img_hist = imhist(img_corte);
%     bar(img_hist);
%     title('Histograma');
%     xlabel('Valor del píxel');
%     ylabel('Frecuencia');
%     subplot(2,2,3);
%     %img_result = uint8(img_result);
%     imshow(img_result);
%     title('Imagen resultante');
%     subplot(2,2,4);
%     img_result_hist = imhist(img_result);
%     bar(img_result_hist);
%     title('Histograma');
%     xlabel('Valor del píxel');
%     ylabel('Frecuencia');