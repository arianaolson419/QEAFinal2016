
%nominal frequency error
freq_error = 0.01;
phase_noise_ampl  = 0.01;

% generate random +-1 +-j values
x = sign(randn(1e4,1))+j*sign(randn(1e4,1));

% generate some phase errors (phase noise + frequency offset +
% constant (randomly generated) phase offset)

ph = phase_noise_ampl*randn(size(x))+freq_error*[1:1:length(x)]' + rand(1)*2*pi;

% apply phase offsets and add some noise
y = x.*exp(j*ph) + 1e-2*(randn(size(x)) + j*randn(size(x)));

% run the control loop
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This is where you should call your timing sync function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% you should be able to adjust the Kp Ki and Kd terms here
% and see the expected behavior in the signal - e.g. increasing
% integral term reduces steady state error but increases noisyness

x_h = phase_locked_loop(y, 0.4, 0.7,0.01);



% plot the results
plot(real(y), imag(y), '.');
hold on
plot(real(x_h), imag(x_h), 'rx');

legend('Original signal', 'Timing sync-ed');

axis square
grid on

[V(1); V(2)]; 