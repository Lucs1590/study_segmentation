function ar_database()
    d = 'databases/ar_warp/test2/';
    files = dir([d '*.bmp']);
    
    for i = 1:2600
        if mod(i, 26) == 1
            dirname = int2str(ceil(i /26));
            mkdir([d dirname]);
        end
        
        movefile([d files(i).name], [d dirname]);
    end
    
end