function [] = showSingleResult(matrix, pas, headTitle, typePlot)

x = 0:pas:((size(matrix, 1) - 1)*pas);
y = 0:pas:((size(matrix, 2) - 1)*pas);

figure

switch typePlot
    case 1
        pcolor(x, y, matrix')
    case 2
        contour(x, y, matrix', 'LevelStep', 1000)
    otherwise
        error('Error in choosing the type of display.');
end

title(headTitle);
xlabel('x')
ylabel('y')

colorbar
axis equal

end
