I = imread('Images\bird.bmp');
J = imread('Images\permutedBird.bmp');

figure('Name','Histogram permutovaného obrázku','NumberTitle','off');
%zobrazi figure na celu obrazovku
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(221)
imshow(I);
title('Pôvodný obrázok')

subplot(222)
plot(0:255, histogram(I));
%imhist(I);
title('Histogram')

subplot(223)
imshow(J);
title('Permutovaný obrázok')

subplot(224)
plot(0:255, histogram(J));
%imhist(J);
title('Histogram')

%histogramy su rovnake