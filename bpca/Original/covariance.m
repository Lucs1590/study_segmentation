function [sigma_i, m, M, N] = covariance(dataSet, Ni, num_classes)
tic;
disp('Carregando imagens e calculando Si e S...');
[N, D] = size(dataSet);
M = mean(dataSet);
sigma_i = zeros(D, D, num_classes);

%112, 92
for i = 1 : num_classes
    ds = partition(dataSet, 1:Ni, i);
    m(i, :) = mean(ds);
    ds = ds - repmat(m(i, :), size(ds, 1), 1);
    sigma_i(:, :, i) = cov(ds'');
    clear ds;
end
toc;
end