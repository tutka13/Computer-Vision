OBRAZ1 = double(rgb2gray(imread('features\Obraz1.png')));
OBRAZ1 = OBRAZ1<100;

figure('Name','H¾adanie objektov v OBRAZ1', 'NumberTitle','off');
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
imshow(OBRAZ1);

OBJEKT1 = double(rgb2gray(imread('features\Objekt1.png')));
OBJEKT1 = OBJEKT1<100;
% figure;
% imshow(OBJEKT1);

OBJEKT2 = double(rgb2gray(imread('features\Objekt2.png')));
OBJEKT2 = OBJEKT2<100;
% figure;
% imshow(OBJEKT2);

%ruza tam nie je
OBJEKT3 = double(rgb2gray(imread('features\Objekt3.png ')));
OBJEKT3 = OBJEKT3<100;
%figure;
%imshow(OBJEKT3);

OBJEKT4 = double(rgb2gray(imread('features\Objekt4.png')));
OBJEKT4 = OBJEKT4<100;
% figure;
% imshow(OBJEKT4);

OBJEKT5 = double(rgb2gray(imread('features\Objekt5.png')));
OBJEKT5 = OBJEKT5<100;
% figure;
% imshow(OBJEKT5);

OBRAZ = regionprops(OBRAZ1,'Area', 'Centroid');
OBRAZ_AREA = cat(1, OBRAZ.Area); 
centroids = cat(1, OBRAZ.Centroid); 

OBJEKT = regionprops(OBJEKT2, 'Area'); 

hold on 
for i= 1: length(OBRAZ_AREA)
    if ((OBRAZ_AREA(i) > OBJEKT.Area - 300) && OBRAZ_AREA(i) < (OBJEKT.Area + 300))
        plot(centroids(i,1),centroids(i,2), 'r*');
    end
end
hold off

%area funguje dobre pre OBRAZ1, tam nie je skalovanie
%pre OBRAZ2 to nebude fungovat, hladala som inu vlastnost
%tym, ze skalujem, cokolvek ako area, convex area, perimeter,...nebude fungovat
%circularity chce iba spojite objekty
%solidity = area/convex area

OBRAZ2 = double(rgb2gray(imread('features\Obraz2.png')));
OBRAZ2=OBRAZ2<100;

figure('Name','H¾adanie objektov v OBRAZ2', 'NumberTitle','off');
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
imshow(OBRAZ2);

OBRAZ = regionprops(OBRAZ2, 'Solidity', 'Centroid');
OBRAZ_SOLIDITY = cat(1, OBRAZ.Solidity); 
centroids = cat(1, OBRAZ.Centroid); 

%mozno odkomentovat
OBJEKT = regionprops(OBJEKT2, 'Solidity');
%OBJEKT = regionprops(OBJEKT3, 'Solidity'); 
%OBJEKT = regionprops(OBJEKT4, 'Solidity');

hold on 
for i= 1: length(OBRAZ_SOLIDITY)
    if ((OBRAZ_SOLIDITY(i) > OBJEKT.Solidity - 0.01) && OBRAZ_SOLIDITY(i) < (OBJEKT.Solidity + 0.01))
        plot(centroids(i,1),centroids(i,2), 'r*');
    end
end
hold off

%zisla by sa na to funkcia, ale mojmu matlabu sa akosi nechce, tak som to robila 
%len v octave, po nacitani balicka pkg load image to funguje