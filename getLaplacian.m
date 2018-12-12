function laplacian = getLaplacian(cl, dom, num)

dim = size(dom);

laplacian = zeros(dim);

[infosA, infosB] = deal(cell(1, 3));

for i = 2:(dim(1) - 1)
    for j = 2:(dim(2)- 1)
        if(dom(i, j) ~= 0)
            num_cent = num(i, j);
            
            [c, a, b] = getCoeff(num(i, j-1), num(i, j+1), num(i+1, j), num(i-1, j), num_cent, dom(i, j), cl(i, j));
            
            infosA{1} = [infosA{1}; num_cent * ones(length(c), 1)];
            infosA{2} = [infosA{2}; c];
            infosA{3} = [infosA{3}; a];
            
            infosB{1} = [infosB{1}; num_cent];
            infosB{2} = [infosB{2}; 1];
            infosB{3} = [infosB{3}; b];
        end
    end
end

matrixA = sparse(infosA{1}, infosA{2}, infosA{3});
matrixB = sparse(infosB{1}, infosB{2}, infosB{3});

tempLaplacian = matrixA\matrixB;

for i = 2:(dim(1) - 1)
    for j = 2:(dim(2)- 1)
        if(dom(i, j) ~= 0)
            laplacian(i, j) = tempLaplacian(num(i, j));
        else
            laplacian(i, j) = NaN;
        end
    end
end

end
