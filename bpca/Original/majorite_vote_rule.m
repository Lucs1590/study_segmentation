function [taxa_acerto, similarities, results] = majorite_vote_rule(Ni, num_classes, classifiers_results)
    tic;
    disp('TESTE');
    
    correct = 0;
    total = 0;
   
    %results(classe, imagem), acertou?, chute);
    similarities = zeros(num_classes, Ni, num_classes);

    for i = 1 : num_classes
            %j = leave_one_out;
            for j = 1 : Ni
                total = total + 1;
                
                soma = zeros(num_classes, 1);
                for k = 1 : length(classifiers_results)
                    [values, vote] = max(classifiers_results{k}(i, j, :));
                    soma(vote) = soma(vote) + 1;
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