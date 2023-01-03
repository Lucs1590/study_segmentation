function [KHAT, variance] = kappa(results, num_classes, Ni)
    % Calculo da Matriz de Confusao
    confusion_matrix = zeros(num_classes);
    
    for i = 1 : num_classes
        for j = 1 : Ni
            confusion_matrix(results(i, j).value, i) = confusion_matrix(results(i, j).value, i) + 1;
        end
    end
    
    lines_sum = sum(confusion_matrix, 2);
    cols_sum = sum(confusion_matrix, 1);
    
    % Calculo do KHAT
    num_acertos = sum(diag(confusion_matrix));
    
    relacao = 0;
    for i = 1 : num_classes
        relacao = relacao + lines_sum(i) * cols_sum(i);
    end
    
    n = sum(lines_sum);
    
    KHAT = (n * num_acertos - relacao) / (n ^ 2 - relacao);
    
    % Calculo da Variancia
    teta1 = 1 / n * num_acertos;
    
    teta2 = 1 / n ^ 2 * relacao;
    
    teta3 = 0;
    for i = 1 : num_classes
        teta3 = teta3 + confusion_matrix(i, i) * (lines_sum(i) + cols_sum(i));
    end
    teta3 = 1 / n ^ 2 * teta3;
    
    teta4 = 0;
    for i = 1 : num_classes
        for j = 1 : num_classes
            teta4 = teta4 + confusion_matrix(i, j) * (lines_sum(j) + cols_sum(i)) ^ 2;
        end
    end
    teta4 = 1 / n ^ 3 * teta4;
    
    t1 = teta1 * (1 - teta1) / (1 - teta2) ^ 2;
    t2 = 2 * (1 - teta1) * (2 * teta1 * teta2 - teta3) / (1 - teta2) ^ 3;
    t3 = (1 - teta1) ^  2 * (teta4 - 4 * teta2 ^ 2) / (1 - teta2) ^ 4;
    variance = 1 / n * (t1 + t2 + t3);
end