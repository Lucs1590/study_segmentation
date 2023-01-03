function [decisionTemplates] = generateDecisionTemplates(decisionProfiles, num_classes, Ni)
    for i = 1 : num_classes
        decisionTemplates{i} = zeros(size(decisionProfiles{1,1}));
        
        for j = 1 : Ni
            decisionTemplates{i} = decisionTemplates{i} + decisionProfiles{i, j};
        end
        
        decisionTemplates{i} = 1 / Ni * decisionTemplates{i};
    end
end