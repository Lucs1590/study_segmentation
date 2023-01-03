function [decisionProfiles] = generateDecisionProfiles(classifiers_results, Ni, num_classes)
    decisionProfiles = cell(num_classes, Ni);
    for i = 1 : num_classes
        for j = 1 : Ni            
            decisionProfiles{i, j} = zeros(length(classifiers_results), num_classes);
            
            for k = 1 : length(classifiers_results)
                decisionProfiles{i, j}(k, :) = reshape(classifiers_results{k}(i, j, :), 1, num_classes);
            end
        end
    end        
end