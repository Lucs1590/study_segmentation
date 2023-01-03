function [kl4base, meanFace] = kl4(ds, Ni, num_classes, D)

%KL4
    display('Generate Karhunen-Loève 4 (KL4) basis...');
    KL4_FILE_NAME = ['kl4_N' int2str(Ni) '.mat'];
    if exist(KL4_FILE_NAME,'file') > 0
        load(KL4_FILE_NAME);
    else
        [eigenvectors, eigenvalues, meanFace, H] = kl4_base(ds, Ni, num_classes);
        save(KL4_FILE_NAME, 'eigenvectors', 'eigenvalues', 'meanFace', 'H');
    end
    kl4base = eigenvectors(:, 1:D);
    clear eigenvectors;
    clear eigenvalues;
    clear H;
end