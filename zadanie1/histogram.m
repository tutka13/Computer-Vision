function hist = histogram(Img)
hist = zeros(1,256);
[r,c] = size(Img);

for i = 1:r
    for j = 1:c
        hist(Img(i,j)+1) = hist(Img(i,j)+1)+1;
    end
end
end