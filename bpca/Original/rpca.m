function [covariance_matrix_rpca, m_rpca, M_rpca, N] = rpca(dsPCA, Ni, num_classes, D)
 %RPCA
display('Generate Regularized Covariance Matrix - RPCA...');
RPCA_FILE_NAME = ['rpca_N' int2str(Ni) '.mat'];
if exist(RPCA_FILE_NAME,'file') > 0
    load(RPCA_FILE_NAME);
else
    [covariance_matrix_rpca, m_rpca, M_rpca, N] = mixed_looc2(dsPCA, Ni, num_classes, D);
    clear dsPCA;
    save(RPCA_FILE_NAME, 'covariance_matrix_rpca', 'm_rpca', 'M_rpca', 'N');
end
end