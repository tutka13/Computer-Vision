function templmatch_rovnomerny(OBRAZ, VZOR, koeficient)
%VZOR_STLPEC= VZOR(:);
VZOR_STLPEC = im2col(VZOR,[50 50]);
OBRAZ_STLPEC = im2col(OBRAZ,[50 50]);

%a = OBRAZ_STLPEC - VZOR_MATICA nefungovalo, preto je tu repmat
VZOR_MATICA = repmat(VZOR_STLPEC, [1,88400]);
vektor = sum(abs(OBRAZ_STLPEC - VZOR_MATICA));
%konverzia z min na max
MATICA = reshape(1./(1+vektor), [374-49,321-49]);

% vypla som vykreslovanie - tato matica ukaze kde je maximum 
% figure;
% imshow(MATICA, []);

LMax = vision.LocalMaximaFinder;
LMax.MaximumNumLocalMaxima = 1;
LMax.NeighborhoodSize = [3 3];
LMax.Threshold = 0.9*max(MATICA(:)) ;
location1 = step(LMax, MATICA);
%uz viem kde by sa mal vzor v obrazku nachadzat, teraz znizim jeho jas

OBRAZ_znizeny = OBRAZ*koeficient;
OBRAZ_STLPEC_znizeny = im2col(OBRAZ_znizeny,[50 50]);
vektor2 = sum(abs(OBRAZ_STLPEC_znizeny - VZOR_MATICA));
MATICA2 = reshape(1./(1+vektor2), [374-49,321-49]);
LMax.Threshold = 0.9*max(MATICA2(:));
location2 = step(LMax, MATICA2);

figure('Name','Nájdený vzor pri rovnomernom znižovaní jasu');
imshow(OBRAZ_znizeny);
hold on;
rectangle('Position', [location2(1), location2(2), 50 , 50] , 'EdgeColor' , 'g' );
hold off;
end