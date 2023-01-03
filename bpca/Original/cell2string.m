function str = cell2string(cell, div)
length(cell)
    if length(cell) > 0
        str = cell{1};
    
        for i = 2 : length(cell)
            str = [str div cell{i}]
        end
    end
end