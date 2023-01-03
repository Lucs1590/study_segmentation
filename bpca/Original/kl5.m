function [kl5base, meanFace] = kl5(ds, Ni, num_classes)

%KL5
    display('Generate Karhunen-Loève 5 (KL5) basis...');
    KL5_FILE_NAME = ['kl5_N' int2str(Ni) '.mat'];
    if exist(KL5_FILE_NAME,'file') > 0
        load(KL5_FILE_NAME);
    else
        [eigenvectors, eigenvalues, meanFace, kl5base] = kl5_base(ds, Ni, num_classes);
        save(KL5_FILE_NAME, 'eigenvectors', 'eigenvalues', 'meanFace', 'kl5base');
    end
    clear eigenvectors;
    clear eigenvalues;
end