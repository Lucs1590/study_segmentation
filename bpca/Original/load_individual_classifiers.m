function load_individual_classifiers ()
Ni = 26
    %Maximum Likelihood
    %Max_Ver <- RBPCA
    display('Max_ver <- RBPCA');
    RESULTS_RBPCA_FILE_NAME = ['results_rbpca_N' int2str(Ni) '.mat'];
    load (RESULTS_RBPCA_FILE_NAME);
    TA(1, Ni) = taxa_acerto;
    Kappa(1, Ni) = KHAT;
    varK(1, Ni) = variance;
    series(1, :) = gera_grafico(results);
    
    %Max_Ver <- RLDA <- RPCA
    display('Max_ver <- RLDA <- RPCA');
    RESULTS_RLDA_RPCA_FILE_NAME = ['results_rlda_rpca_N' int2str(Ni) '.mat'];
    load (RESULTS_RLDA_RPCA_FILE_NAME);
    TA(2, Ni) = taxa_acerto;
    Kappa(2, Ni) = KHAT;
    varK(2, Ni) = variance;
    series(2, :) = gera_grafico(results);
    
    K = 1;
    
    %PCA
    display([int2str(K) '-NN <- PCA']);
    RESULTS_PCA_FILE_NAME = ['results_pca_N' int2str(Ni) '_K' int2str(K) '.mat'];
    load (RESULTS_PCA_FILE_NAME);
    TA(3, Ni) = taxa_acerto;
    Kappa(3, Ni) = KHAT;
    varK(3, Ni) = variance;
    series(3, :) = gera_grafico(results);
    
    %KL2
    display([int2str(K) '-NN <- KL2']);
    RESULTS_KL2_FILE_NAME = ['results_kl2_N' int2str(Ni) '_K' int2str(K) '.mat'];
    load (RESULTS_KL2_FILE_NAME);
    TA(4, Ni) = taxa_acerto;
    Kappa(4, Ni) = KHAT;
    varK(4, Ni) = variance;
    series(4, :) = gera_grafico(results);
    
    %KL3
    display([int2str(K) '-NN <- KL3']);
    RESULTS_KL3_FILE_NAME = ['results_kl3_N' int2str(Ni) '_K' int2str(K) '.mat'];
    load (RESULTS_KL3_FILE_NAME);
    TA(5, Ni) = taxa_acerto;
    Kappa(5, Ni) = KHAT;
    varK(5, Ni) = variance;
    series(5, :) = gera_grafico(results);
    
    %KL4
    display([int2str(K) '-NN <- KL4']);
    RESULTS_KL4_FILE_NAME = ['results_kl4_N' int2str(Ni) '_K' int2str(K) '.mat'];
    load (RESULTS_KL4_FILE_NAME);
    TA(6, Ni) = taxa_acerto;
    Kappa(6, Ni) = KHAT;
    varK(6, Ni) = variance;
    series(6, :) = gera_grafico(results);
    
    %KL5
    display([int2str(K) '-NN <- KL5']);
    RESULTS_KL5_FILE_NAME = ['results_kl5_N' int2str(Ni) '_K' int2str(K) '.mat'];
    load (RESULTS_KL5_FILE_NAME);
    TA(7, Ni) = taxa_acerto;
    Kappa(7, Ni) = KHAT;
    varK(7, Ni) = variance;
    series(7, :) = gera_grafico(results);
    
    %LDA <- PCA
    display([int2str(K) '-NN <- LDA <- PCA']);
    RESULTS_LDA_PCA_FILE_NAME = ['results_lda_pca_N' int2str(Ni) '_K' int2str(K) '.mat'];
    load (RESULTS_LDA_PCA_FILE_NAME);
    TA(8, Ni) = taxa_acerto;
    Kappa(8, Ni) = KHAT;
    varK(8, Ni) = variance;
    series(8, :) = gera_grafico(results);
    
save('individual_classifiers.mat');
end
