function B = pixel_permutation(I) %vyhodi maticu
[r, c] = size(I);
RI = I(randperm(numel(I))); 
%prevedie na povodny rozmer
B = reshape(RI,[r,c]);
end