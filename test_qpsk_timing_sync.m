close all;
%nominal frequency error
freq_error = 0.01;
phase_noise_ampl  = 0.01;

% generate random +-1 +-j values
x = sign(randn(1e4,1))+j*sign(randn(1e4,1));

% generate some phase errors (phase noise + frequency offset +
% constant (randomly generated) phase offset)

ph = phase_noise_ampl*randn(size(x))+freq_error*[1:1:length(x)]' + rand(1)*2*pi;

% apply phase offsets and add some noise
% y = x.*exp(j*ph) + 1e-2*(randn(size(x)) + j*randn(size(x)));
y = double(y)

% run the control loop
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This is where you should call your timing sync function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% you should be able to adjust the Kp Ki and Kd terms here
% and see the expected behavior in the signal - e.g. increasing
% integral term reduces steady state error but increases noisyness

v_h = phase_locked_loop(y, 20, 3, 10); %original
%for validation subplots
% x_h = phase_locked_loop(y, 0.6, 0.7, 0.01);
% y_h = phase_locked_loop(y, 0.4, 0.1, 0.01);
% z_h = phase_locked_loop(y, 0.4, 0.7, 0.09);



% plot the results
% subplot(1, 3, 1);
% plot(real(x_h), imag(x_h), 'rx');
% set(gca,'fontsize',16)
% xlabel('I')
% ylabel('Q')
% title('Increased K_P')
% axis square
% grid on
% legend('Timing sync-ed');
% 
% subplot(1, 3, 2);
% plot(real(y_h), imag(y_h), 'rx');
% set(gca,'fontsize',16)
% xlabel('I')
% ylabel('Q')
% title('Decreased K_I')
% axis square
% grid on
% legend('Timing sync-ed');
% 
% subplot(1, 3, 3);
% plot(real(z_h), imag(z_h), 'rx');
% set(gca,'fontsize',16)
% xlabel('I')
% ylabel('Q')
% title('Increased K_P')
% axis square
% grid on
% legend('Timing sync-ed');
% 
x = zeros(floor(length(y)/10), 1);
for i=1:length(x)
    x(i) = y(i*10);
end
Y = fft(y);
subplot(3, 1, 1)
plot(fftshift(real(x)))
subplot(3, 1, 2)
plot(imag(x))
subplot(3, 1, 3)
plot(abs(Y))
figure
% plot the results
plot(real(y), imag(y), '.');
hold on
plot(real(v_h), imag(v_h), 'rx');
set(gca,'fontsize',16)
xlabel('I')
ylabel('Q')
title('Constellation of Recieved Signal')
axis square
grid on
legend('Original signal', 'Timing sync-ed');
