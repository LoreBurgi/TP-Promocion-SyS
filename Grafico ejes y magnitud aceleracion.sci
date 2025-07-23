clear;
clc;
clf; 

archivo = 'Sentadillas.csv';

data = csvRead(archivo,',', [], 'double');

// extraer los datos y crear el vector de tiempo
ax = data(:, 1); 
ay = data(:, 2);
az = data(:, 3);
Ts = 0.005;
N = length(ax);
t = 0:Ts:((N-1)*Ts);

// magnitud del vector de aceleración
amag = sqrt(ax.^2 + ay.^2 + az.^2);

subplot(2, 1, 1);
plot(t, [ax, ay, az]);
title('Datos del Acelerómetro (Ejes X, Y, Z)');
xlabel('Tiempo (s)');
ylabel('Aceleración (m/s²)');
legend('Eje X', 'Eje Y', 'Eje Z', '', '');

subplot(2, 1, 2);
plot(t, amag, 'r');
title('Magnitud del Vector de Aceleración');
xlabel('Tiempo (s)');
ylabel('Magnitud de Aceleración (m/s²)');
