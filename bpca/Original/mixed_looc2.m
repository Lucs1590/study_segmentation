function [covariance_matrix, m, M, N] = mixed_looc2(dataSet, Ni, num_classes, D)
tic;
disp('Carregando imagens e calculando Si e S...');
N = num_classes * Ni;
M = zeros(1, D);
sigma_i = zeros(D, D, num_classes);

%112, 92
for i = 1 : num_classes
    ds = partition(dataSet, 1:Ni, i);
    M = M + sum(ds);
    m(i, :) = mean(ds);
    ds = ds - repmat(m(i, :), size(ds, 1), 1);
    sigma_i(:, :, i) = cov(ds'');
    clear ds;
end

M = M / N;

disp('Si''s calculados...');

dimensionality = D ^ 2;

I = eye(D);

covariance_matrix = zeros(D, D, num_classes);

S = mean(sigma_i, 3);

disp('Estimando parâmetros e matrizes regularizadas...');

A = zeros(D, D, 6, Ni);
B = zeros(D, D, 2, Ni);

for i = 1 : num_classes     
    ds = partition(dataSet, 1:Ni, i);

    %disp('Calculando m_ik e sigma_ik da classe...');
    
    sigma_ik = zeros(D, D, Ni);
    m_ik = zeros(Ni, D);
    
    for k = 1 : Ni
        ds2 = partition(ds, cat(2, 1:k - 1, k + 1:Ni), 1);
        m_ik(k, :) = mean(ds2);
        ds2 = ds2 - repmat(m_ik(k, :), size(ds2, 1), 1);
        sigma_ik(:, :, k) = cov(ds2'');
        clear ds2;

        %disp('Calculando A''s e B''s dependentes de S_ik...');

        A(:, :, 1, k) = trace(sigma_ik(:, :, k)) / dimensionality * I;
        A(:, :, 2, k) = diag(diag(sigma_ik(:, :, k)));
        A(:, :, 3, k) = sigma_ik(:, :, k);
        B(:, :, 1, k) = sigma_ik(:, :, k);
    end
    
    %disp('Calculando LOOL''s de Alfa...');
    resp.alfa_final = 0;
    resp.LOOL_max = -inf;
    resp.A = 3;
    resp.B = 1;
    
    for alfa = 0 : 0.05 : 1
        %alfa
        if alfa == 2
            continue;
        end
        
        Sp_ik = zeros(D, D, Ni);

        for k = 1 : Ni
            fi = Ni - 1;
            t = ((alfa - 1) * fi - alfa * (dimensionality + 1)) / (2 - alfa);

            fi_k = Ni - 2;
            t_k = ((alfa - 1) * fi_k - alfa * (dimensionality + 1)) / (2 - alfa);

            factor = fi / (fi + t - dimensionality - 1);
            factor_k = fi_k / (fi_k + t_k - dimensionality - 1);


            %disp('Calculando Sp''s...');

            for j = 1 : num_classes
                if j ~= i
                    Sp_ik(:, :, k) = Sp_ik(:, :, k) + factor * sigma_i(:, :, j);
                else
                    Sp_ik(:, :, k) = Sp_ik(:, :, k) + factor_k * sigma_ik(:, :, k);
                end
            end

            Sp_ik(:, :, k) = 1 / ((num_classes - 1) * factor + factor_k) * Sp_ik(:, :, k);

            %disp('Calculando A''s e B''s dependentes de Sp...');
            A(:, :, 4, k) = trace(Sp_ik(:, :, k)) / dimensionality * I;
            A(:, :, 5, k) = diag(diag(Sp_ik(:, :, k)));
            A(:, :, 6, k) = Sp_ik(:, :, k);

            B(:, :, 2, k) = diag(diag(Sp_ik(:, :, k)));

            
        end

        clear Sp_ik;
        
        %disp('Calculados...');
        %disp('Calculando LOOL...');

        for a = 1 : 6
            for b = 1 : 2
                %a
                %b
                %disp('1');
                %----LOOL(a * b, alfa / 0.05 + 1) = 0;
                LOOL = 0;
                %disp('2');
                
                for k = 1 : Ni
                    %disp('3');
                    cov_ik = alfa * A(:, :, a, k) + (1 - alfa) * B(:, :, b, k);
                    %disp('4...LN_F');
                    determ = det(cov_ik);
                    if determ == 0
                        %disp('Singular')
                        break;
                    else
                        mahalanobis = (ds.data(k, :) - m_ik(k, :)) * inv(cov_ik) * (ds.data(k, :) - m_ik(k, :))';
                        ln_f = - dimensionality / 2 * log (2 * pi) - 0.5 * log (determ) - 0.5 * mahalanobis;
                    end
                    %disp('5');
                    %----LOOL(a * b, alfa / 0.05 + 1) = LOOL(a * b, alfa / 0.05 + 1) + ln_f
                    LOOL = LOOL + ln_f;
                    %disp('6');
                end
                
                if determ == 0
                    %disp('Entrou');
                    continue;
                end
                
                %disp('7');
                %-----LOOL(a * b, alfa / 0.05 + 1) = 1 / Ni * LOOL(a * b, alfa / 0.05 + 1)
                LOOL = 1 / Ni * LOOL;
                %disp('8');

                %----if LOOL(a * b, alfa / 0.05 + 1) >= resp.LOOL_max
                if LOOL >= resp.LOOL_max
                    %disp('9');
                    %---resp.LOOL_max = LOOL(a * b, alfa / 0.05 + 1);
                    resp.LOOL_max = LOOL;
                    %disp('10');
                    resp.alfa_final = alfa;
                    %disp('11');
                    resp.A = a;
                    %disp('12');
                    resp.B = b;
                    %disp('13');
                end
                %disp('14');
            end
        end
        %disp('Cálculo para mais um alfa concluído...');
    end

    disp ('Cálculo para mais uma classe finalizado...');

    clear sigma_ik;
    clear m_ik;
    %clear A;
    %clear B;

    %for alfa = 0 : 0.05 : 3
    %    figure;
    %    plot (LOOL(:, alfa / 0.05 + 1));
    %end

    clear LOOL;

    A(:, :, 1) = trace(sigma_i(:, :, i)) / dimensionality * I;
    A(:, :, 2) = diag(diag(sigma_i(:, :, i)));
    A(:, :, 3) = sigma_i(:, :, i);
    A(:, :, 4) = trace(S) / dimensionality * I;
    A(:, :, 5) = diag(diag(S));
    A(:, :, 6) = S;
    B(:, :, 1) = sigma_i(:, :, i);
    B(:, :, 2) = diag(diag(S));

    i
    resp

    covariance_matrix(:, :, i) = resp.alfa_final * A(:, :, resp.A) + (1 - resp.alfa_final) * B(:, :, resp.B);
    %pause;

    %disp('Matriz de covariância para a classe i encontrado...');

    
    %disp('Pausando...');
end

disp('Processamento Finalizado...');

clear sigma_i;
clear dataSet;
clear A;
clear B;
clear ln_f;
clear resp;
clear S;
clear ds;
clear pcaBase;
clear meanFace;

toc;
end