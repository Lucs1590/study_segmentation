function Y = normalize(X, c, d)
    c = double(c);
    d = double(d);
    b = double(max(max(X)));
    a = double(min(min(X)));
    
    Y = c + (X - a) * (d - c) / (b - a);
end