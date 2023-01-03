function [covariance_matrix, m, M] = rlda_pca(dsLDA, Ni, num_classes, D)
%RLDA <- PCA
    display('Generate Regularized Covariance Matrix - RLDA...');
    RLDA_PCA_FILE_NAME = ['rlda_pca_N' int2str(Ni) '.mat'];
    if exist(RLDA_PCA_FILE_NAME,'file') > 0
        load(RLDA_PCA_FILE_NAME);
    else
        [covariance_matrix, m, M, N] = mixed_looc2(dsLDA, Ni, num_classes, D);
        clear dsLDA;
        save(RLDA_PCA_FILE_NAME, 'covariance_matrix', 'm', 'M');
    end
end