function combination (num_classes)

for i = 2 : 7
    combinacoes = nchoosek(1 : 7, i);
    
    for j = 1 : size(combinacoes, 1)
        
        Ni = 26
        %[classifiers_results_train, pesos_train, cnames] = load_classifier_results_train(Ni, combinacoes(j, :));
        [classifiers_results, pesos, cnames] = load_classifier_results(Ni, combinacoes(j, :));
        
        %Sum Rule
        SUM_FILE = ['results_sum_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(SUM_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = sum_rule(Ni, num_classes, classifiers_results);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(SUM_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        %Weighted Sum Rule
        WEIGHTED_SUM_FILE = ['results_weighted_sum_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(WEIGHTED_SUM_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = weighted_sum_rule(Ni, num_classes, classifiers_results, pesos);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(WEIGHTED_SUM_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        
        %Product Rule
        PRODUCT_FILE = ['results_product_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(PRODUCT_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = product_rule(Ni, num_classes, classifiers_results);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(PRODUCT_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        
        %Maximum Rule
        MAX_FILE = ['results_max_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(MAX_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = max_rule(Ni, num_classes, classifiers_results);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(MAX_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        
        %Minimum Rule
        MIN_FILE = ['results_min_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(MIN_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = min_rule(Ni, num_classes, classifiers_results);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(MIN_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        
        %Median Rule
        MEDIAN_FILE = ['results_median_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(MEDIAN_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = median_rule(Ni, num_classes, classifiers_results);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(MEDIAN_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        
        %Majorite Vote Rule
        MAJORITE_VOTE_FILE = ['results_majorite_vote_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        %if exist(MAJORITE_VOTE_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = majorite_vote_rule(Ni, num_classes, classifiers_results);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(MAJORITE_VOTE_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        
        %Decision Templates
        DECISION_TEMPLATES_FILE = ['results_decision_templates_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        [decisionProfiles] = generateDecisionProfiles(classifiers_results, Ni, num_classes);
        [decisionTemplates] = generateDecisionTemplates(decisionProfiles, num_classes, Ni);
        %if exist(DECISION_TEMPLATES_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = decision_templates(Ni, num_classes, classifiers_results, decisionTemplates);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(DECISION_TEMPLATES_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
        %Dempster-Shafer
        DEMPSTER_SHAFER_FILE = ['results_dempster_shafer_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        [decisionProfiles] = generateDecisionProfiles(classifiers_results, Ni, num_classes);
        [decisionTemplates] = generateDecisionTemplates(decisionProfiles, num_classes, Ni);
        %if exist(DEMPSTER_SHAFER_FILE, 'file') <= 0
        [taxa_acerto, similarities, results] = dempster_shafer(Ni, num_classes, classifiers_results, decisionTemplates);
        [KHAT, variance] = kappa(results, num_classes, Ni);
        save(DEMPSTER_SHAFER_FILE, 'taxa_acerto', 'similarities', 'results', 'KHAT', 'variance');
        %end
        
    end
end
end

%length(classifiers_results)
