function T = T_statistic(KHAT1, KHAT2)
    T = mean(KHAT1 - KHAT2) / (std(KHAT1 - KHAT2) / size(KHAT1, 1));
end