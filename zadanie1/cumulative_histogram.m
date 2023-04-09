function Hc = cumulative_histogram(I)

[N,M]=size(I);
G = 256;

H= histogram(I);
Hc= zeros(1,G);

Hc(1)=H(1);
for p=2:G
    Hc(p)=Hc(p-1)+H(p);
end
end