function [eigenvectors, eigenvalues, meanFace] = kl1_base(ds, num_classes)
    tic;
    
    display('Select train set...');
    %ds = partition(dataSet, [1], 1 : num_classes);
    display('Calculate train set mean...');
    meanFace = mean(ds);
    display('Centralize train set...');
    ds = ds - repmat(meanFace, size(ds, 1), 1);
    display('Calculate covariance matrix...');
    covariance_matrix = cov(ds'');
    size(covariance_matrix)
    d = size(ds, 2);
    clear ds;
    display('Calculate eigenvectors and eigenvalues...');
    [eigenvectors, eigenvalues] = eig(covariance_matrix);
    clear covariance_matrix;
    eigenvalues = flipud(fliplr(eigenvalues));
    eigenvectors = fliplr(eigenvectors);
    
    toc;
end