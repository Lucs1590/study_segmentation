function dataSet = loadDataSet()
    %dir = 'databases/orl';
    %dir = 'databases/yale';
    dir = 'databases/ar_warp_grayscale_red';
    database = datafile(dir);
    dataSet = dataset(database);
end