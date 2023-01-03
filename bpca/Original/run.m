function run()
%===== DATABASE =====
%ORL Database
display('Load ORL Database...');
dataSet = loadDataSet();

%===== FEATURE EXTRACTION =====
D = 99;
num_classes = 100;

feature_extraction(D, dataSet, num_classes);

%========== HOLDOUT ==========
%===== CLASSICATION =====
classification(num_classes);

%===== CLASSIFIERS COMBINING =====
%===== NORMALIZATION =====
combination(num_classes);

%===== REPORTS =====
%Kappa
%Estatística Z
%Estatística T
%Gráfico FERET (Ranking Acumulado)
end