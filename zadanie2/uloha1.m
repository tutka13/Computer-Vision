%uloha1
t = linspace(0, 2*pi, 500);
A = repmat(sin(30*t), 500, 1); %matica sinusov
A0 = A((250-50):(250+50), (250-50):(250+50));
fA0 = fft2(A0);
figure('Name',' Obrázok a otoèený obrázok','NumberTitle','off');
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

subplot(121)
imshow(A, []);
title('Obrázok matice sínusov');

subplot(122)
%uloha 1b)
%otocenie matice o uhol 45
RA = imrotate(A, 45);
imshow(RA, []);
title('Otoèený obrázok matice sínusov');

figure('Name',' Amplitúdové spektrá','NumberTitle','off');
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
subplot(121)
imagesc(log10(1+abs(fftshift(fA0))));
colorbar;
title('Pôvodná matica');

%zvlena cast B
B = RA((250-50):(250+50), (250-50):(250+50));
fB= fft2(B);

subplot(122)
imagesc(log10(1+abs(fftshift(fB))));
title('Otoèená matica');
%amplitudove spektrum sa "natocilo" podla uhla otocenia

%uloha 1c)
%linearna kombinacia matic, treba opravit rozmer
%mozno zvolit koeficienty lin. kombinacie
k1 = 1;
k2 = 1;
%A je matica 500x500, z RA vyberieme 500x500 zo stredu
RA =  RA((209-104):(709-105), (209-104):(709-105));

C = k1 * A + k2 * RA;
%z matice C vyberieme cast
C = C((250-50):(250+50), (250-50):(250+50));
fC= fft2(C);

figure('Name',' Lineárna kombinácia','NumberTitle','off');
imagesc(log10(1+abs(fftshift(fC))));
colorbar;
%amplitudove spektrum je LK amplitudovych spektier


