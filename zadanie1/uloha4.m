%I = imread('Images\bird.bmp');
%I = imread('Images\Rose.jpg');
I = imread('Images\noisyimage.jpg');

%I = rgb2gray(I); %pre farebny obrazok

figure('Name','Negat�v','NumberTitle','off');
%zobrazi figure na celu obrazovku
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(121)
imshow(I);
title('P�vodn� obr�zok')

subplot(122)
%funkcia negativ
NegI = negativ(I);
imshow(NegI);
title('Negat�v')