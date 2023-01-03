function dsBPCA = bpcaSet(dataSet, num_classes)
%BPCA
display('Generate Block-Based PCA (BPCA) database...');
BPCA_FILE_NAME = ['bpca.mat'];
if exist(BPCA_FILE_NAME,'file') > 0
    load(BPCA_FILE_NAME);
else
    dsBPCA = seldat(dataSet, 1 : num_classes, 1 : 16 * 12);
    for i = 1 : size(dataSet, 1)
        img = reshape(dataSet.data(i, :), 82, 60);
        dsBPCA(i, :) = bpca(img);
    end
    save(BPCA_FILE_NAME, 'dsBPCA');
end
end