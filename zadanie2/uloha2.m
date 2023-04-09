Img = double(rgb2gray(imread ('face.jpg ')))/255 ;
figure('Name',' Obr�zok', 'NumberTitle','off');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(131)
imshow(Img);
title('P�vodn� obr�zok');

%povodne spektrum
FImg = fft2(Img) ;  %toto je komplexna matica

subplot(132)
%amplitudove spektrum je abs povodneho spektra
C = abs(FImg);
%transformacia spektra na obraz
SC = abs(ifft2(C));
imshow(SC);
title('Obr�zok z amplit�dov�ho spektra');

subplot(133)
%matica B ma absolutne hodnoty 1
B = FImg./abs(FImg); 
SB = ifft2(B);
imshow(SB, []);
%imshow(histeq(SB)); %skusala som pozriet ekvalizovany obrazok 
title('Transform�cia p�vodn�ho spektra');
