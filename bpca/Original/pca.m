function [pcaBase, meanFace] = pca(dataSet, Ni, num_classes, D)
%KL1 or PCA
display('Generate Karhunen-Loève 1 (KL1) or Principal Component Analysis (PCA) basis...');
PCA_FILE_NAME = ['pca_N' int2str(Ni) '.mat'];
if exist(PCA_FILE_NAME,'file') > 0
    load(PCA_FILE_NAME);
else
    [eigenvectors, eigenvalues, meanFace] = kl1_base(dataSet, num_classes);
    save(PCA_FILE_NAME, 'eigenvectors', 'eigenvalues', 'meanFace');
end
pcaBase = eigenvectors(:, 1:D);
clear eigenvectors;
clear eigenvalues;
end