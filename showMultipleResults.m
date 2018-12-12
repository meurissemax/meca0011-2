function [] = showMultipleResults(cell, typePlot, nbrFiles, h, varargin)

if(nbrFiles < 1)
    error('Error in input parameters');
end

[x, y] = deal(cell(1, nbrFiles));

figure

for i = 1:nbrFiles
    x{i} = 0:h(i):((size(cell{i}, 1) - 1)*h(i));
    y{i} = 0:h(i):((size(cell{i}, 2) - 1)*h(i));
    
    subplot(2, 2, i)
    
    switch typePlot
        case 1
            pcolor(x{i}, y{i}, cell{i}')
        case 2
            contour(x{i}, y{i}, cell{i}')
        case 3
            contourf(x{i}, y{i}, cell{i}')
        case 4
            if(nargin == 5)
                quiver(x{i}, y{i}, cell{i}', varargin{1}{i}')
                hold on
                streamslice(x{i}, y{i}, cell{i}', varargin{1}{i}')
                hold off
            end
        otherwise
            error('Error in choosing the type of display.');
    end
    
    colorbar
    axis equal
end

end
