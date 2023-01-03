function [eigenvectors, eigenvalues, meanFace] = kl2_base(dataSet, Ni, num_classes)
    tic;
   
    SW_FILE = ['Sw_N' int2str(Ni) '.mat'];
    
    if exist(SW_FILE,'file') > 0
        load(SW_FILE);
    else
        
        [N, D] = size(dataSet);
        meanFace = mean(dataSet);
        dataSet = dataSet - repmat(meanFace, size(dataSet,1), 1);
        
        %sigma_i = zeros(D, D, num_classes);
        sigma_total = zeros(D, D);
        
        for i = 1 : num_classes
            ds = partition(dataSet, 1:Ni, i);
            m = mean(ds);
            ds = ds - repmat(m, size(ds, 1), 1);
            SIGMA_I_FILE = ['Sigma_i' int2str(i) '_N' int2str(Ni) '.mat'];
            if exist(SIGMA_I_FILE, 'file') > 0
                load(SIGMA_I_FILE);
            else
                sigma_i = cov(ds'');
                save(SIGMA_I_FILE, 'sigma_i');
            end
            sigma_total = sigma_total + sigma_i;
            clear ds;
            clear m;
        end
        
        %Sw = Ni / N * sum(sigma_i, 3);
        Sw = Ni / N * sigma_total;
        clear sigma_total;
        
        save(SW_FILE, 'Sw');
    end
        
    %clear sigma_i;
    
    EIG_SW_FILE = ['EIG_Sw_N' int2str(Ni) '.mat'];
    
    if exist(EIG_SW_FILE,'file') > 0
        load(EIG_SW_FILE);
    else
        [eigenvectors, eigenvalues] = eig (Sw);
        clear Sw;
        save(EIG_SW_FILE, 'eigenvectors', 'eigenvalues');
    end
    eigenvalues = flipud(fliplr(eigenvalues));
    eigenvectors = fliplr(eigenvectors);
    
    toc;
end