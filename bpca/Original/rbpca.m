function [covariance_matrix, m, M] = rbpca(dsBPCA, Ni, num_classes)

%RBPCA
display('Generate Regularized Covariance Matrix - RBPCA...');
RBPCA_FILE_NAME = ['rbpca_N' int2str(Ni) '.mat'];
if exist(RBPCA_FILE_NAME,'file') > 0
    load(RBPCA_FILE_NAME);
else
    [covariance_matrix, m, M, N] = mixed_looc2(dsBPCA, Ni, num_classes, 16*12);
    %clear dsPCA;
    save(RBPCA_FILE_NAME, 'covariance_matrix', 'm', 'M');
end
end