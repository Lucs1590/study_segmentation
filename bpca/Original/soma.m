function soma(dataSet, D, num_classes)
PCA_FILE_NAME = 'pca.mat';
if exist(PCA_FILE_NAME,'file') > 0
    load(PCA_FILE_NAME);
else
    [eigenvectors, eigenvalues, meanFace] = kl1_base(dataSet, num_classes);
    save(PCA_FILE_NAME, 'eigenvectors', 'eigenvalues', 'meanFace');
end
pcaBase = eigenvectors(:, 1:D);
clear eigenvectors;
clear eigenvalues;
dsPCA = dataSet - repmat(meanFace, size(dataSet, 1), 1);
dsPCA = dsPCA * pcaBase;
clear pcaBase;
clear meanFace;

for Ni = 3 : 9
    %Regularized PCA->Regularized LDA->Max_Ver
    disp('Regularized PCA->Regularized LDA->Max_ver');
    [covariance_matrix, m, M, N] = mixed_looc2(dsPCA, Ni, num_classes, D);
    ldaBase = pca_lda(Ni, covariance_matrix, m, M, num_classes, N);
    dsLDA = dsPCA * ldaBase;
    clear ldaBase;
    [covariance_matrix, m, M, N] = mixed_looc2(dsLDA, Ni, num_classes, D);
    [taxa_acerto1, S1, results1] = holdout(dsLDA, covariance_matrix, m, Ni, num_classes);
    filename = ['rpca_rlda_maxver_' int2str(Ni) '_holdout.mat'];
    save(filename, 'taxa_acerto1', 'S1', 'results1');
    taxa_acerto1
    %[covariance_matrix, m, M, N] = covariance(dataSet, Ni, pcaBase, meanFace, num_classes); 
%    base = pcaBase;
%     
     
     
%     clear ldaBase;
%    
[taxa_acerto1, S1, results1] = holdout_pca(dataSet, base, covariance_matrix, m, meanFace, Ni, num_classes);
    %
    filename = ['lda_L2_' int2str(Ni) '_holdout.mat'];
    
    %load(filename);
    
    menor = min(min(min(S1)));
    maior = max(max(max(S1)));
    S1 = (S1 - menor) / (maior - menor);
    %S1 = (S1 - menor) / (maior - menor) * 100;
    %S1 = log(1 + S1);
    %S1 = S1 / maior;
    %      for i = 1 : 40
    %         for j = Ni + 1 : 10
    %             soma = sum(exp(S1(i, j, :)));
    %             S1(i, j, :) = exp(S1(i, j, :)) / soma;
    %         end
    %      end

    %
    %     %BlockPCA->Max_Ver
    %      disp('BlockPCA->Max_Ver');
    % %     [covariance_matrix, m, sigma_i, M, N] = mixed_looc2_bpca(Ni);
    % %     [taxa_acerto2, S2, results2] = holdout_bpca(covariance_matrix, m, Ni);
    %      filename = ['bpca_maxver_' int2str(Ni) '_holdout.mat'];
    %      %save(filename, 'taxa_acerto2', 'S2', 'results2');
    %      load(filename);
    %      taxa_acerto2
    %      menor = min(min(min(S2)));
    %      maior = max(max(max(S2)));
    %      S2 = (S2 - menor) / (maior - menor);
    %      %S2 = (S2 - menor) / (maior - menor) * 100;
    %      %S2 = log(1 + S2);
    %      %S2 = S2 / maior;
    % %     for i = 1 : 40
    % %         for j = Ni + 1 : 10
    % %             soma = sum(exp(S2(i, j, :)));
    % %             S2(i, j, :) = exp(S2(i, j, :)) / soma;
    % %         end
    % %     end
    %
    % %     %KL3->NN
    %      disp('KL3->NN');
    % %     [pcaBase, meanFace] = kl3_base(Ni);
    % %     [taxa_acerto3, S3, results3] = holdout_knn(pcaBase, Ni);
    %      filename = ['kl3_nn_' int2str(Ni) '_holdout.mat'];
    %      %save(filename, 'taxa_acerto3', 'S3', 'results3');
    %      load(filename);
    %      taxa_acerto3
    %      menor = min(min(min(S3)));
    %      maior = max(max(max(S3)));
    %      S3 = 1 - (S3 - menor) / (maior - menor);
    %      %S3 = 100 - (S3 - menor) / (maior - menor) * 100;
    %      %S3 = log(1 + S3);
    %      %S3 = 1 - S3 / maior;
    % %      for i = 1 : 40
    % %         for j = Ni + 1 : 10
    % %             soma = sum(S3(i, j, :));
    % %             S3(i, j, :) = 1 - S3(i, j, :) / soma;
    % %         end
    % %      end
    %
    % %
    % %     %KL4->NN
    %     disp('KL4->NN');
    % %     [pcaBase, meanFace] = kl4_base(Ni);
    % %     [taxa_acerto4, S4, results4] = holdout_knn(pcaBase, Ni);
    %     filename = ['kl4_nn_' int2str(Ni) '_holdout.mat'];
    %     %save(filename, 'taxa_acerto4', 'S4', 'results4');
    %     load(filename);
    %     taxa_acerto4
    %      menor = min(min(min(S4)));
    %      maior = max(max(max(S4)));
    %      S4 = 1 - (S4 - menor) / (maior - menor);
    %      %S4 = 100 - (S4 - menor) / (maior - menor) * 100;
    %      %S4 = log(1 + S4);
    %      %S4 = 1 - S4 / maior;
    % %      for i = 1 : 40
    % %         for j = Ni + 1 : 10
    % %             soma = sum(S4(i, j, :));
    % %             S4(i, j, :) = 1 - S4(i, j, :) / soma;
    % %         end
    % %      end
    % %
    % %     %KL5->NN
    %      disp('KL5->NN');
    % %     [pcaBase, meanFace] = kl5_base(Ni);
    % %     [taxa_acerto5, S5, results5] = holdout_knn(pcaBase, Ni);
    %      filename = ['kl5_nn_' int2str(Ni) '_holdout.mat'];
    %      %save(filename, 'taxa_acerto5', 'S5', 'results5');
    %      load(filename);
    %      taxa_acerto5
    %      menor = min(min(min(S5)));
    %      maior = max(max(max(S5)));
    %      S5 = 1 - (S5 - menor) / (maior - menor);
    %      %S5 = 100 - (S5 - menor) / (maior - menor) * 100;
    %      %S5 = log(1 + S5);
    %      %S5 = 1 - S5 / maior;
    % %      for i = 1 : 40
    % %         for j = Ni + 1 : 10
    % %             soma = sum(S5(i, j, :));
    % %             S5(i, j, :) = 1 - S5(i, j, :) / soma;
    % %         end
    % %      end
    % %
    % %     %normalizacao
    % %      acerto = taxa_acerto1 + taxa_acerto2 + taxa_acerto3 + taxa_acerto4 + taxa_acerto5;
    % %      S1 = S1 * taxa_acerto1 / acerto;
    % %      S2 = S2 * taxa_acerto2 / acerto;
    % %      S3 = S3 * taxa_acerto3 / acerto;
    % %      S4 = S4 * taxa_acerto4 / acerto;
    % %      S5 = S5 * taxa_acerto5 / acerto;
    %      taxa_acerto1
    %      taxa_acerto2
    %      taxa_acerto3
    %      taxa_acerto4
    %      taxa_acerto5
    %      taxa_acerto = holdout_soma(Ni, S1, S2, S3, S4, S5)
    %      pause;
end
end