% Instituto Politecnico Nacional, SEPI ESIME Culhuacan (c) 2020
% Asesor: Dr. Manuel Cedillo Hernández 


%% Prueba de concepto del esquema 
close all; clc; clear;

%% Rutas de archivos y funciones
functionname = 'main.m'; % Crea una variable con el nombre de este archivo
functiondir = which(functionname); % establece la ruta de este archivo
functiondir = functiondir(1:end-length(functionname)); % le quita functionname

% Se agregan funciones e imágenes al workspace
% funciona como import en python, entonces haríamos varias funciones
addpath([functiondir 'Img'])
addpath([functiondir 'ImgCif'])
addpath([functiondir 'CifradoAES'])
addpath([functiondir 'LSB'])

%% Data Owner
% Entidad que posee la imagen y genera el medio cifrado
Iname = '6.bmp'; % seleccionar conforme a la carpeta Img
% obtiene el nombre y extensión de la imagen
Io = imresize(imread(Iname),[480 640]);% imagen original
% con imread(Iname) obtiene la información de la imagen
% con imresize() se reescala la imagen a un tamaño predeterminado de
% 480x640 px, (recibe la imagen y la escala el método y las opciones de 
% conversión), se guarda en Io (no se puede ver en el entorno)
figure(), imshow(Io); title('Imagen original');% Despliega la imagen 
% original en una ventana

%% Conversion de RGB a YCbCr
J = rgb2ycbcr(Io); % obtiene la info de color en la imagen y lo transforma 
% a un esquema de luminancia y chrominancia
figure(), imshow(J); title('Imagen YCbCr') % muestra la imagen en YCbCr 
% para poder empezar la conversión
% la imagen se guarda en un arreglo tridimensional de 480x640x3
I = J(:,:,1); % Imagen a proteger y que llevará oculta la información de 
% color, I es una matriz de 480x640 elementos
[M,N] = size(I); % se separa la información: 
% en M se guarda el alto
% en N se guarda el ancho

% Extraccion de informacion de color
% (también resultan dos vectores de 480x640)
Ycomp = J(:,:,1);
Cb = J(:,:,2); % la información de color Cb la guarda en la columna 2 en Z
Cr = J(:,:,3); % la información de color Cr la guarda en la columna 3 en Z
figure(), imshow(Ycomp); title('Componente Y')
figure(), imshow(Cb); title('Componente Cb')
figure(), imshow(Cr); title('Componente Cr')

%% Procesamiento de informacion de color
% Usando escalamiento convencional, definir la dimension del re-escalamiento

% Se define tamaño de rescalamiento T de cada canal de color
T = 64;
CB_ = imresize(Cb,[T T],'bicubic','Antialiasing',true); % CB_ 64x64 unit8
% import skimage.transform
% imagen_reescalada = skimage.transform.resize(imagen_original, (alto, ancho), order=3)
% requiere skimage.transform
CR_ = imresize(Cr,[T T],'bicubic','Antialiasing',true); % CR_ 64x64 unit8
% genera dos arreglos llenos de ceros de tamaño T*T*8 (ojo, no TxT)
A1 = zeros(1,(T*T*8)); % ceros de 1 a 32768 (vector 1*32768)
A2 = zeros(1,(T*T*8));
index1 = 1; index2 = 8;% hay que entender por qué 1 y 8 
for x = 1 : T % por cada fila
    for y = 1 : T % por cada columna
        A1(index1:index2) = dec2bin(CB_(x,y),8) - '0';
        aux=dec2bin(CB_(x,y),8); % 01100111 string
        aux = aux -'0'; % lo cambia a matriz
        % en A1 se guardan desde 1 a 8 la conversión decimal a binario
        % de la info CB_ en la posición x,y en formato de 8 bits y establece 
        % la información de una matriz 1x1 a una matriz 1x8
        A2(index1:index2) = dec2bin(CR_(x,y),8) - '0';
        index1 = index1 + 8; % 1, 9, 17, 25, 33 etc...
        index2 = index2 + 8; % 8, 16, 24, 32 etc...
    end
