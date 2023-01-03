function reports ()

for i = 2 : 7
    combinacoes = nchoosek(1 : 7, i);
    
    for j = 1 : size(combinacoes, 1)
    
   Ni = 26
        cnames = load_names(Ni, combinacoes(j, :));
        
        %Sum Rule
        SUM_FILE = ['results_sum_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];               
        load(SUM_FILE);
        txSum{i, j}(Ni) = taxa_acerto;
        khatSum{i, j}(Ni) = KHAT;
        varSum{i, j}(Ni) = variance;
        series{i, j}(1, :) = gera_grafico(results);
        
        %Weighted Sum Rule
        WEIGHTED_SUM_FILE = ['results_weighted_sum_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(WEIGHTED_SUM_FILE);
        txWSum{i, j}(Ni) = taxa_acerto;
        khatWSum{i, j}(Ni) = KHAT;
        varWSum{i, j}(Ni) = variance;
        series{i, j}(2, :) = gera_grafico(results);
        
        %Product Rule
        PRODUCT_FILE = ['results_product_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(PRODUCT_FILE);
        txProduct{i, j}(Ni) = taxa_acerto;
        khatProduct{i, j}(Ni) = KHAT;
        varProduct{i, j}(Ni) = variance;
        series{i, j}(3, :) = gera_grafico(results);
        
        %Maximum Rule
        MAX_FILE = ['results_max_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(MAX_FILE);
        txMax{i, j}(Ni) = taxa_acerto;
        khatMax{i, j}(Ni) = KHAT;
        varMax{i, j}(Ni) = variance;
        series{i, j}(4, :) = gera_grafico(results);
        
        %Minimum Rule
        MIN_FILE = ['results_min_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(MIN_FILE);
        txMin{i, j}(Ni) = taxa_acerto;
        khatMin{i, j}(Ni) = KHAT;
        varMin{i, j}(Ni) = variance;
        series{i, j}(5, :) = gera_grafico(results);
        
        %Median Rule
        MEDIAN_FILE = ['results_median_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(MEDIAN_FILE);
        txMedian{i, j}(Ni) = taxa_acerto;
        khatMedian{i, j}(Ni) = KHAT;
        varMedian{i, j}(Ni) = variance;
        series{i, j}(6, :) = gera_grafico(results);
        
        %Majorite Vote Rule
        MAJORITE_VOTE_FILE = ['results_majorite_vote_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(MAJORITE_VOTE_FILE);
        txMV{i, j}(Ni) = taxa_acerto;
        khatMV{i, j}(Ni) = KHAT;
        varMV{i, j}(Ni) = variance;
        series{i, j}(7, :) = gera_grafico(results);
        
        %Decision Templates
        DECISION_TEMPLATES_FILE = ['results_decision_templates_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(DECISION_TEMPLATES_FILE);
        txDT{i, j}(Ni) = taxa_acerto;
        khatDT{i, j}(Ni) = KHAT;
        varDT{i, j}(Ni) = variance;
        series{i, j}(8, :) = gera_grafico(results);
        
        %Dempster-Shafer
        DEMPSTER_SHAFER_FILE = ['results_dempster_shafer_N' int2str(Ni) '_' cell2string(cnames, '-') '.mat'];
        load(DEMPSTER_SHAFER_FILE);
        txDS{i, j}(Ni) = taxa_acerto;
        khatDS{i, j}(Ni) = KHAT;
        varDS{i, j}(Ni) = variance;
        series{i, j}(9, :) = gera_grafico(results);
    end
end
save ('summary_results.mat');
end
