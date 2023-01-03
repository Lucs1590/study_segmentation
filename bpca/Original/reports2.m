function reports2()
load('summary_results.mat');

    %%%%%%%%%%%%
    display('Sum');
    for i = 1 : 7
        for j = 1 : 35
            if length(txSum{i, j} > 0)
                medias(i, j) = txSum{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatSum{i, j} > 0)
                medias(i, j) = khatSum{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varSum{i, j} > 0)
                medias(i, j) = varSum{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('WSum');
    for i = 1 : 7
        for j = 1 : 35
            if length(txWSum{i, j} > 0)
                medias(i, j) = txWSum{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatWSum{i, j} > 0)
                medias(i, j) = khatWSum{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varWSum{i, j} > 0)
                medias(i, j) = varWSum{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('Product');
    for i = 1 : 7
        for j = 1 : 35
            if length(txProduct{i, j} > 0)
                medias(i, j) = txProduct{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatProduct{i, j} > 0)
                medias(i, j) = khatProduct{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varProduct{i, j} > 0)
                medias(i, j) = varProduct{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('Max');
    for i = 1 : 7
        for j = 1 : 35
            if length(txMax{i, j} > 0)
                medias(i, j) = txMax{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatMax{i, j} > 0)
                medias(i, j) = khatMax{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varMax{i, j} > 0)
                medias(i, j) = varMax{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('Min');
    for i = 1 : 7
        for j = 1 : 35
            if length(txMin{i, j} > 0)
                medias(i, j) = txMin{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatMin{i, j} > 0)
                medias(i, j) = khatMin{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varMin{i, j} > 0)
                medias(i, j) = varMin{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('Median');
    for i = 1 : 7
        for j = 1 : 35
            if length(txMedian{i, j} > 0)
                medias(i, j) = txMedian{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatMedian{i, j} > 0)
                medias(i, j) = khatMedian{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varMedian{i, j} > 0)
                medias(i, j) = varMedian{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('MV');
    for i = 1 : 7
        for j = 1 : 35
            if length(txMV{i, j} > 0)
                medias(i, j) = txMV{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatMV{i, j} > 0)
                medias(i, j) = khatMV{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varMV{i, j} > 0)
                medias(i, j) = varMV{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('DT');
    for i = 1 : 7
        for j = 1 : 35
            if length(txDT{i, j} > 0)
                medias(i, j) = txDT{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatDT{i, j} > 0)
                medias(i, j) = khatDT{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varDT{i, j} > 0)
                medias(i, j) = varDT{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
    
    %%%%%%%%%%%%
    display('DS');
    for i = 1 : 7
        for j = 1 : 35
            if length(txDS{i, j} > 0)
                medias(i, j) = txDS{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(khatDS{i, j} > 0)
                medias(i, j) = khatDS{i, j}(13);
            end
        end
    end
    medias
    value = max(max(medias))
    I = find(medias == value)
    pause;
    
    for i = 1 : 7
        for j = 1 : 35
            if length(varDS{i, j} > 0)
                medias(i, j) = varDS{i, j}(13);
            end
        end
    end
    medias
    value = min(min(medias))
    I = find(medias == value)
    pause;
end