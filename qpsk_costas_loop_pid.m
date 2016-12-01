function [ y ] = qpsk_costas_loop_pid( x, Kp, Ki, Kd )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

y = zeros(size(x));
phase = 0;
acc_e = 0;
old_error = 0;

for n = 1:length(x)
    % produce the nco output (nco = numerically controlled oscillator)
    nco = exp(-phase*j);
    
    % apply phase correction
    y(n) = x(n)*nco;

    % estimate the phase error after correction
    e = -(sign(imag(y(n)))*real(y(n))-sign(real(y(n)))*imag(y(n)))/2;
    
    % accumulate the error in the integrator    
    acc_e = acc_e+e;   
    
    % compute the phase correction
    % as the sum of a proportional term and the integral term
    phase = Kp*e + Ki*acc_e + Kd*(e-old_error);
       
    
    % save old error
    old_error = e;
    

 end

end

