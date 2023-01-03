function [taxa_acerto, SIMILARITIES, results] = holdout_knn(dataSet, Ni, num_classes, K)
tic;
disp('TESTE');
disp('Carregando imagens...');
%112, 92

ds = partition(dataSet, Ni + 1:26, 1 : num_classes);
%ds = ds - repmat(meanFace, size(ds,1), 1);
%ds = ds * base;
%M = meanFace * base;


correct = 0;
total = 0;

similarities = zeros(100, Ni);
SIMILARITIES = zeros(100, 26, 100);

%K = [1, 3, 5];
%K = [1];

%results(classe, imagem), acertou?, chute);
%total = zeros(1, size(K, 2));
%correct = zeros(1, size(K, 2));

for i = 1 : num_classes
    ds2  = partition(ds, 1 : 26 - Ni, i);
    for j = 1 : 26 - Ni
        x = ds2.data(j, :);
        
        for c = 1 : num_classes
            ds3 = partition(dataSet, 1 : Ni, c);
            for s = 1 : Ni
                similarities(c, s) = norm(x - ds3.data(s, :));
            end
        end
        
        SIMILARITIES(i, j, :) = min(similarities');
        
        %for k = 1 : size(K, 2)
        k_current = K;
        
        if (k_current <= Ni)
            menores.values = zeros(1, k_current);
            menores.indexes.class = zeros(1, k_current);
            menores.indexes.sample = zeros(1, k_current);
            
            %Inicia
            for temp = 1 : k_current
                menores.values(temp) = max(max(similarities));
            end
            
            for c = 1 : num_classes
                for s = 1 : Ni
                    entrou = false;
                    for temp = k_current : - 1 : 1
                        if (similarities(c, s) > menores.values(temp))
                            entrou = true;
                            break;
                        end
                    end
                    
                    if (temp ~= 1 && temp == k_current || k_current == 1 && entrou) %soma 1
                        temp = temp + 1;
                    end
                    
                    for temp2 = k_current : -1 : temp + 1
                        menores.values(temp2) = menores.values(temp2 - 1);
                        menores.indexes.class(temp2) = menores.indexes.class(temp2 - 1);
                        menores.indexes.sample(temp2) = menores.indexes.sample(temp2 - 1);
                    end
                    
                    if (temp <= k_current)
                        menores.values(temp) = similarities(c, s);
                        menores.indexes.class(temp) = c;
                        menores.indexes.sample(temp) = s;
                    end
                end
            end
            
            %Agora tenho o k menores e devo achar a classe
            %escolhida
            
            res = zeros(1, 100);
            
            for temp = 1 : k_current
                res(menores.indexes.class(temp)) = res(menores.indexes.class(temp)) + 1;
            end
            
            [v, class] = max(res);
            
            total = total + 1;
            
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
    
end
%end

clear directories;
clear img;
clear training_set;
clear pcaBase;
disp('OK');

correct
total


taxa_acerto = correct / total


toc;
end