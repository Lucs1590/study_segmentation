function [eigenvectors, eigenvalues, meanFace, pcaBase, J] = kl3_base(dataSet, Ni, num_classes)
    tic;
    [N, D] = size(dataSet);
    meanFace = mean(dataSet);
    dataSet = dataSet - repmat(meanFace, size(dataSet,1), 1);
    
    EIG_SW_FILE = ['EIG_Sw_N' int2str(Ni) '.mat'];
    
    if exist(EIG_SW_FILE,'file') > 0
        load(EIG_SW_FILE);
    end
    
    %sigma_i = zeros(D, D, num_classes);
    
    for i = 1 : num_classes
        ds = partition(dataSet, 1:Ni, i);
        m(i, :) = mean(ds);
        %ds = ds - repmat(m, size(ds, 1), 1);
        %sigma_i(:, :, i) = cov(ds'');
        clear ds;
    end
    
    %Sw = Ni / N * sum(sigma_i, 3); 
    %clear sigma_i;
    
    SB_FILE = ['Sb_N' int2str(Ni) '.mat'];
    
    if exist(SB_FILE,'file') > 0
        load(SB_FILE);
    else
        m = m - repmat(meanFace, num_classes, 1);
        Sb = Ni / N * cov(m);
    
        clear m;
        
        save(SB_FILE, 'Sb');
    end
    
    %[eigenvectors, eigenvalues] = eig (Sw);
    %clear Sw;
    eigenvalues = flipud(fliplr(eigenvalues));
    eigenvectors = fliplr(eigenvectors);
    
    J = zeros(1, D);
    
    for i = 1 : D
        J(i) = eigenvectors(:, i)' * Sb * eigenvectors(:, i) / eigenvalues (i, i);
    end
    
    clear Sb;
        
    [J, IX] = sort(J, 'descend');
        
    %R = rank(J)
    R = 99;
    %clear J;
    %clear B;
    
    v1 = zeros(size(eigenvectors));
    v2 = zeros(size(eigenvalues));
    
    for i = 1 : D
        v1(:, i) = eigenvectors(:, IX(i));
        v2(:, i) = eigenvalues(:, IX(i));
    end
    
    eigenvectors = v1;
    eigenvalues = v2;
    
    clear v1;
    clear v2;
    clear IX;
        
    %40 autovetores
    for i = 1 : R
        pcaBase(:, i) = eigenvectors(:, i);
    end;
    
    %clear eigenvectors;
    %pause;
    
    toc;
end