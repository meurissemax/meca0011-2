function [u, v] = getSpeed(dom, laplacian, h)

dim = size(dom);

[u, v] = deal(zeros(dim));

for i = 2:dim(1) - 1
    for j = 2:dim(2)- 1
        if(dom(i, j) ~= 0)
            u(i, j) = deriv(laplacian(i, j-1), laplacian(i, j), laplacian(i, j+1), dom(i, j-1), dom(i, j), dom(i, j+1), h);
            v(i, j) = -deriv(laplacian(i-1, j), laplacian(i, j), laplacian(i+1, j), dom(i-1, j), dom(i, j), dom(i+1, j), h);
        else
            u(i, j) = NaN;
            v(i, j) = NaN;
        end
    end
end

end
