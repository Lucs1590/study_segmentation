function [kl2base, meanFace] = kl2(ds, Ni, num_classes, D)

%KL2
    display('Generate Karhunen-Loève 2 (KL2) basis...');
    KL2_FILE_NAME = ['kl2_N' int2str(Ni) '.mat'];
    if exist(KL2_FILE_NAME,'file') > 0
        load(KL2_FILE_NAME);
    else
        [eigenvectors, eigenvalues, meanFace] = kl2_base(ds, Ni, num_classes);
        save(KL2_FILE_NAME, 'eigenvectors', 'eigenvalues', 'meanFace');
    end
    kl2base = eigenvectors(:, 1:D);
    clear eigenvectors;
    clear eigenvalues;
end