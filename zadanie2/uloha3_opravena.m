Img = double(rgb2gray(imread ('harleysmall.jpg ')))/255 ;
FImg = fft2(Img);

figure('Name',' Amplitúdové spektrum', 'NumberTitle','off');
imagesc(log10(1+abs(fftshift(FImg)))); 

%imagesc vytvori farebne kodovany obraz (graf dvojpremennych pohlad zhora + farba koduje vysku)
%amplitudove spektrum obsahuje "perodicky sa opakujuce bodky"
%co reprezentuje vysoke zmeny frekvencii - hrany (vieme, ze ich tam je
%vela)