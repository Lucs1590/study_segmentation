function [taxa_acerto, similarities, results] = dempster_shafer(Ni, num_classes, classifiers_results, decisionTemplates)
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
                
                %Etapa 1
                medida_proximidade = zeros(num_classes, length(classifiers_results));
                normalizacao = zeros(length(classifiers_results), 1);
                
                for k = 1 : length(classifiers_results) 
                    for a = 1 : num_classes
                        normalizacao(k) = normalizacao(k) + (1 + norm(decisionTemplates{a}(k, :) - decisionProfileOfX(k, :)) ^ 2) ^ (-1);
                    end
                end
                
                for a = 1 : num_classes
                    for k = 1 : length(classifiers_results)
                        medida_proximidade(a, k) = (1 + norm(decisionTemplates{a}(k, :) - decisionProfileOfX(k, :)) ^ 2) ^ (-1) / normalizacao(k);
                    end
                end
                
                % Etapa 2
                crenca = zeros(num_classes, length(classifiers_results));
                for a = 1 : num_classes
                    for k = 1 : length(classifiers_results)
                        produto = 1;
                        for b = 1 : num_classes
                            if b ~= a
                                produto = produto * (1 - medida_proximidade(b, k));
                            end
                        end
                        
                        crenca(a, k) = medida_proximidade(a, k) * produto / (1 - medida_proximidade(a, k) * (1 - produto));
                    end
                end
                
                % Etapa 3 - considerando K igual para todas as classes
               
                soma = ones(num_classes, 1);
                
                for a = 1 : num_classes
                    for k = 1 : length(classifiers_results)
                        soma(a) = soma(a) * crenca(a, k);
                    end
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