function [eigenvectors, eigenvalues, meanFace, H] = kl4_base(dataSet, Ni, num_classes)
    tic;
    disp('Carregando imagens e calculando Sw...');
    [N, D] = size(dataSet, 1);
    meanFace = mean(dataSet);
    dataSet = dataSet - repmat(meanFace, size(dataSet,1), 1);
    
    
    EIG_SW_FILE = ['EIG_Sw_N' int2str(Ni) '.mat'];
    
    if exist(EIG_SW_FILE,'file') > 0
        load(EIG_SW_FILE);
    end
    
    %sigma_i = zeros(D, D, num_classes);
    
    for i = 1 : num_classes
        ds = partition(dataSet, 1:Ni, i);
        m = mean(ds);
        %ds = ds - repmat(m, size(ds, 1), 1);
        %sigma_i(:, :, i) = cov(ds'');
        clear ds;
        clear m;
    end
    
    %Sw = Ni / N * sum(sigma_i, 3);
        
    %clear sigma_i;
    
    disp('Calculando os autovetores de Sw');
    %[eigenvectors, eigenvalues] = eig (Sw);
   
    clear img;
    %clear eigenvalues;
    %clear Sw;
    
    
    disp('Calculando as variancias');
    lambda = zeros(num_classes, D);
    for i = 1 : num_classes
        SIGMA_I_FILE = ['Sigma_i' int2str(i) '_N' int2str(Ni) '.mat'];
        if exist(SIGMA_I_FILE, 'file') > 0
            load(SIGMA_I_FILE);
        end
        for j = 1 : D
            %lambda(i, j) = Ni / N * eigenvectors(:, j)' * sigma_i(:, :, i) * eigenvectors(:, j);
            lambda(i, j) = Ni / N * eigenvectors(:, j)' * sigma_i * eigenvectors(:, j);
            %lambda_total = lambda_total + lambda(i, j);
        end
    end
    
    lambda_total = sum(lambda, 1);
    
    clear sigma_i;
    
    disp('Calculando a medida discriminatoria sobre a funcao de entropia logaritmica');
    for j = 1 : D
        H(j) = 0;
        
        for i = 1 : num_classes
            H(j) = H(j) + lambda(i, j) / lambda_total(j)  * log(lambda(i, j) / lambda_total(j));
        end
        
        H(j) = -H(j);
        
    end 
    
    [H, IX] = sort(H, 'ascend');
    
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
    
    toc;
end