I1 = imread('Images\permutedBird.bmp');
I2 = imread('Images\bird.bmp');

J2 = pixel_permutation(I2);

figure('Name',' Permutovaný obrázok','NumberTitle','off');
%zobrazi figure na celu obrazovku
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(131)
imshow(I2);
title('Obrázok bird');

subplot(132)
imshow(J2);
title('Použitá permutácia');

subplot(133)
imshow(I1);
title('Obrázok permutedBird');


