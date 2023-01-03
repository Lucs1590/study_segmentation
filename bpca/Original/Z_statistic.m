function Z = Z_statistic(KHAT1, var1, KHAT2, var2)
    Z = abs(KHAT1 - KHAT2) / sqrt(var1 + var2);
end