end
% binStr = dec2bin(D) returns the binary, or base-2, representation of the 
% decimal integer D. The output argument binStr is a character vector that 
% represents binary digits using the characters 0 and 1.
% If D is a numeric vector, matrix, or multidimensional array, then binStr 
% is a two-dimensional character array. Each row of binStr represents an 
% element of D.

% Color es una matriz de 1x65536 
Color = [A1 A2];

figure(); imshow(I); title('Canal de luminancia original');

%% Encriptación
% Llave de cifrado dada por el usuario para el cifrado AES
ke = {'2b' '7e' '15' '16' '28' 'ae' 'd2' 'a6'...
      'ab' 'f7' '15' '88' '09' 'cf' '4f' '3c'};

% Este cifrado AES solo acepta imágenes con dimensiones multiplos de 8
Icif = cifAES_OFB(I, ke);
% Icif = cifAES_CTR(I, ke);

figure(); imshow(Icif); title('Canal de luminancia cifrado con AES modo OFB');

%% Data Hider
% Encargado de insertar los datos en el medio cifrado (desconoce su contenido)

% Llave de inserción dada por el usuario    
kd = 1000; 

% Inserción de datos mediante LSB con pseudorandom walk
planoLSB = 8;  % Indica la posición del bit que se sustituirá

% Longitud de bits de la cantidad máxima de bits que puede contener la imagen
lengthInd = length(dec2bin(size(I,1)*size(I,2)));             

% Imagen de color que se insertará como mensaje 
Databin = num2str(Color')';
[Icw, LSBo] = embedLSB(Icif,kd,Databin,planoLSB);

% Escritura de la imagen en formato bmp
pathCif = strcat(functiondir, 'ImgCif\',Iname(1:end-4),'Cif','.bmp');
imwrite(Icw, pathCif);

%% %% Receiver
% Receptor del medio cifrado y marcado (sus acciones dependen de las llaves
% que posea), se asume que el criptograma Icw fue almacenadao en la nube y
% descargado

%% Caso 1: Descifrado directo de la imagen
keR = {'2b' '7e' '15' '16' '28' 'ae' 'd2' 'a6'...
      'ab' 'f7' '15' '88' '09' 'cf' '4f' '3c'};
 
Idec = decAES_OFB(Icw, keR);

figure(); imshow(Idec); title('Canal de luminancia descifrado con información de color oculta');
psnrI = psnr(I,Idec);

%% Caso 2: Extracción de datos y restauracion de informacion de color
kdR = 1000; 
Databits = extLSB(Icw,kdR,planoLSB);
isequal(Databits,Databin)  % Si es 1, los datos extraídos son los mismos que los insertados

% Restaurar las componentes de color
i1 = 1;
i2 = 8;
W = Databits;

dec_val = zeros(1,length(W)/8);
for index = 1 : length(W)/8
    TMP = Databits(i1:i2);
    str_x = num2str(TMP);
    dec_val(index) = bin2dec(str_x); 
    i1 = i1 + 8;
    i2 = i2 + 8;
end

size(dec_val)

Cbrecover = dec_val(1:(T*T));
Crrecover = dec_val(((T*T))+1:length(dec_val));
C1 = reshape(Cbrecover,[T,T])';
C1 = imresize(C1,[M N],'bicubic','Antialiasing',true);
C1 = uint8(C1);

C2 = reshape(Crrecover,[T,T])';
C2 = imresize(C2,[M N],'bicubic','Antialiasing',true);
C2 = uint8(C2);

% Reconstruccion de imagen de color
Ir(:,:,1) = Idec;
Ir(:,:,2) = C1;
Ir(:,:,3) = C2;

% Conversion de YCbCr a RGB
Icolor = ycbcr2rgb(Ir);
figure(); imshow(Icolor); title('Imagen de color restaurada');

ssim(Io,Icolor)
psnr(Io,Icolor)

