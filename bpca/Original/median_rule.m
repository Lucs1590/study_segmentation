function [taxa_acerto, similarities, results] = median_rule(Ni, num_classes, classifiers_results)
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
        
        for c = 1 : num_classes
            temp = zeros(1, length(classifiers_results));
            
            for k = 1 : length(classifiers_results)
                temp(k) = classifiers_results{k}(i, j, c); 
            end
            
            %temp
            
            %temp2 = sort(temp);
            
            %if mod(k, 2) == 0 %par
            %    soma(c) = (temp2(k / 2) + temp2(k / 2 + 1)) / 2;
            %else %ímpar
            %    soma(c) = temp2(ceil(k / 2));
            %end
            soma(c) = median(temp);
        end
        
        %soma
        
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