OBRAZ = double(imread('templmatch\Obraz.jpg'))/255;
OBRAZ = OBRAZ(1:374,320:640); %polovicny obrazok
VZOR = double(imread('templmatch\Vzor.jpg'))/255;

%aj rovnomerne znizovanie jasu robi problem pri hodnote 0.42
templmatch_rovnomerny(OBRAZ, VZOR, 0.43);
templmatch_rovnomerny(OBRAZ, VZOR, 0.42);

%zistila som, ze pre koeficient 0.47 uz funkcia nenajde spravne miesto
%templatu
templmatch_nerovnomerne(OBRAZ, VZOR, 0.48);
templmatch_nerovnomerne(OBRAZ, VZOR, 0.47);

