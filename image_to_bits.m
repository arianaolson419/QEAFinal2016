pic = imread('earth.png');
A = zeros(3*size(pic, 1) * size(pic, 2),1);
B = zeros(size(A, 1) * 8, 1);
pic_r = reshape(pic, size(pic, 1) * size(pic, 2), size(pic, 3));

A(1:3:end) = pic_r(:, 1);
A(2:3:end) = pic_r(:, 2);
A(3:3:end) = pic_r(:, 3);


    
for i = 1:length(A)
    B(i*8 - 7: i*8) = de2bi(A(i),8)';
end