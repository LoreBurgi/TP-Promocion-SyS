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

amag_fft = fft(amag); // calculamos la FFT de la señal de magnitud

// filtro
fc = 3;                     // frecuencia de corte (Hz)
Fs = 1/Ts;                   // frecuencia de muestreo (200 Hz)
f = linspace(0, Fs, N);      

// filtro, Es 1 para f < fc y 0 para el resto
filtro_ideal = (f < fc) | (f > (Fs - fc)); 

// multiplicamos el espectro por la máscara para anular las altas frecuencias
amag_fft_filtrada = amag_fft .* filtro_ideal';

// usamos la trans. inversa para obtener la señal filtrada
amag_filtrada = real(ifft(amag_fft_filtrada));

subplot(1, 1, 1);
plot(t, amag, 'r');
plot(t, amag_filtrada, 'b', 'linewidth', 2);
title('Magnitud Original (Rojo) vs. Magnitud Filtrada (Azul)');
xlabel('Tiempo (s)');
ylabel('Amplitud');
legend('Original', 'Filtrada');

