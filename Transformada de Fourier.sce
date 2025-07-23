clear;
clc;
clf;

filepath = 'Sentadillas.csv';

data = csvRead(filepath, ',', [], 'double');

ax = data(:, 1); 
ay = data(:, 2);
az = data(:, 3);
Ts = 0.005;
N = length(ax);
t = 0:Ts:((N-1)*Ts);
amag = sqrt(ax.^2 + ay.^2 + az.^2);

Xk = fft(amag) / N;

//centrar el espectro alrededor de la frecuencia 0
X_jW = fftshift(Xk);

Fs = 1/Ts; // frecuencia de muestreo (200 Hz)
f = linspace(-Fs/2, Fs/2, N);

plot(f, abs(X_jW));
title('Transformada de Fourier de la Señal de Magnitud');
xlabel('Frecuencia (Hz)'); 
ylabel('Amplitud');
