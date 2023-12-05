%% Perceptrón simple
samp1=[-1,-1];
samp2=[-1,1];
samp3=[1,-1];
samp4=[1,1];
%% Valores iniciales de los pesos (Paso 1)
w1=1/2;
w2=-1;
theta=1/2;

%% crear la matiz que contenga los datos
X=[samp1;samp2;samp3;samp4];
LBL=[-1;-1;-1;1]; %compuerta and

%% Actualizaciones de los pesos (training)
% seleccionar el iesimo vector del conjunto de entrenamiento
for i=1:1:size(X,1)
    buffer=X(1,:);% Seleccionar el iesimo vector
    y_acu=w1*buffer(1,2)+w2*buffer(1,1)+theta;% Calcular la yacumulada
    if y_acu>=0 % calculamos la y predecida
        y_pred=1;
    else
        y_pred=-1;
    end
end

%% Valores para las lineas rectas
x=-3/2:1/2:3/2;
y=(-w1/w2)*x+(-theta/w2);

%% Gráfico
figure(1)
plot(X(1:3,1), X(1:3,2), 'ro', 'LineWidth', 5)
title('Principios de graficación')
xlabel('x_1')
ylabel('x_2')
axis([-3/2,3/2,-2,2])
grid on
hold on
plot(X(4,1),X(4,2),'g*', 'LineWidth',5)
plot(x,y)
hold off
%perceptron para and listo
% or listo
% nand listo
% y nor 