function E= equalized(I)
[N,M]=size(I);
G = 256;
Hc = cumulative_histogram(I);

T=zeros(1,G);

for p=1:G
    T(p)=round((G-1)/(N*M)*Hc(p));
end

E=zeros(N,M, 'uint8');
for i=1:N
    for j=1:M
        E(i,j)=(T(I(i,j)+1));
    end
end