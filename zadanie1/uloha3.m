I = imread('Images\bird.bmp');
n=124;
%I = imread('Images\Rose.jpg');
%n=145;

figure('Name','Prahovanie','NumberTitle','off');
%zobrazi figure na celu obrazovku
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(121)
imshow(I);
title('Pôvodný obrázok')

subplot(122)
 I(I<n)=0;
 I(I>=n)=255;
 imshow(I);
 title('Použité prahovanie')