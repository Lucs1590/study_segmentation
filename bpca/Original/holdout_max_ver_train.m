function [taxa_acerto, similarities, results] = holdout_max_ver_train(dataSet, covariance_matrix, m, Ni, num_classes)
    tic;
    disp('TESTE');
    disp('Carregando imagens...');
    %112, 92
    
    ds = partition(dataSet, 1:Ni, 1 : num_classes);
    
    size(ds)
    size(covariance_matrix)
    
    D = size(ds, 2);   
    determ = zeros(1, num_classes);
    inverse = zeros(D, D, num_classes);
    
    for i = 1 : num_classes
        determ(i) = det(covariance_matrix(:, :, i));
        inverse(:, :, i) = inv(covariance_matrix(:, :, i));
    end
    
    clear covariance_matrix;
    
    correct = 0;
    total = 0;
    
    similarities = zeros(100, 26, 100);
    
    %results(classe, imagem), acertou?, chute);   
    
    ln_f = zeros(1, num_classes);

    for i = 1 : num_classes
            %j = leave_one_out;
            ds2 = partition(ds, 1 : Ni, i);
            
            for j = 1 : Ni
                x = ds2.data(j, :);
                total = total + 1;
                
                for k = 1 : num_classes
                    mahalanobis = (x - m(k, :)) * inverse(:, :, k) * (x - m(k, :))';
                    ln_f(k) = - num_classes / 2 * log (2 * pi) - 0.5 * log (determ(k)) - 0.5 * mahalanobis;
                end
                
                %ln_f;
                similarities(i, j, :) = ln_f;
                
                [values, class] = max(ln_f);
                
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