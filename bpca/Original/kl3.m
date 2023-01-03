function  [kl3base, meanFace] = kl3(ds, Ni, num_classes)

%KL3
    display('Generate Karhunen-Loève 3 (KL3) basis...');
    KL3_FILE_NAME = ['kl3_N' int2str(Ni) '.mat'];
    if exist(KL3_FILE_NAME,'file') > 0
        load(KL3_FILE_NAME);
    else
        [eigenvectors, eigenvalues, meanFace, kl3base, J] = kl3_base(ds, Ni, num_classes);
        save(KL3_FILE_NAME, 'eigenvectors', 'eigenvalues', 'meanFace', 'kl3base', 'J');
    end
    clear eigenvectors;
    clear eigenvalues;
    clear J;
end