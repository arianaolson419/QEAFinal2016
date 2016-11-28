% QEA FINAL RUSSIAN WEATHER SATELLITE! 
Zi = input1; %will get this value from the USRP
Zq = input2; %will get this value from the USRP
Kp = onething;
Ki = something;
Kd = somethingelse; 

Zq = 1i*Zq; 

Ztotal = Zi + Zq; %this is a complex number Zi + iZq
phi = zeros(1, length(Ztotal)); 

phi(1) = 0; %initial guess

for k = 2:length(Ztotal) 
    y = Ztotal*exp(1i*phi(k-1)); 

    realPart = real(y); 
    imagPart = imag(y);

    signReal = sign(realPart);
    signImag = sign(imagPart); 

    realPart = realPart*signImag;
    imagPart = imagPart*signReal; 

    phi(k) = wrapTo2Pi(realPart - imagPart); 
    phi(k) = wrapTo2Pi(Kp*phi(k) + Ki*(wrapTo2Pi(sum(phi))) + Kd*(wrapTo2Pi(phi(k) - phi(k-1)))); 
end

bits = Ztotal.*exp(1i*phi); 
firstBits = sign(real(bits));
secondBits = sign(imag(bits)); 

