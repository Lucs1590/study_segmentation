function ldaBase = pca_lda(Ni, covariance_matrix, m, M, num_classes, N)
tic;
disp('Carregando imagens e calculando Si e S...');
D = size(M, 2);

Sw = Ni / N * sum(covariance_matrix, 3);
m = m - repmat(M, num_classes, 1);
Sb = Ni / N * cov(m);

clear Ni;
clear N;
clear m;
clear M;

%Testando a inversa - MUDAR
[eigenvectors, eigenvalues] = eig (inv(Sw) * Sb);

clear Sb;
clear Sw;

ldaBase = zeros(D, num_classes - 1);

for i = 1 : num_classes - 1
    ldaBase(:, i) = eigenvectors(:, num_classes - i);
end;

clear eigenvectors;
clear eigenvalues;

toc;
end