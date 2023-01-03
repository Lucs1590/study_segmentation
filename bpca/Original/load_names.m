function cnames = load_names(Ni, v)
    
    i = 1;
    K = 1;

for j = 1 : size(v, 2)

    
    switch v(j)
        case 1
            cnames{i} = 'RBPCA';
            i = i + 1;
            
           
        case 2
            cnames{i} = 'RLDA_RPCA';
            i = i + 1;
            
        case 3           
            cnames{i} = 'PCA';            
            i = i + 1;
            
        case 4
            cnames{i} = 'KL2';            
            i = i + 1;
            
        case 5
            cnames{i} = 'KL3';
            i = i + 1;
            
        case 6
            cnames{i} = 'KL4';            
            i = i + 1;
            
        case 7
            cnames{i} = 'KL5';            
            i = i + 1;
            
    end
end
end