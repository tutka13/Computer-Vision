%I = imread('Images\bird.bmp');
I = imread('Images\Rose.jpg');
%I = imread('Images\noisyimage.jpg');

figure('Name','Ekvalizácia histogramu','NumberTitle','off');
%zobrazi figure na celu obrazovku
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(3,2,[1,2])
imshow(I);
title('Pôvodný obrázok');

%a b z funkcie histogram
subplot(323) 
plot(0:255, histogram(I));
%bar(0:255, H);
%imhist(I);
title('Histogram');

%c
subplot(324)
%zobrazi graf kumulativneho histogramu
plot(0:255, cumulative_histogram(I));
title('Kumulatívny histogram');

%d e
subplot(3,2,[5,6])
%ekvalizuje obrazok
J = equalized(I);
imshow(J);
title('Nový obrázok'); 
