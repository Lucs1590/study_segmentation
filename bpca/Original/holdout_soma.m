function [taxa_acerto] = holdout_soma(Ni, S1, S2, S3, S4, S5)
    tic;
    disp('TESTE');
    
    correct = 0;
    total = 0;
   
    %results(classe, imagem), acertou?, chute);

    for i = 1 : 40
            %j = leave_one_out;
            for j = Ni + 1 : 10
                total = total + 1;
                
                %soma ou soma ponderada
                soma = S1(i, j, :) + S2(i, j, :) + S3(i, j, :) + S4(i, j, :) + S5(i, j, :);
                %produto
                %soma = S1(i, j, :) .* S2(i, j, :) .* S3(i, j, :) .* S4(i, j, :) .* S5(i, j, :);
                %max
%                 soma = S1(i, j, :);
%                 for k = 1 : 40
%                     if (S2(i, j, k) > soma (1, 1, k))
%                         soma(1, 1, k) = S2(i, j, k);
%                     end
%                     if (S3(i, j, k) > soma (1, 1, k))
%                         soma(1, 1, k) = S3(i, j, k);
%                     end
%                     if (S4(i, j, k) > soma (1, 1, k))
%                         soma(1, 1, k) = S4(i, j, k);
%                     end
%                     if (S5(i, j, k) > soma (1, 1, k))
%                         soma(1, 1, k) = S5(i, j, k);
%                     end
%                end
                %min
%                 soma = S1(i, j, :);
%                 for k = 1 : 40
%                     if (S2(i, j, k) < soma (1, 1, k))
%                         soma(1, 1, k) = S2(i, j, k);
%                     end
%                     if (S3(i, j, k) < soma (1, 1, k))
%                         soma(1, 1, k) = S3(i, j, k);
%                     end
%                     if (S4(i, j, k) < soma (1, 1, k))
%                         soma(1, 1, k) = S4(i, j, k);
%                     end
%                     if (S5(i, j, k) < soma (1, 1, k))
%                         soma(1, 1, k) = S5(i, j, k);
%                     end
%                end

                %mediana
%                 for k = 1 : 40
%                     temp(1) = S1(i, j, k);
%                     temp(2) = S2(i, j, k);
%                     temp(3) = S3(i, j, k);
%                     temp(4) = S4(i, j, k);
%                     temp(5) = S5(i, j, k);
%                     temp = sort(temp);
%                     soma(1, 1, k) = temp(3);
%                     %soma(1, 1, k) = (temp(2) + temp(3)) / 2;
%                     %soma(1, 1, k) = temp(2);
%                     %soma(1, 1, k) = (temp(1) + temp(2)) / 2;
%                 end
                %vote rule
%                 soma = zeros(1, 1, 40);
%                 [values, class] = max(S1(i, j, :));
%                 soma(1, 1, class) = soma(1, 1, class) + 1;
%                 [values, class] = max(S2(i, j, :));
%                 soma(1, 1, class) = soma(1, 1, class) + 1;
%                 [values, class] = max(S3(i, j, :));
%                 soma(1, 1, class) = soma(1, 1, class) + 1;
%                 [values, class] = max(S4(i, j, :));
%                 soma(1, 1, class) = soma(1, 1, class) + 1;
%                 [values, class] = max(S5(i, j, :));
%                 soma(1, 1, class) = soma(1, 1, class) + 1;
                
                [values, class] = max(soma);
                
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