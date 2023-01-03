function ldaPCABase = lda_pca(dsPCA, Ni, num_classes)

%LDA <- PCA
    display('Generate Linear Discriminat Analysis (LDA) basis...');
    LDA_PCA_FILE_NAME = ['lda_pca_N' int2str(Ni) '.mat'];
    if exist(LDA_PCA_FILE_NAME,'file') > 0
        load(LDA_PCA_FILE_NAME);
    else
        [sigma_i, m, M, N] = covariance(dsPCA, Ni, num_classes);
        ldaPCABase = pca_lda(Ni, sigma_i, m, M, num_classes, N);
        clear dsPCA;
        clear sigma_i;
        clear m;
        clear M;
        clear N;
        save(LDA_PCA_FILE_NAME, 'ldaPCABase');
    end
end