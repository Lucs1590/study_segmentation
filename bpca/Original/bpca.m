function img = bpca(img) 
img = imresize(img, [80 60]);
blocks = im2col(img, [5 5], 'distinct')';
%blocks = double(blocks) / 255;
%size (blocks)
meanBlock = mean (blocks);
%size(meanBlock)
blocks = blocks - repmat(meanBlock, size(blocks, 1), 1);
covar = cov(blocks);
[eigenvectors, eigenvalues] = eig (covar);
base = eigenvectors(:, 25);
img = blocks * base;
%size(img)
img = img';
img = (img - min(img)) / (max(img) - min(img));
end