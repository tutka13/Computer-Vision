function templmatch_nerovnomerne(OBRAZ, VZOR, koeficient1)
VZOR_STLPEC = im2col(VZOR,[50 50]);
OBRAZ_STLPEC = im2col(OBRAZ,[50 50]);

VZOR_MATICA = repmat(VZOR_STLPEC, [1,88400]);
vektor = sum(abs(OBRAZ_STLPEC - VZOR_MATICA));
%konverzia z min na max
MATICA = reshape(1./(1+vektor), [374-49,321-49]);

LMax = vision.LocalMaximaFinder;
LMax.MaximumNumLocalMaxima = 1;
LMax.NeighborhoodSize = [3 3];
LMax.Threshold = 0.9*max(MATICA(:)) ;
location1 = step(LMax, MATICA);

%uz viem, kde sa nachadza vzor, tam teraz zmenim hodnotu jasu a zopakujem
%hladanie vzoru v novom obraze
POMOCNY_OBRAZ = OBRAZ;
%je tu nejaky posun, nerozumiem preco taky, ale nasla som spravne hodnoty
%posuvanim o par pixelov
POMOCNY_OBRAZ(location1(1)+47:location1(1)+96,location1(2)-45:location1(2)+4) = POMOCNY_OBRAZ(location1(1)+47:location1(1)+96,location1(2)-45:location1(2)+4)*koeficient1;
OBRAZ_STLPEC2 = im2col(POMOCNY_OBRAZ,[50 50]);
vektor2 = sum(abs(OBRAZ_STLPEC2 - VZOR_MATICA));
MATICA2 = reshape(1./(1+vektor2), [374-49,321-49]);
LMax.Threshold = 0.9*max(MATICA2(:)) ;
location2 = step(LMax, MATICA2);


figure('Name','Nájdený vzor pri nerovnomernom znižovaní jasu');
imshow(POMOCNY_OBRAZ);

hold on;
rectangle('Position', [location2(1), location2(2), 50 , 50] , 'EdgeColor' , 'g' );
hold off;
end