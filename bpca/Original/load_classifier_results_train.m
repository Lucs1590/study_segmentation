function [classifiers_results, pesos, cnames] = load_classifier_results_train(Ni, v)
i = 1;
K = 1;

for j = 1 : size(v, 2)
    
    switch v(j)
        case 1
            cnames{i} = 'RBPCA';
            RESULTS_RBPCA_FILE_NAME = ['results_rbpca_N' int2str(Ni) '_train.mat'];
            load(RESULTS_RBPCA_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
            %         case 2
            %             cnames{i} = 'RPCA';
            %             RESULTS_RPCA_FILE_NAME = ['results_rpca_N' int2str(Ni) '_train.mat'];
            %             load(RESULTS_RPCA_FILE_NAME);
            %             menor = min(min(min(similarities)));
            %             maior = max(max(max(similarities)));
            %             similarities = (similarities - menor) / (maior - menor);
            %             classifiers_results{i} = similarities;
            %             pesos(i) = taxa_acerto;
            %             i = i + 1;
            %
            %         case 3
            %             cnames{i} = 'RLDA_PCA';
            %             RESULTS_RLDA_PCA_FILE_NAME = ['results_rlda_pca_N' int2str(Ni) '_train.mat'];
            %             load(RESULTS_RLDA_PCA_FILE_NAME);
            %             menor = min(min(min(similarities)));
            %             maior = max(max(max(similarities)));
            %             similarities = (similarities - menor) / (maior - menor);
            %             classifiers_results{i} = similarities;
            %             pesos(i) = taxa_acerto;
            %             i = i + 1;
            
        case 2
            cnames{i} = 'RLDA_RPCA';
            RESULTS_RLDA_RPCA_FILE_NAME = ['results_rlda_rpca_N' int2str(Ni) '_train.mat'];
            load(RESULTS_RLDA_RPCA_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
        case 3
            
            cnames{i} = 'PCA';
            RESULTS_PCA_FILE_NAME = ['results_pca_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            load(RESULTS_PCA_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = 1 - (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
        case 4
            cnames{i} = 'KL2';
            RESULTS_KL2_FILE_NAME = ['results_kl2_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            load(RESULTS_KL2_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = 1 - (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
        case 5
            cnames{i} = 'KL3';
            RESULTS_KL3_FILE_NAME = ['results_kl3_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            load(RESULTS_KL3_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = 1 - (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
        case 6
            cnames{i} = 'KL4';
            RESULTS_KL4_FILE_NAME = ['results_kl4_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            load(RESULTS_KL4_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = 1 - (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
        case 7
            cnames{i} = 'KL5';
            RESULTS_KL5_FILE_NAME = ['results_kl5_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            load(RESULTS_KL5_FILE_NAME);
            menor = min(min(min(similarities)));
            maior = max(max(max(similarities)));
            similarities = 1 - (similarities - menor) / (maior - menor);
            classifiers_results{i} = similarities;
            pesos(i) = taxa_acerto;
            i = i + 1;
            
            %         case 10
            %             cnames{i} = 'LDA_PCA';
            %             RESULTS_LDA_PCA_FILE_NAME = ['results_lda_pca_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            %             load(RESULTS_LDA_PCA_FILE_NAME);
            %             menor = min(min(min(similarities)));
            %             maior = max(max(max(similarities)));
            %             similarities = 1 - (similarities - menor) / (maior - menor);
            %             classifiers_results{i} = similarities;
            %             pesos(i) = taxa_acerto;
            %             i = i + 1;
            %
            %         case 11
            %             cnames{i} = 'LDA_RPCA';
            %             RESULTS_LDA_RPCA_FILE_NAME = ['results_lda_rpca_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            %             load(RESULTS_LDA_RPCA_FILE_NAME);
            %             menor = min(min(min(similarities)));
            %             maior = max(max(max(similarities)));
            %             similarities = 1 - (similarities - menor) / (maior - menor);
            %             classifiers_results{i} = similarities;
            %             pesos(i) = taxa_acerto;
            %             i = i + 1;
            %
            %         case 12
            %             cnames{i} = 'BPCA';
            %             RESULTS_BPCA_FILE_NAME = ['results_bpca_N' int2str(Ni) '_K' int2str(K) '_train.mat'];
            %             load(RESULTS_BPCA_FILE_NAME);
            %             menor = min(min(min(similarities)));
            %             maior = max(max(max(similarities)));
            %             similarities = 1 - (similarities - menor) / (maior - menor);
            %             classifiers_results{i} = similarities;
            %             pesos(i) = taxa_acerto;
            %             i = i + 1;
    end
end
end