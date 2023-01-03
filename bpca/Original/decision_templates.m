function [taxa_acerto, similarities, results] = decision_templates(Ni, num_classes, classifiers_results, decisionTemplates)
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
                
                decisionProfileOfX = zeros(length(classifiers_results), num_classes);
            
                for k = 1 : length(classifiers_results)
                    decisionProfileOfX(k, :) = reshape(classifiers_results{k}(i, j, :), 1, num_classes);
                end
                    
               
                soma = zeros(num_classes, 1);
                
                for a = 1 : num_classes
                    soma(a) = 1 - 1/(length(classifiers_results) * num_classes) * sum(sum((decisionTemplates{a} - decisionProfileOfX) .^ 2));
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