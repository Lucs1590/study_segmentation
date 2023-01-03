function [covariance_matrix, m, M] = rlda_rpca(dsLDA, Ni, num_classes, D)
%RLDA <- RPCA
display('Generate Regularized Covariance Matrix - RLDA with RPCA...');
RLDA_RPCA_FILE_NAME = ['rlda_rpca_N' int2str(Ni) '.mat'];
if exist(RLDA_RPCA_FILE_NAME,'file') > 0
    load(RLDA_RPCA_FILE_NAME);
else
    clear ldaRPCABase;
    clear dsPCA;
    [covariance_matrix, m, M, N] = mixed_looc2(dsLDA, Ni, num_classes, D);
    save(RLDA_RPCA_FILE_NAME, 'covariance_matrix', 'm', 'M');
end
end