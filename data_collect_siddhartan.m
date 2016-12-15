% close all
% f1 = fopen('data4.dat', 'r');
% 
% % fseek(f1, .25*60*640e3*8, 0);
% 
% x0 = fread(f1, 'float32');
% y0 = x0(1:2:end) + j * x0(2:2:end);
y0 = y(6e4:9.5e4)/std(y(6e4:9.5e4)*sqrt(2));
% fclose(f1);

[Pxx, W] = pwelch(y0, 1024,512, 'centered');

plot(W, 10*log10(Pxx));

% figure
% plot(linspace(-137.9e6/2, 137.9e6/2, length(y0)), fftshift(abs(fft(y0)))/length(y0))
% title('FFT of Portion of Received signal 12/13/16')
% xlabel('Frequency (Hz)')
% ylabel('Amplitude')