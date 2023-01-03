function feature_extraction(D, dataSet, num_classes)

dsBPCA = bpcaSet(dataSet, num_classes);


Ni = 26
    ds = dataSet;
    
    DSPCA_FILE = ['dsPCA_N' int2str(Ni) '.mat'];

if exist(DSPCA_FILE, 'file') > 0
    load(DSPCA_FILE);
else
    [pcaBase, meanFace] = pca(ds, Ni, num_classes, D);
    dsPCA = dataSet - repmat(meanFace, size(dataSet, 1), 1);
    dsPCA = dsPCA * pcaBase;
    save(DSPCA_FILE, 'dsPCA');
end
    
    DSKL2_FILE = ['dsKL2_N' int2str(Ni) '.mat']
    if exist(DSKL2_FILE, 'file') > 0
        load(DSKL2_FILE);
    else
        [kl2base, meanFace] = kl2(ds, Ni, num_classes, D);
        dsKL2 = dataSet - repmat(meanFace, size(dataSet, 1), 1);
        dsKL2 = dsKL2 * kl2base;
        save(DSKL2_FILE, 'dsKL2');
    end
    
    DSKL3_FILE = ['dsKL3_N' int2str(Ni) '.mat']
    if exist(DSKL3_FILE, 'file') > 0
        load(DSKL3_FILE);
    else
        [kl3base, meanFace] = kl3(ds, Ni, num_classes);
        dsKL3 = dataSet - repmat(meanFace, size(dataSet, 1), 1);
        dsKL3 = dsKL3 * kl3base;
        save(DSKL3_FILE, 'dsKL3');
    end
    
    DSKL4_FILE = ['dsKL4_N' int2str(Ni) '.mat']
    if exist(DSKL4_FILE, 'file') > 0
        load(DSKL4_FILE);
    else
        [kl4base, meanFace] = kl4(ds, Ni, num_classes, D);
        dsKL4 = dataSet - repmat(meanFace, size(dataSet, 1), 1);
        dsKL4 = dsKL4 * kl4base;
        save(DSKL4_FILE, 'dsKL4');
    end
    
    
    DSKL5_FILE = ['dsKL5_N' int2str(Ni) '.mat']
    if exist(DSKL5_FILE, 'file') > 0
        load(DSKL5_FILE);
    else
        [kl5base, meanFace] = kl5(ds, Ni, num_classes);
        dsKL5 = dataSet - repmat(meanFace, size(dataSet, 1), 1);
        dsKL5 = dsKL5 * kl5base;
        save(DSKL5_FILE, 'dsKL5');
    end
    
    ds2 = partition(dsPCA, 1:Ni, 1:num_classes);
    
    DSLDA_PCA_FILE = ['dsLDA_PCA_N' int2str(Ni) '.mat']
    if exist(DSLDA_PCA_FILE, 'file') > 0
        load(DSLDA_PCA_FILE);
    else
        ldaPCABase = lda_pca(ds2, Ni, num_classes);
        dsLDA_PCA = dsPCA * ldaPCABase;
        save(DSLDA_PCA_FILE, 'dsLDA_PCA');
    end
    
    ds3 = partition(dsLDA_PCA, 1:Ni, 1:num_classes);
    [covariance_matrix, m, M] = rlda_pca(ds3, Ni, num_classes, D);
    
    [covariance_matrix, m, M, N] = rpca(ds2, Ni, num_classes, D);
    
    DSLDA_RPCA_FILE = ['dsLDA_RPCA_N' int2str(Ni) '.mat']
    if exist(DSLDA_RPCA_FILE, 'file') > 0
        load(DSLDA_RPCA_FILE);
    else
        ldaRPCABase = lda_rpca(Ni, covariance_matrix, m, M, num_classes, N);
        dsLDA_RPCA = dsPCA * ldaRPCABase;
        save(DSLDA_RPCA_FILE, 'dsLDA_RPCA');
    end
    
    ds4 = partition(dsLDA_RPCA, 1:Ni, 1:num_classes);
    [covariance_matrix, m, M] = rlda_rpca(ds4, Ni, num_classes, D);
    
    [covariance_matrix, m, M] = rbpca(dsBPCA, Ni, num_classes);
    
    clear ds;
end
