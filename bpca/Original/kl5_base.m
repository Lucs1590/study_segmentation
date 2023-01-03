function [eigenvectors, eigenvalues, meanFace, pcaBase] = kl5_base(dataSet, Ni, num_classes)
    tic;
    %[N, D] = size(dataSet);
    meanFace = mean(dataSet);
    %dataSet = dataSet - repmat(meanFace, size(dataSet,1), 1);
    
    SW_FILE = ['Sw_N' int2str(Ni) '.mat'];
    
    if exist(SW_FILE,'file') > 0
        load(SW_FILE);
    end
    
    %sigma_i = zeros(D, D, num_classes);
    
    %for i = 1 : num_classes
    %    ds = partition(dataSet, 1:Ni, i);
    %    m(i, :) = mean(ds);
        %ds = ds - repmat(m, size(ds, 1), 1);
        %sigma_i(:, :, i) = cov(ds'');
    %    clear ds;
    %end
    
    %Sw = Ni / N * sum(sigma_i, 3); 
    %clear sigma_i;
    
    %m = m - repmat(meanFace, num_classes, 1);
    %Sb = Ni / N * cov(m);
    
    %clear m;
    SB_FILE = ['Sb_N' int2str(Ni) '.mat'];
    
    if exist(SB_FILE,'file') > 0
        load(SB_FILE);
    end
    
    disp ('Calulando o rank de Sw...');
    rankSw = rank(Sw)
    
    %save 'temp.mat';
    %pause;
    
    disp ('Calculando os autovetores e autovalores de Sw...');
    %EIG_SW_FILE = ['EIG_Sw_N' int2str(Ni) '.mat'];
    
    %if exist(EIG_SW_FILE,'file') > 0
    %    load(EIG_SW_FILE);
    %end
    [eigenvectors, eigenvalues] = eigs (Sw, rankSw);
    
    %--eigenvalues = flipud(fliplr(eigenvalues));
    %eigenvectors = fliplr(eigenvectors);
    
    disp('Selecionando os r autovetores associados ao r maiores autovalores de Sw para gerar Ur...')
    %SwNew = zeros(rankSw);
    %for r = 1 : rankSw
    %    U(:, r) = eigenvectors(:, r);
    %end
    U = eigenvectors;
    disp ('Ur gerado...');
    
    clear rankSw;
    clear eigenvectors;
    clear eigenvalues;
   
    disp ('Calculando o lambda_r...'); 
    l = U' * Sw * U;
    
    clear Sw;
    
    disp ('Calculando o Sb''...');
    l = diag(diag(l));
    l2 = l .^ (-0.5); % ou sqrt(inv(l)), pois a matriz é diagonal
    l2 = diag(diag(l2));
    B = U*l2;
    SbNew = B' * Sb * B;
    
    clear Sb;
    clear l2;
    clear l;
    
    disp ('Calculando o rank de Sb''...');
    rankSbNew = rank(SbNew)
    
    disp ('Calculando os autovetores e autovalores de Sb''...');
    [eigenvectors, eigenvalues] = eigs (SbNew, rankSbNew);
    
    %eigenvalues = flipud(fliplr(eigenvalues));
    %eigenvectors = fliplr(eigenvectors);
    
    clear SbNew;
    
    disp('Selecionando os v autovetores associados aos v maiores autovalores de Sb''...');
    %for v = 1 : rankSbNew
    %    V(:, v) = eigenvectors(:, v);
    %end
    V = eigenvectors;
    
    clear rankSbNew;
    %clear eigenvectors;
    %clear eigenvalues;
    
    disp('Gerando A transposto ou a Base PCA transposta...');
    %Já é Transposto pcaBase = AT
    pcaBase = V' * B';
    pcaBase = pcaBase';
    
    clear B;
    clear V;
    %clear SwNew;
    clear U;
    
    toc;
end