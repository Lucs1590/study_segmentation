function [taxa_acerto, similarities, results] = sum_rule(Ni, num_classes, classifiers_results)
    tic;
    disp('TESTE');
    
    correct = 0;
    total = 0;
   
    %results(classe, imagem), acertou?, chute);
    similarities = zeros(num_classes, Ni, num_classes);

    for i = 1 : num_classes
            %j = leave_one_out;
            %for j = Ni + 1 : 10
            for j = 1 : Ni
                total = total + 1;
                
                
                %soma ou soma ponderada
                %soma = S1(i, j, :) + S2(i, j, :) + S3(i, j, :) + S4(i, j, :) + S5(i, j, :);
                soma = zeros(num_classes, 1);
                %size(soma)
                %size(classifiers_results)
                %classifiers_results{1}(1,1, :)
                %reshape(classifiers_results{1}(1,1, :), 40, 1)
                for k = 1 : length(classifiers_results)
                    soma = soma + reshape(classifiers_results{k}(i, j, :), num_classes, 1);
                end
                
                [values, class] = max(soma);
                [temp, similarities(i, j, :)] = sort(soma, 'descend');
                
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

    disp('OK');
    
    correct
    total
    
    taxa_acerto = correct / total
    
    toc;
end