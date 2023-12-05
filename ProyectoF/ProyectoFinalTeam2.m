% Proyecto Final
% Flores Avalos Rodrigo Emmanuel
% Sergio Huesca Flores
% Miguel Camargo

%% Inicialización de variables

clear;
clc;
opcion = 0;
% Bucle para mostrar el menú de selección hasta que el usuario elija salir
while opcion ~= 10
    % Mostrar el menú
    %clc
    disp('Menú de selección:');
    disp('1. Erosión de una imágen'); %Y
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