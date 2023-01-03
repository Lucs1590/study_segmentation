function soma = gera_grafico(results)
    soma = zeros(1,26);
    for i = 1 : 100
        for j = 1 : 26
            if results(i, j).correct == 0
                soma(j) = soma(j) + 1;
            end
        end
    end   
    soma = soma / 100;
end
