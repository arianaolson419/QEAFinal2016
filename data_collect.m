f1 = fopen('data1.dat', 'r');
x0 = fread(f1, 5e7, 'float32');
y0 = x0(1:2:end) + j * x0(2:2:end);
fclose(f1);

plot(real(y0))