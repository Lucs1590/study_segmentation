function classification (num_classes)

Ni = 26
%Maximum Likelihood
%Max_Ver <- RBPCA
display('Max_ver <- RBPCA');
RBPCA_FILE_NAME = ['rbpca_N' int2str(Ni) '.mat'];
RESULTS_RBPCA_FILE_NAME = ['results_rbpca_N' int2str(Ni) '.mat'];
BPCA_FILE_NAME = ['bpca.mat'];
if exist(RESULTS_RBPCA_FILE_NAME,'file') <= 0
    load(RBPCA_FILE_NAME);
    load(BPCA_FILE_NAME);
    [taxa_acerto, similarities, results] = holdout_max_ver_train(dsBPCA, covariance_matrix, m, Ni, num_classes);
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_RBPCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
end

%Max_Ver <- RPCA
display('Max_ver <- RPCA');
RPCA_FILE_NAME = ['rpca_N' int2str(Ni) '.mat'];
RESULTS_RPCA_FILE_NAME = ['results_rpca_N' int2str(Ni) '.mat'];
if exist(RESULTS_RPCA_FILE_NAME,'file') <= 0
    DSPCA_FILE = ['dsPCA_N' int2str(Ni) '.mat'];
    load(DSPCA_FILE);
    load(RPCA_FILE_NAME);
    [taxa_acerto, similarities, results] = holdout_max_ver_train(dsPCA, covariance_matrix_rpca, m_rpca, Ni, num_classes);
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_RPCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
end

%Max_Ver <- RLDA <- PCA
display('Max_ver <- RLDA <- PCA');
RLDA_PCA_FILE_NAME = ['rlda_pca_N' int2str(Ni) '.mat'];
RESULTS_RLDA_PCA_FILE_NAME = ['results_rlda_pca_N' int2str(Ni) '.mat'];
if exist(RESULTS_RLDA_PCA_FILE_NAME,'file') <= 0
    DSLDA_PCA_FILE = ['dsLDA_PCA_N' int2str(Ni) '.mat'];
    load(DSLDA_PCA_FILE);
    load(RLDA_PCA_FILE_NAME);
    [taxa_acerto, similarities, results] = holdout_max_ver_train(dsLDA_PCA, covariance_matrix, m, Ni, num_classes);
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_RLDA_PCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
end

%Max_Ver <- RLDA <- RPCA
display('Max_ver <- RLDA <- RPCA');
RLDA_RPCA_FILE_NAME = ['rlda_rpca_N' int2str(Ni) '.mat'];
RESULTS_RLDA_RPCA_FILE_NAME = ['results_rlda_rpca_N' int2str(Ni) '.mat'];
if exist(RESULTS_RLDA_RPCA_FILE_NAME,'file') <= 0
    DSLDA_RPCA_FILE = ['dsLDA_RPCA_N' int2str(Ni) '.mat'];
    load(DSLDA_RPCA_FILE);
    load(RLDA_RPCA_FILE_NAME);
    [taxa_acerto, similarities, results] = holdout_max_ver_train(dsLDA_RPCA, covariance_matrix, m, Ni, num_classes);
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_RLDA_RPCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
end

%KNN
K = 1


%PCA
display([int2str(K) '-NN <- PCA']);
DSPCA_FILE = ['dsPCA_N' int2str(Ni) '.mat'];
RESULTS_PCA_FILE_NAME = ['results_pca_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_PCA_FILE_NAME,'file') <= 0
    load(DSPCA_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsPCA, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_PCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsPCA;
end

%KL2
display([int2str(K) '-NN <- KL2']);
DSKL2_FILE = ['dsKL2_N' int2str(Ni) '.mat']
RESULTS_KL2_FILE_NAME = ['results_kl2_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_KL2_FILE_NAME,'file') <= 0
    load(DSKL2_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsKL2, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_KL2_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsKL2;
end

%KL3
display([int2str(K) '-NN <- KL3']);
DSKL3_FILE = ['dsKL3_N' int2str(Ni) '.mat']
RESULTS_KL3_FILE_NAME = ['results_kl3_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_KL3_FILE_NAME,'file') <= 0
    load(DSKL3_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsKL3, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_KL3_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsKL3;
end

%KL4
display([int2str(K) '-NN <- KL4']);
DSKL4_FILE = ['dsKL4_N' int2str(Ni) '.mat']
RESULTS_KL4_FILE_NAME = ['results_kl4_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_KL4_FILE_NAME,'file') <= 0
    load(DSKL4_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsKL4, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_KL4_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsKL4;
end

%KL5
display([int2str(K) '-NN <- KL5']);
DSKL5_FILE = ['dsKL5_N' int2str(Ni) '.mat']
RESULTS_KL5_FILE_NAME = ['results_kl5_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_KL5_FILE_NAME,'file') <= 0
    load(DSKL5_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsKL5, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_KL5_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsKL5;
end


%LDA <- PCA
display([int2str(K) '-NN <- LDA <- PCA']);
DSLDA_PCA_FILE = ['dsLDA_PCA_N' int2str(Ni) '.mat']
RESULTS_LDA_PCA_FILE_NAME = ['results_lda_pca_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_LDA_PCA_FILE_NAME,'file') <= 0
    load(DSLDA_PCA_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsLDA_PCA, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_LDA_PCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsLDA_PCA;
end

%LDA <- RPCA
display([int2str(K) '-NN <- LDA <- RPCA']);
DSLDA_RPCA_FILE = ['dsLDA_RPCA_N' int2str(Ni) '.mat']
RESULTS_LDA_RPCA_FILE_NAME = ['results_lda_rpca_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_LDA_RPCA_FILE_NAME,'file') <= 0
    load(DSLDA_RPCA_FILE);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsLDA_RPCA, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_LDA_RPCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsLDA_RPCA;
end


%BPCA
display([int2str(K) '-NN <- BPCA']);
BPCA_FILE_NAME = ['bpca.mat'];
RESULTS_BPCA_FILE_NAME = ['results_bpca_N' int2str(Ni) '_K' int2str(K) '.mat'];
if exist(RESULTS_BPCA_FILE_NAME,'file') <= 0
    load(BPCA_FILE_NAME);
    [taxa_acerto, similarities, results] = holdout_knn_train(dsBPCA, Ni, num_classes, K)
    [KHAT, variance] = kappa(results, num_classes, Ni);
    save (RESULTS_BPCA_FILE_NAME, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
    clear dsBPCA;
end
end
