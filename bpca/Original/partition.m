%indexes = indices da amostra na classe
function dataSet = partition(dataSet, indexes, classes)   
    num_classes = size(classes, 2);
    indexesInCell = repmat({indexes}, 1, num_classes);
    d = size(dataSet, 2);
    dataSet = seldat(dataSet, classes, 1 : d, indexesInCell);        
end