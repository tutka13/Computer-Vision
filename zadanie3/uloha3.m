I = double(rgb2gray(imread('corners\Rohy.png')))/255;

figure('Name',' Detekcia rohov','NumberTitle','off');
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
subplot(121)
imshow(I);
title('Pôvodný obrázok');

%gaussov filter na rozmazanie hran
h = fspecial('gaussian',3,0.5);

%horizontalne hrany - to je to iste co robi 'sobel'
%h_h = fspecial('sobel'); pre h_v mozem transponovat
h_h = [ 1  2  1 ; 0  0  0; -1 -2 -1; ];
h_v = [ 1  0  -1 ; 2  0  -2; 1 0 -1; ];

Ix = imfilter(I, h_v); %ked derivujem v smere x, su y-nove hrany
% figure;
% imshow(Ix, []);

Iy = imfilter(I, h_h);
% figure;
% imshow(Iy, []);

A00 = Ix .* Ix;
A00 =imfilter(A00, h);
% figure;
% imshow(A00, []);

A01 = Ix .* Iy;
A01 =imfilter(A01, h);
% figure;
% imshow(A01, []);

A11 = Iy .* Iy;
A11 =imfilter(A11, h);
% figure;
% imshow(A11, []);

% det(A)/trace(A) po prvkoch
A = (A00.*A11 - A01.^2)./(A00+A11);

subplot(122)
imshow(A, []);
title('Detekované rohy');
%alebo detegované? neviem

%pre matlab aspon 2015 existuje funkcia - vyskusala som si pre I =
%checkerboard
% I = checkerboard;
% corners = detectHarrisFeatures(I);
% figure;
% imshow(I); 
% hold on;
% plot(corners.selectStrongest(50));
% hold off;
