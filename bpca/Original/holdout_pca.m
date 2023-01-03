function [taxa_acerto, similarities, results] = holdout_pca(dataSet, base, covariance_matrix, m, meanFace, Ni, num_classes)
    tic;
    disp('TESTE');
    disp('Carregando imagens...');
    %112, 92
    
    galeria = partition(dataSet, 1, 1 : num_classes);
    galeria = galeria - repmat(meanFace, size(galeria, 1), 1);
    galeria = galeria * base;
    
    
    ds = partition(dataSet, Ni + 1:10, 1 : num_classes);
    ds = ds - repmat(meanFace, size(ds, 1), 1);
    ds = ds * base;
    
    clear dataSet;
    
    correct = 0;
    total = 0;
    
    similarities = zeros(40, 10, 40);
    
    %results(classe, imagem), acertou?, chute);   
    
    ln_f = zeros(1, num_classes);

    for i = 1 : num_classes
            %j = leave_one_out;
            ds2 = partition(ds, 1 : 10 - Ni, i);
            
            
            for j = 1 : 10 - Ni
                x = ds2.data(j, :);
                
                total = total + 1;
                
                for k = 1 : num_classes   
                    y = galeria.data(k, :);
                    ln_f(k) = norm(x - y);
                end
                
                %ln_f;
                similarities(i, j, :) = ln_f;
                
                [values, class] = min(ln_f);
                
                if class == i
                    correct = correct + 1;
                    results(i, j).correct = 1;
                    results(i, j).value = i;
                else
                    i
                    j
                    class
                    
                    results(i, j).correct = 0;
                    results(i, j).value = class;
                end
            end
    end

    clear directories;
    clear img;
    clear training_set;
    clear base;
    disp('OK');
    
    correct
    total
    
    taxa_acerto = correct / total
    
    toc;
end