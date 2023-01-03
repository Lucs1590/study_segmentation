function ldaRPCABase = lda_rpca(Ni, covariance_matrix, m, M, num_classes, N)
  %LDA <- RPCA
display('Generate Linear Discriminat Analysis (LDA) basis with RPCA...');
LDA_RPCA_FILE_NAME = ['lda_rpca_N' int2str(Ni) '.mat'];
if exist(LDA_RPCA_FILE_NAME,'file') > 0
    load(LDA_RPCA_FILE_NAME);
else
    ldaRPCABase = pca_lda(Ni, covariance_matrix, m, M, num_classes, N);
    save(LDA_RPCA_FILE_NAME, 'ldaRPCABase');
end
 
end